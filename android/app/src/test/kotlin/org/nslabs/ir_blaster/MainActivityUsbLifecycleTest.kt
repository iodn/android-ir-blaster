package org.nslabs.ir_blaster

import android.app.Application
import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbManager
import android.os.Looper
import android.os.SystemClock
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.util.ReflectionHelpers.getField
import org.robolectric.util.ReflectionHelpers.setField
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class, shadows = [RecordingUsbConnection::class])
class MainActivityUsbLifecycleTest {
    private lateinit var activity: MainActivity
    private lateinit var manager: UsbManager
    private lateinit var device: UsbDevice

    @Before fun setup() {
        // Attach without starting Flutter or its native engine.
        activity = Robolectric.buildActivity(MainActivity::class.java).get()
        val context = RuntimeEnvironment.getApplication()
        manager = context.getSystemService(UsbManager::class.java)
        device = usbDevice("/dev/bus/usb/001/002", 0x045c, 0x0134)
        shadowOf(manager).addOrUpdateUsbDevice(device, true)
        setField(activity, "usbManager", manager)
        setField(activity, "usbDiscovery", UsbDiscoveryManager(context, manager))
        RecordingUsbConnection.opens.set(0)
        RecordingUsbConnection.closes.set(0)
        RecordingUsbConnection.writes.clear()
        RecordingUsbConnection.failWrites = false
        RecordingUsbConnection.shortWrites = false
        RecordingUsbConnection.elkReply = true
        RecordingUsbConnection.continuousInput = false
        RecordingUsbConnection.started = CountDownLatch(1)
        RecordingUsbConnection.release = CountDownLatch(0)
    }

    @After fun cleanup() {
        RecordingUsbConnection.release.countDown()
        getField<UsbIrTransmitter?>(activity, "usbTransmitter")?.close()
    }

    private fun invoke(name: String, vararg args: Any): Any? =
        MainActivity::class.java.declaredMethods.single { it.name == name }.let {
            it.isAccessible = true
            it.invoke(activity, *args)
        }

    private fun operation() = getField<MainActivity.UsbLearningOperation?>(activity, "usbLearningOperation")

    private fun begin(): Any? = invoke("beginUsbLearningSession", { _: UsbDevice -> true })

    private fun finish(operation: MainActivity.UsbLearningOperation, complete: () -> Unit) {
        invoke("endUsbLearningSession", operation, "test_finished", complete)
    }

    @Test fun preparationReservesBusyBeforeLearnerExistsAndRejectsReplay() {
        assertEquals(device, begin())
        assertNotNull(operation())
        assertNull(begin())
        assertNull(invoke("openUsbDevice", device))
        val learn = Result()
        invoke("handleLearnUsbSignal", MethodCall("learnUsbSignal", null), learn)
        assertEquals("LEARN_BUSY", learn.error)
        val replay = Result()
        invoke("handleReplayLearnedUsbSignal", MethodCall("replayLearnedUsbSignal", mapOf(
            "family" to "elksmart", "opaqueFrameBase64" to "AQAAAA==",
        )), replay)
        assertEquals("LEARN_BUSY", replay.error)
        assertEquals(0, RecordingUsbConnection.opens.get())
    }

    @Test fun cancellationStaysLatchedAndAcknowledgesOnlyAfterCompletion() {
        begin()
        val first = operation()!!
        val cancel = Result()
        invoke("handleCancelUsbLearning", cancel)
        assertTrue(first.cancelled)
        assertFalse(cancel.completed)
        assertNull(begin())
        shadowOf(manager).removeUsbDevice(device)
        var delivered = false
        val worker = Thread {
            finish(first) {
                assertNull(operation())
                assertTrue(first.cancelled)
                assertFalse(cancel.completed)
                delivered = true
            }
        }.also { it.start() }
        worker.join(3000)
        assertFalse(worker.isAlive)
        assertSame(first, operation())
        assertFalse(delivered)
        shadowOf(Looper.getMainLooper()).idle()
        assertTrue(delivered)
        assertEquals(true, cancel.value)
        shadowOf(manager).addOrUpdateUsbDevice(device, true)
        assertEquals(device, begin())
        assertFalse(operation()!!.cancelled)
        assertTrue(first.cancelled)
    }

    @Test fun activeOperationIsPublishedAndCancelDoesNotRunProtocolOnUiThread() {
        RecordingUsbConnection.release = CountDownLatch(1)
        val learned = Result()
        invoke("handleLearnUsbSignal", MethodCall("learnUsbSignal", mapOf("timeoutMs" to 1000)), learned)
        assertTrue(RecordingUsbConnection.started.await(3, TimeUnit.SECONDS))
        val active = operation()!!
        assertTrue(UsbDeviceAccess.isOwned(device.deviceName))
        val cancel = Result()
        invoke("handleCancelUsbLearning", cancel)
        assertTrue(active.cancelled)
        assertFalse(cancel.completed)
        assertFalse(learned.completed)
        // Do not restore a transmitter; the test isolates learner shutdown.
        shadowOf(manager).removeUsbDevice(device)
        RecordingUsbConnection.release.countDown()
        val deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3)
        while (!cancel.completed && System.nanoTime() < deadline) {
            shadowOf(Looper.getMainLooper()).idle()
            Thread.sleep(5)
        }
        assertTrue(cancel.completed)
        assertTrue(learned.completed)
        assertNull(learned.error)
        assertNull(learned.value)
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
    }

    @Test fun staleOrDestroyedCompletionCannotPublishOrClearAnotherOperation() {
        begin()
        val old = operation()!!
        val replacement = MainActivity.UsbLearningOperation()
        setField(activity, "usbLearningOperation", replacement)
        finish(old) { fail("Stale result delivered") }
        assertSame(replacement, operation())
        setField(activity, "usbActivityDestroyed", true)
        finish(replacement) { fail("Destroyed result delivered") }
        assertEquals(0, RecordingUsbConnection.opens.get())
    }

    @Test fun restorationDeadlineBoundsContinuousInputAndReleasesBusy() {
        begin()
        val active = operation()!!
        RecordingUsbConnection.continuousInput = true
        val started = SystemClock.uptimeMillis()
        var delivered = false
        finish(active) { delivered = true }
        assertTrue(delivered)
        assertNull(operation())
        assertNull(getField<UsbIrTransmitter?>(activity, "usbTransmitter"))
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
        assertTrue(SystemClock.uptimeMillis() - started < 4000L)
    }

    @Test fun completionCanImmediatelyAcquireAndSendThroughRestoredTransmitterForBothFamilies() {
        for (elk in listOf(true, false)) {
            shadowOf(manager).removeUsbDevice(device)
            device = usbDevice("/dev/bus/usb/001/002", if (elk) 0x045c else 0x10c4, if (elk) 0x0134 else 0x8468)
            shadowOf(manager).addOrUpdateUsbDevice(device, true)
            assertEquals(device, begin())
            var delivered = false
            finish(operation()!!) {
                assertNull(operation())
                val restored = getField<UsbIrTransmitter?>(activity, "usbTransmitter")
                assertNotNull(restored)
                val opens = RecordingUsbConnection.opens.get()
                val acquired = invoke("getOrOpenUsbTransmitterOrRequest") as UsbIrTransmitter?
                assertSame(restored, acquired)
                assertTrue(acquired!!.transmitRaw(38000, intArrayOf(9000, 4500, 560, 560, 560, 560)))
                assertEquals(opens, RecordingUsbConnection.opens.get())
                delivered = true
            }
            assertTrue(delivered)
        }
    }

    private class Result : MethodChannel.Result {
        var completed = false
        var value: Any? = null
        var error: String? = null
        override fun success(result: Any?) { completed = true; value = result }
        override fun error(code: String, message: String?, details: Any?) { completed = true; error = code }
        override fun notImplemented() { fail("Unexpected notImplemented") }
    }
}
