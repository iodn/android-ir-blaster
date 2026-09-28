package org.nslabs.ir_blaster

import android.app.Activity
import android.app.Application
import android.appwidget.AppWidgetManager
import android.content.*
import android.hardware.usb.UsbManager
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Handler
import android.os.Looper
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.nslabs.ir_blaster.audio.AudioPcmBuilder
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.shadows.AudioDeviceInfoBuilder
import org.robolectric.shadows.ShadowToast
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicInteger

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class, shadows = [
    RecordingIrManager::class, RecordingUsbConnection::class, RecordingAudioTrack::class,
])
class IrButtonWidgetProviderTest {
    private val context get() = RuntimeEnvironment.getApplication()
    private val pattern = intArrayOf(9000, 4500, 560)
    private val prefs get() = context.getSharedPreferences("ir_blaster_prefs", Context.MODE_PRIVATE)

    @Before fun reset() {
        prefs.edit().clear().putBoolean("auto_switch", false).commit()
        context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE).edit().clear().commit()
        context.getSharedPreferences("ir_button_widgets", Context.MODE_PRIVATE).edit().clear().commit()
        IrButtonWidgetStore.saveMapping(context, 42, IrButtonWidgetMapping("button", "Power", "TV", 38000, pattern))
        RecordingIrManager.available = true
        RecordingIrManager.fail = false
        RecordingIrManager.pattern = null
        RecordingIrManager.calls.set(0)
        RecordingIrManager.started = CountDownLatch(1)
        RecordingIrManager.release = CountDownLatch(0)
        RecordingUsbConnection.opens.set(0)
        RecordingUsbConnection.closes.set(0)
        RecordingUsbConnection.writes.clear()
        RecordingUsbConnection.failWrites = false
        RecordingUsbConnection.shortWrites = false
        RecordingUsbConnection.elkReply = true
        RecordingUsbConnection.continuousInput = false
        RecordingUsbConnection.started = CountDownLatch(1)
        RecordingUsbConnection.release = CountDownLatch(0)
        RecordingAudioTrack.samples = shortArrayOf()
        RecordingAudioTrack.releases = 0
        RecordingAudioTrack.acceptRoute = true
        RecordingAudioTrack.partialWrite = false
        RecordingAudioTrack.stalled = false
        RecordingAudioTrack.onPlay = null
        RecordingAudioTrack.started = CountDownLatch(1)
        RecordingAudioTrack.finish = CountDownLatch(0)
    }

    @After fun cleanup() {
        RecordingIrManager.release.countDown()
        RecordingUsbConnection.release.countDown()
        RecordingAudioTrack.finish.countDown()
        assertNull("Configured widget must never open an activity", shadowOf(context).nextStartedActivity)
    }

    private fun dispatch(action: String = IrButtonWidgetProvider.ACTION_SEND): AtomicInteger {
        val result = AtomicInteger(Int.MIN_VALUE)
        val intent = Intent(context, IrButtonWidgetProvider::class.java).setAction(action)
            .putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, 42)
        context.sendOrderedBroadcast(intent, null, object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) { result.set(resultCode) }
        }, Handler(Looper.getMainLooper()), 0, null, null)
        shadowOf(Looper.getMainLooper()).idle()
        return result
    }

    private fun await(result: AtomicInteger): Int {
        val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5)
        while (result.get() == Int.MIN_VALUE && System.nanoTime() < deadline) {
            shadowOf(Looper.getMainLooper()).idle()
            Thread.sleep(5)
        }
        assertNotEquals("Widget broadcast did not finish", Int.MIN_VALUE, result.get())
        return result.get()
    }

    private fun select(emitter: String) { prefs.edit().putString("tx_type", emitter).commit() }
    private fun attachUsb(permission: Boolean = true) {
        shadowOf(context.getSystemService(UsbManager::class.java)).addOrUpdateUsbDevice(
            usbDevice("/dev/bus/usb/001/002", 0x10c4, 0x8468), permission)
    }
    private fun attachAudio() {
        val audio = context.getSystemService(AudioManager::class.java)
        audio.setStreamVolume(AudioManager.STREAM_MUSIC, 8, 0)
        shadowOf(audio).setIsStreamMute(AudioManager.STREAM_MUSIC, false)
        shadowOf(audio).setOutputDevices(listOf(AudioDeviceInfoBuilder.newBuilder()
            .setType(AudioDeviceInfo.TYPE_USB_DEVICE).build()))
    }

    @Test fun internalSendsOnceOffMainThreadWithoutAutomationOptIn() {
        assertEquals(Activity.RESULT_OK, await(dispatch()))
        assertEquals(1, RecordingIrManager.calls.get())
        assertArrayEquals(pattern, RecordingIrManager.pattern)
        assertFalse(RecordingIrManager.mainThread)
    }

    @Test fun usbSelectionDoesNotUseAvailableInternalEmitter() {
        select("USB")
        attachUsb()
        assertEquals(Activity.RESULT_OK, await(dispatch()))
        assertTrue(RecordingUsbConnection.writes.isNotEmpty())
        assertEquals(RecordingUsbConnection.opens.get(), RecordingUsbConnection.closes.get())
        assertEquals(0, RecordingIrManager.calls.get())
    }

    @Test fun bothAudioModesUseSavedPreferenceAndExistingPcm() {
        attachAudio()
        for (mode in listOf<Short>(1, 2)) {
            select("AUDIO_${mode}_LED")
            assertEquals(Activity.RESULT_OK, await(dispatch()))
            assertArrayEquals(AudioPcmBuilder(38000, pattern, mode).pcm, RecordingAudioTrack.samples)
            assertEquals(mode.toInt(), RecordingAudioTrack.channels)
        }
        assertEquals(2, RecordingAudioTrack.releases)
        assertEquals(0, RecordingIrManager.calls.get())
    }

    @Test fun missingHardwareAndPermissionsNeverOpenApp() {
        RecordingIrManager.available = false
        assertEquals(AutomationResult.NO_IR.code, await(dispatch()))
        select("USB")
        assertEquals(AutomationResult.NO_USB_DEVICE.code, await(dispatch()))
        attachUsb(false)
        assertEquals(AutomationResult.USB_PERMISSION_REQUIRED.code, await(dispatch()))
        assertEquals(0, RecordingUsbConnection.opens.get())
        select("AUDIO_1_LED")
        assertEquals(AutomationResult.NO_AUDIO_OUTPUT.code, await(dispatch()))
        attachAudio()
        context.getSystemService(AudioManager::class.java).setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0)
        assertEquals(AutomationResult.AUDIO_MUTED.code, await(dispatch()))
    }

    @Test fun autoSwitchUsesUsbThenInternalAfterDetach() {
        prefs.edit().putBoolean("auto_switch", true).commit()
        attachUsb()
        assertEquals(Activity.RESULT_OK, await(dispatch()))
        assertEquals(0, RecordingIrManager.calls.get())
        val usb = context.getSystemService(UsbManager::class.java)
        usb.deviceList.values.toList().forEach { shadowOf(usb).removeUsbDevice(it) }
        assertEquals(Activity.RESULT_OK, await(dispatch()))
        assertEquals(1, RecordingIrManager.calls.get())
    }

    @Test fun audioSelectionNeverAutoSwitchesToUsb() {
        select("AUDIO_2_LED")
        prefs.edit().putBoolean("auto_switch", true).commit()
        attachAudio()
        attachUsb()
        assertEquals(Activity.RESULT_OK, await(dispatch()))
        assertEquals(0, RecordingUsbConnection.opens.get())
        assertEquals(2, RecordingAudioTrack.channels)
    }

    @Test fun failureFinishesAndNextTapCanSucceed() {
        RecordingIrManager.fail = true
        assertEquals(AutomationResult.TRANSMIT_FAILED.code, await(dispatch()))
        RecordingIrManager.fail = false
        assertEquals(Activity.RESULT_OK, await(dispatch()))
    }

    @Test fun overlappingTapsAreRejectedNotQueued() {
        RecordingIrManager.release = CountDownLatch(1)
        val first = dispatch()
        assertTrue(RecordingIrManager.started.await(5, TimeUnit.SECONDS))
        try { assertEquals(AutomationResult.BUSY.code, await(dispatch())) }
        finally { RecordingIrManager.release.countDown() }
        assertEquals(Activity.RESULT_OK, await(first))
        assertEquals(1, RecordingIrManager.calls.get())
    }

    @Test fun invalidSavedPatternDoesNotTransmit() {
        IrButtonWidgetStore.saveMapping(context, 42,
            IrButtonWidgetMapping("button", "Power", "TV", 38000, intArrayOf(2000000)))
        assertEquals(AutomationResult.TRANSMIT_FAILED.code, await(dispatch()))
        assertEquals(0, RecordingIrManager.calls.get())
    }

    @Test fun providerRemainsPrivateAndUnknownActionsDoNotSend() {
        assertFalse(context.packageManager.getReceiverInfo(ComponentName(context, IrButtonWidgetProvider::class.java), 0).exported)
        assertEquals(0, await(dispatch("unknown.ACTION")))
        assertEquals(0, RecordingIrManager.calls.get())
    }

    @Test fun unconfiguredWidgetStillOpensTheChooser() {
        val widgets = shadowOf(AppWidgetManager.getInstance(context))
        val id = widgets.createWidget(IrButtonWidgetProvider::class.java, R.layout.ir_button_widget)
        widgets.getViewFor(id).findViewById<android.view.View>(R.id.ir_button_widget_root).performClick()
        val chooser = shadowOf(context).nextStartedActivity
        assertEquals(MainActivity::class.java.name, chooser.component?.className)
        assertEquals(id, chooser.getIntExtra(IrButtonWidgetProvider.EXTRA_CONFIGURE_WIDGET_ID, -1))
    }

    @Test fun upgradeTurnsOldMacroWidgetIntoButtonChooser() {
        val widgets = shadowOf(AppWidgetManager.getInstance(context))
        val id = widgets.createWidget(IrButtonWidgetProvider::class.java, R.layout.ir_button_widget)
        val oldMacro = org.json.JSONObject()
            .put("buttonId", "macro-id").put("macroId", "macro-id")
            .put("title", "Bedtime").put("frequencyHz", 0)
            .put("pattern", org.json.JSONArray()).put("steps", org.json.JSONArray())
        context.getSharedPreferences("ir_button_widgets", Context.MODE_PRIVATE).edit()
            .putString("mappings_v1", org.json.JSONObject().put(id.toString(), oldMacro).toString()).commit()
        assertNull(IrButtonWidgetStore.loadMapping(context, id))
        IrButtonWidgetProvider().onReceive(context, Intent(Intent.ACTION_MY_PACKAGE_REPLACED))
        widgets.getViewFor(id).findViewById<android.view.View>(R.id.ir_button_widget_root).performClick()
        val chooser = shadowOf(context).nextStartedActivity
        assertEquals(MainActivity::class.java.name, chooser.component?.className)
        assertEquals(id, chooser.getIntExtra(IrButtonWidgetProvider.EXTRA_CONFIGURE_WIDGET_ID, -1))
        assertEquals(0, RecordingIrManager.calls.get())
        assertNull(shadowOf(context).nextStartedService)
    }

    @Test fun mergedManifestHasNoForegroundServicePermissionsOrMacroService() {
        val info = context.packageManager.getPackageInfo(context.packageName,
            android.content.pm.PackageManager.GET_PERMISSIONS or android.content.pm.PackageManager.GET_SERVICES)
        assertFalse(info.requestedPermissions.orEmpty().any { it.contains("FOREGROUND_SERVICE") })
        assertFalse(info.services.orEmpty().any {
            it.name.endsWith("IrMacroWidgetService") || it.name.endsWith("SystemForegroundService")
        })
        val receiver = IrAutomationReceiver()
        context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE).edit()
            .putBoolean(IrAutomationReceiver.PREF_ENABLED, true).commit()
        receiver.onReceive(context, Intent("org.irblaster.RUN_MACRO").putExtra("macro_id", "old"))
        assertNull(shadowOf(context).nextStartedService)
        assertEquals(0, RecordingIrManager.calls.get())
    }

    @Test fun actualConfiguredWidgetClickSendsWithoutAnActivity() {
        val manager = AppWidgetManager.getInstance(context)
        val widgets = shadowOf(manager)
        val id = widgets.createWidget(IrButtonWidgetProvider::class.java, R.layout.ir_button_widget)
        IrButtonWidgetStore.saveMapping(context, id, IrButtonWidgetMapping("button", "Power", "TV", 38000, pattern))
        IrButtonWidgetProvider.updateWidget(context, manager, id)
        widgets.getViewFor(id).findViewById<android.view.View>(R.id.ir_button_widget_root).performClick()
        val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5)
        while (ShadowToast.getTextOfLatestToast() != "Sent Power" && System.nanoTime() < deadline) {
            shadowOf(Looper.getMainLooper()).idle()
            Thread.sleep(5)
        }
        assertEquals("Sent Power", ShadowToast.getTextOfLatestToast())
        assertEquals(1, RecordingIrManager.calls.get())
    }
}
