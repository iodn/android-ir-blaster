package org.nslabs.ir_blaster

import android.app.Application
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import java.io.File
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicInteger

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28, 34], application = Application::class, shadows = [RecordingIrManager::class])
class AutomationMacroTest {
    private val context get() = RuntimeEnvironment.getApplication()
    private val labels = mapOf("running" to "Running", "stop" to "Stop", "completed" to "Done",
        "failed" to "Error", "cancelled" to "Stopped")
    private val send = WidgetMacroStep(frequencyHz = 38000, pattern = intArrayOf(9000, 4500, 560))
    private fun mapping() = IrButtonWidgetMapping("m", "Macro", "TV", 0, intArrayOf(), "m",
        false, listOf(send, send), labels)

    @Before fun reset() {
        for (name in listOf("FlutterSharedPreferences", "automation_macros"))
            context.getSharedPreferences(name, Context.MODE_PRIVATE).edit().clear().commit()
        IrButtonWidgetProvider.busy.set(false)
        IrMacroWidgetService.automationPending.set(false)
        RecordingIrManager.available = true
        RecordingIrManager.fail = false
        RecordingIrManager.calls.set(0)
        RecordingIrManager.release = CountDownLatch(0)
    }

    private fun enable(value: Boolean = true) {
        context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE).edit()
            .putBoolean(IrAutomationReceiver.PREF_ENABLED, value).commit()
    }

    private fun save(mapping: IrButtonWidgetMapping = mapping()) {
        val macros = File(context.filesDir, "macros.json").apply { writeText("macros-v1") }
        val remotes = File(context.filesDir, "remotes.json").apply { writeText("remotes-v1") }
        assertTrue(AutomationMacroStore.save(context, mapOf(
            "macrosPath" to macros.path, "macrosSource" to macros.readText(),
            "remotesPath" to remotes.path, "remotesSource" to remotes.readText(),
            "mappings" to mapOf("m" to org.json.JSONObject(mapping.toJson().toString())))))
    }

    private fun intent() = Intent(context, IrAutomationReceiver::class.java)
        .setAction(IrAutomationReceiver.ACTION_RUN_MACRO).putExtra("macro_id", "m")

    private fun dispatch(intent: Intent = intent()): Pair<Int, String?> {
        val result = AtomicInteger(Int.MIN_VALUE)
        var message: String? = null
        context.sendOrderedBroadcast(intent, null, object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                message = resultData
                result.set(resultCode)
            }
        }, Handler(Looper.getMainLooper()), 0, null, null)
        val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5)
        while (result.get() == Int.MIN_VALUE && System.nanoTime() < deadline) {
            shadowOf(Looper.getMainLooper()).idle()
            Thread.sleep(5)
        }
        assertNotEquals("Broadcast did not finish", Int.MIN_VALUE, result.get())
        return result.get() to message
    }

    @Test fun disabledRejectsWithoutStartingAnything() {
        save()
        assertEquals(1 to "DISABLED", dispatch())
        assertNull(shadowOf(context).nextStartedService)
        assertNull(shadowOf(context).nextStartedActivity)
    }

    @Test fun missingAndInvalidExtrasAreRejected() {
        enable()
        assertEquals(2, dispatch(intent().apply { removeExtra("macro_id") }).first)
        assertEquals(2, dispatch(intent().putExtra("emitter", "unknown")).first)
        assertEquals(2, dispatch(intent().putExtra("emitter", 3)).first)
    }

    @Test fun unavailableStaleAndManualMacrosNeverStart() {
        enable()
        assertEquals(15 to "MACROS_NOT_READY", dispatch())
        save()
        assertEquals(15 to "MACRO_NOT_FOUND", dispatch(intent().putExtra("macro_id", "missing")))
        File(context.filesDir, "remotes.json").writeText("changed")
        assertEquals(15 to "MACROS_NOT_READY", dispatch())
        save(mapping().copy(manual = true, steps = emptyList()))
        assertEquals(15 to "MANUAL_STEPS_UNSUPPORTED", dispatch())
        assertNull(shadowOf(context).nextStartedService)
    }

    @Test fun validRequestDefaultsToInternalAndDoesNotOpenApp() {
        save(); enable()
        assertEquals(0 to "START_REQUESTED", dispatch())
        val service = shadowOf(context).nextStartedService
        assertEquals(IrMacroWidgetService::class.java.name, service.component!!.className)
        assertEquals("m", service.getStringExtra("macro_id"))
        assertEquals("INTERNAL", service.getStringExtra("emitter"))
        assertNull(shadowOf(context).nextStartedActivity)
        assertEquals(3 to "BUSY", dispatch())
    }

    @Test fun explicitEmittersPreserved() {
        save(); enable()
        for (emitter in listOf("USB", "AUDIO_1_LED", "AUDIO_2_LED")) {
            IrMacroWidgetService.automationPending.set(false)
            assertEquals(0, dispatch(intent().putExtra("emitter", emitter)).first)
            assertEquals(emitter, shadowOf(context).nextStartedService.getStringExtra("emitter"))
        }
    }

    @Test fun sharedBusyAndAudioPreflightRejectWithoutSending() {
        save(); enable()
        IrButtonWidgetProvider.busy.set(true)
        assertEquals(3, dispatch().first)
        IrButtonWidgetProvider.busy.set(false)
        save(mapping().copy(steps = listOf(send, send.copy(frequencyHz = 100000))))
        assertEquals(2, dispatch(intent().putExtra("emitter", "AUDIO_1_LED")).first)
        assertEquals(0, RecordingIrManager.calls.get())
        assertNull(shadowOf(context).nextStartedService)
    }

    @Test fun serviceExecutesAndRechecksOptIn() {
        save(); enable()
        val controller = Robolectric.buildService(IrMacroWidgetService::class.java).create()
        val request = intent().setClass(context, IrMacroWidgetService::class.java)
        val service = controller.get()
        service.onStartCommand(request, 0, 1)
        waitForWorker()
        assertEquals(2, RecordingIrManager.calls.get())
        assertFalse(RecordingIrManager.mainThread)
        enable(false)
        service.onStartCommand(request, 0, 2)
        assertEquals(2, RecordingIrManager.calls.get())
        assertNull(shadowOf(context).nextStartedActivity)
        controller.destroy()
    }

    @Test fun duplicateRequestsDoNotCancelButDisablingStopsDuringDelay() {
        save(mapping().copy(steps = listOf(WidgetMacroStep(delayMs = 60000), send))); enable()
        val controller = Robolectric.buildService(IrMacroWidgetService::class.java).create()
        val request = intent().setClass(context, IrMacroWidgetService::class.java)
        val service = controller.get()
        service.onStartCommand(request, 0, 1)
        service.onStartCommand(request, 0, 2)
        Thread.sleep(150)
        assertTrue(IrButtonWidgetProvider.busy.get())
        enable(false)
        waitForWorker()
        assertEquals(0, RecordingIrManager.calls.get())
        controller.destroy()
    }

    private fun waitForWorker() {
        val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5)
        while (IrButtonWidgetProvider.busy.get() && System.nanoTime() < deadline) Thread.sleep(5)
        shadowOf(Looper.getMainLooper()).idle()
        assertFalse("Worker did not finish", IrButtonWidgetProvider.busy.get())
    }
}
