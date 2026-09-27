package org.nslabs.ir_blaster

import org.json.JSONObject
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import org.robolectric.Robolectric
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.os.Looper
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28, 34], application = android.app.Application::class,
    shadows = [RecordingIrManager::class])
class WidgetMacroTest {
    private val send = WidgetMacroStep(frequencyHz = 38000, pattern = intArrayOf(9000, 4500, 560))
    private val delay = WidgetMacroStep(delayMs = 500)
    private val labels = mapOf("running" to "Running", "stop" to "Stop", "completed" to "Completed",
        "failed" to "Error", "cancelled" to "Stopped")
    private fun mapping(manual: Boolean = false) = IrButtonWidgetMapping("m", "Macro", "TV", 0,
        intArrayOf(), "m", manual, if (manual) emptyList() else listOf(send, delay, send), labels)

    @Test fun roundTripAndLegacyButtonCompatibility() {
        for (manual in listOf(false, true)) {
            val original = mapping(manual)
            val restored = IrButtonWidgetMapping.fromJson(original.toJson())!!
            assertEquals(original.toJson().toString(), restored.toJson().toString())
        }
        val legacy = IrButtonWidgetMapping("b", "Power", "TV", 38000, send.pattern)
        assertNull(IrButtonWidgetMapping.fromJson(legacy.toJson())!!.macroId)
    }

    @Test fun malformedMacroRejectedRatherThanDroppingSteps() {
        val json = mapping().toJson()
        json.getJSONArray("steps").getJSONObject(1).put("delayMs", -1)
        assertNull(IrButtonWidgetMapping.fromJson(json))
        assertNull(IrButtonWidgetMapping.fromJson(mapping().toJson().put("manual", true)))
        assertNull(IrButtonWidgetMapping.fromJson(mapping().toJson().put("steps", "invalid")))
        assertNull(IrButtonWidgetMapping.fromJson(mapping().toJson().put("labels", JSONObject())))
    }

    @Test fun executesInOrderWithoutOpeningAnActivity() {
        val events = mutableListOf<String>()
        val result = executeWidgetMacro(listOf(send, delay, send), AutomationEmitter.INTERNAL,
            { false }, { events.add("send"); AutomationResult.SENT }, { events.add("wait:$it") })
        assertEquals(listOf("send", "wait:500", "send"), events)
        assertEquals(AutomationResult.SENT, result)
    }

    @Test fun stopsOnFirstFailure() {
        var calls = 0
        val result = executeWidgetMacro(listOf(send, delay, send), AutomationEmitter.USB,
            { false }, { calls++; AutomationResult.USB_PERMISSION_REQUIRED }, { fail("Must not delay after failure") })
        assertEquals(AutomationResult.USB_PERMISSION_REQUIRED, result)
        assertEquals(1, calls)
    }

    @Test fun cancellationDuringDelayPreventsNextSend() {
        var cancelled = false
        var calls = 0
        val result = executeWidgetMacro(listOf(send, delay, send), AutomationEmitter.INTERNAL,
            { cancelled }, { calls++; AutomationResult.SENT }, { cancelled = true })
        assertNull(result)
        assertEquals(1, calls)
    }

    @Test fun validatesAllRequestsBeforeTransmitting() {
        var calls = 0
        try {
            executeWidgetMacro(listOf(send, send.copy(frequencyHz = 90000)), AutomationEmitter.AUDIO_1_LED,
                { false }, { calls++; AutomationResult.SENT })
            fail("Audio frequency must be rejected")
        } catch (_: IllegalArgumentException) { }
        assertEquals(0, calls)
    }

    @Test fun macroServiceSendsWithoutOpeningAppAndReleasesBusyState() {
        val context = RuntimeEnvironment.getApplication()
        context.getSharedPreferences("ir_blaster_prefs", Context.MODE_PRIVATE).edit()
            .putString("tx_type", "INTERNAL").putBoolean("auto_switch", false).commit()
        RecordingIrManager.available = true
        RecordingIrManager.fail = false
        RecordingIrManager.calls.set(0)
        RecordingIrManager.release = CountDownLatch(0)
        IrButtonWidgetProvider.busy.set(false)
        IrButtonWidgetStore.saveMapping(context, 41, mapping().copy(steps = listOf(send, send)))
        val controller = Robolectric.buildService(IrMacroWidgetService::class.java).create()
        val service = controller.get()
        service.onStartCommand(Intent(context, IrMacroWidgetService::class.java)
            .putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, 41), 0, 1)
        val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5)
        while (IrButtonWidgetProvider.busy.get() && System.nanoTime() < deadline) Thread.sleep(5)
        shadowOf(Looper.getMainLooper()).idle()
        assertFalse(IrButtonWidgetProvider.busy.get())
        assertEquals(2, RecordingIrManager.calls.get())
        assertFalse(RecordingIrManager.mainThread)
        assertNull(shadowOf(context).nextStartedActivity)
        controller.destroy()
    }

    @Test fun manualWidgetOpensPrivateRunnerButAutomaticWidgetStartsService() {
        val context = RuntimeEnvironment.getApplication()
        val manager = AppWidgetManager.getInstance(context)
        val shadow = shadowOf(manager)
        val id = shadow.createWidget(IrButtonWidgetProvider::class.java, R.layout.ir_button_widget)
        IrButtonWidgetStore.saveMapping(context, id, mapping(true))
        IrButtonWidgetProvider.updateWidget(context, manager, id)
        shadow.getViewFor(id).findViewById<android.view.View>(R.id.ir_button_widget_root).performClick()
        val activity = shadowOf(context).nextStartedActivity
        assertEquals("${context.packageName}.MacroWidgetAlias", activity.component!!.className)
        assertEquals(id, activity.getIntExtra(IrMacroWidgetService.EXTRA_MACRO_WIDGET_ID, -1))
        IrButtonWidgetStore.saveMapping(context, id, mapping())
        IrButtonWidgetProvider.updateWidget(context, manager, id)
        shadow.getViewFor(id).findViewById<android.view.View>(R.id.ir_button_widget_root).performClick()
        assertNull(shadowOf(context).nextStartedActivity)
        assertEquals(IrMacroWidgetService::class.java.name, shadowOf(context).nextStartedService.component!!.className)
    }

    @Test fun tappingRunningWidgetCancelsDelayWithoutSendingOrRestarting() {
        val context = RuntimeEnvironment.getApplication()
        context.getSharedPreferences("ir_blaster_prefs", Context.MODE_PRIVATE).edit()
            .putString("tx_type", "INTERNAL").putBoolean("auto_switch", false).commit()
        RecordingIrManager.calls.set(0)
        IrButtonWidgetProvider.busy.set(false)
        IrButtonWidgetStore.saveMapping(context, 42, mapping().copy(steps = listOf(
            WidgetMacroStep(delayMs = 60000), send)))
        val controller = Robolectric.buildService(IrMacroWidgetService::class.java).create()
        val intent = Intent(context, IrMacroWidgetService::class.java)
            .putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, 42)
        val service = controller.get()
        assertEquals(android.app.Service.START_NOT_STICKY, service.onStartCommand(intent, 0, 1))
        service.onStartCommand(intent, 0, 2)
        val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5)
        while (IrButtonWidgetProvider.busy.get() && System.nanoTime() < deadline) Thread.sleep(5)
        shadowOf(Looper.getMainLooper()).idle()
        assertFalse(IrButtonWidgetProvider.busy.get())
        assertEquals(0, RecordingIrManager.calls.get())
        assertNull(shadowOf(context).nextStartedActivity)
        controller.destroy()
    }
}
