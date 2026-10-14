package org.nslabs.ir_blaster

import android.app.Application
import android.hardware.usb.*
import android.os.SystemClock
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.annotation.Implementation
import org.robolectric.annotation.Implements

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class, shadows = [ElkLearningConnection::class])
class ElkSmartUsbLearnerTest {
    private lateinit var learner: ElkSmartUsbLearner

    @Before fun open() {
        ElkLearningConnection.reset()
        val manager = RuntimeEnvironment.getApplication().getSystemService(UsbManager::class.java)
        val device = usbDevice("/dev/bus/usb/elk-learning-test", 0x045c, 0x02aa)
        shadowOf(manager).addOrUpdateUsbDevice(device, true)
        learner = requireNotNull(ElkSmartUsbLearner.open(manager, device))
    }

    @After fun close() { learner.close() }

    private fun capture(vararg payload: Int): ElkSmartUsbLearner.LearnedSignal? {
        ElkLearningConnection.packets.add(frame(payload.size, *payload))
        return learner.learn(1000) { false }
    }

    @Test fun rejectsZeroDurationsEvenWhenUiLengthAndTotalWouldPass() {
        assertNull(capture(0, 0, 0, 0, 0, 0xfe))
    }

    @Test fun rejectsUnfinishedExtensionAfterValidTimings() {
        assertNull(capture(0x23, 0x23, 0x23, 0x23, 0x23, 0x23, 0xff))
    }

    @Test fun rejectsExtensionOnlyPayload() {
        assertNull(capture(0xff, 0xff))
    }

    @Test fun replyAtAttemptDeadlineDoesNotSuppressAuthorizationRetry() {
        ElkLearningConnection.firstIdentifyNoiseMs = 500L
        ElkLearningConnection.packets.add(frame(6, 0x23, 0x23, 0x23, 0x23, 0x23, 0x23))
        val signal = requireNotNull(learner.learn(3000) { false })
        assertArrayEquals(IntArray(6) { 560 }, signal.rawPatternUs)
        assertEquals(2, ElkLearningConnection.writes.count { it == 0xfc })
    }

    @Test fun preservesValidExtensionIncludingZeroTerminator() {
        val signal = requireNotNull(capture(0xff, 0, 0xff, 0xff, 0x23, 0x23))
        assertArrayEquals(intArrayOf(4080, 8720, 560), signal.rawPatternUs)
        assertArrayEquals(signal.rawPatternUs, ElkSmartUsbLearner.decodeOpaqueFrameToPattern(signal.opaqueFrame))
    }

    @Test fun acceptsValidFragmentedPayload() {
        ElkLearningConnection.packets.add(frame(4, 0x23, 0xff))
        ElkLearningConnection.packets.add(byteArrayOf(0, 0x23))
        assertArrayEquals(intArrayOf(560, 4080, 560), learner.learn(1000) { false }!!.rawPatternUs)
    }

    @Test fun malformedCaptureIsSkippedAndNextCompleteSignalIsPreserved() {
        ElkLearningConnection.packets.add(frame(6, 0, 0, 0, 0, 0, 0xfe))
        ElkLearningConnection.packets.add(frame(7, 0x23, 0x23, 0x23, 0x23, 0x23, 0x23, 0xff))
        ElkLearningConnection.packets.add(frame(9, 0xff, 0xff, 0x34, 0xff, 0x1a, 0x23, 0x23, 0x23, 0x23))
        val signal = requireNotNull(learner.learn(1000) { false })
        assertArrayEquals(intArrayOf(8992, 4496, 560, 560, 560, 560), signal.rawPatternUs)
        assertArrayEquals(signal.rawPatternUs, ElkSmartUsbLearner.decodeOpaqueFrameToPattern(signal.opaqueFrame))
        assertEquals(3, ElkLearningConnection.captureReads)
    }

    @Test fun flushStopsOnSustainedInputBeforeStartingLearning() {
        ElkLearningConnection.flushNoise = true
        assertNull(learner.learn(1000) { false })
        assertTrue(ElkLearningConnection.flushReads <= 25)
        assertFalse(ElkLearningConnection.writes.contains(0xfe))
        assertEquals(0xfd, ElkLearningConnection.writes.last())
    }

    @Test fun flushHonorsCancellationCallback() {
        ElkLearningConnection.flushNoise = true
        assertNull(learner.learn(1000) { ElkLearningConnection.flushReads >= 2 })
        assertEquals(2, ElkLearningConnection.flushReads)
        assertFalse(ElkLearningConnection.writes.contains(0xfe))
    }

    @Test fun continuationHonorsCancellationCallback() {
        ElkLearningConnection.packets.add(frame(6, 0x23, 0x23))
        ElkLearningConnection.packets.add(byteArrayOf(0x23, 0x23, 0x23, 0x23))
        assertNull(learner.learn(1000) { ElkLearningConnection.captureReads >= 1 })
        assertEquals(1, ElkLearningConnection.captureReads)
    }

    @Test fun directCancelStopsContinuation() {
        ElkLearningConnection.packets.add(frame(6, 0x23, 0x23))
        ElkLearningConnection.packets.add(byteArrayOf(0x23, 0x23, 0x23, 0x23))
        ElkLearningConnection.onCaptureRead = { learner.cancel() }
        assertNull(learner.learn(1000) { false })
        assertEquals(1, ElkLearningConnection.captureReads)
    }

    @Test fun continuationCannotExtendLearningDeadline() {
        ElkLearningConnection.packets.add(frame(100, 0x23, 0x23))
        repeat(98) { ElkLearningConnection.packets.add(byteArrayOf(0x23)) }
        ElkLearningConnection.captureReadDelayMs = 200
        val start = SystemClock.uptimeMillis()
        assertNull(learner.learn(1000) { false })
        assertTrue(SystemClock.uptimeMillis() - start <= 1000)
        assertTrue(ElkLearningConnection.captureReads <= 5)
    }

    private fun frame(length: Int, vararg payload: Int) =
        byteArrayOf(-2, -2, -2, -2, (length ushr 8).toByte(), length.toByte()) +
            payload.map { it.toByte() }.toByteArray()
}

@Implements(UsbDeviceConnection::class)
class ElkLearningConnection {
    private var identify = false
    private var learning = false

    @Implementation fun __constructor__(device: UsbDevice) {}
    @Implementation fun claimInterface(intf: UsbInterface, force: Boolean) = true
    @Implementation fun releaseInterface(intf: UsbInterface) = true
    @Implementation fun close() {}

    @Implementation fun bulkTransfer(endpoint: UsbEndpoint, buffer: ByteArray, length: Int, timeout: Int): Int {
        if (endpoint.direction == UsbConstants.USB_DIR_OUT) {
            val command = buffer[0].toInt() and 0xff
            writes.add(command)
            if (command == 0xfc) identify = true
            if (command == 0xfe) learning = true
            return length
        }
        if (identify) {
            if (firstIdentifyNoiseMs > 0) {
                val elapsed = minOf(firstIdentifyNoiseMs, timeout.toLong())
                SystemClock.sleep(elapsed)
                firstIdentifyNoiseMs -= elapsed
                if (firstIdentifyNoiseMs == 0L) {
                    identify = false
                    buffer[0] = 0
                    return 1
                }
                return -1
            }
            identify = false
            byteArrayOf(-4, -4, -4, -4, 2, -86).copyInto(buffer)
            return 6
        }
        if (!learning) {
            flushReads++
            SystemClock.sleep(timeout.toLong())
            // Finite even on the broken baseline, so regression failures cannot hang the suite.
            return if (flushNoise && flushReads <= 100) 1 else -1
        }
        captureReads++
        SystemClock.sleep(minOf(captureReadDelayMs, timeout.toLong()))
        onCaptureRead?.invoke()
        val packet = packets.pollFirst()
        if (packet != null) {
            packet.copyInto(buffer)
            return packet.size
        }
        SystemClock.sleep(timeout.toLong())
        return -1
    }

    companion object {
        val packets = java.util.ArrayDeque<ByteArray>()
        val writes = mutableListOf<Int>()
        var flushNoise = false
        var flushReads = 0
        var captureReads = 0
        var captureReadDelayMs = 0L
        var onCaptureRead: (() -> Unit)? = null
        var firstIdentifyNoiseMs = 0L

        fun reset() {
            packets.clear()
            writes.clear()
            flushNoise = false
            flushReads = 0
            captureReads = 0
            captureReadDelayMs = 0L
            onCaptureRead = null
            firstIdentifyNoiseMs = 0L
        }
    }
}
