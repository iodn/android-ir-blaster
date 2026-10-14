package org.nslabs.ir_blaster

import android.app.Application
import android.hardware.usb.UsbManager
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import java.util.concurrent.CountDownLatch

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class, shadows = [RecordingUsbConnection::class])
class TiqiaaUsbLearnerTest {
    private lateinit var learner: TiqiaaUsbLearner
    private val aggregate = ByteArray(1024)
    private var length = 0

    @Before fun open() {
        RecordingUsbConnection.opens.set(0)
        RecordingUsbConnection.closes.set(0)
        RecordingUsbConnection.writes.clear()
        RecordingUsbConnection.failWrites = false
        RecordingUsbConnection.shortWrites = false
        RecordingUsbConnection.elkReply = true
        RecordingUsbConnection.continuousInput = false
        RecordingUsbConnection.started = CountDownLatch(1)
        RecordingUsbConnection.release = CountDownLatch(0)
        val manager = RuntimeEnvironment.getApplication().getSystemService(UsbManager::class.java)
        val device = usbDevice("/dev/bus/usb/tiqiaa-test", 0x10c4, 0x8468)
        shadowOf(manager).addOrUpdateUsbDevice(device, true)
        learner = requireNotNull(TiqiaaUsbLearner.open(manager, device))
    }

    @After fun close() { learner.close() }

    private fun hex(value: String) = value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()

    private fun parse(frame: ByteArray): Any? = learner.javaClass
        .getDeclaredMethod("parseFrame", ByteArray::class.java)
        .apply { isAccessible = true }.invoke(learner, frame)

    private fun preview(frame: ByteArray): IntArray = learner.javaClass
        .getDeclaredMethod("decodePreviewPattern", ByteArray::class.java)
        .apply { isAccessible = true }.invoke(learner, frame) as IntArray

    private fun payload(parsed: Any): ByteArray = parsed.javaClass.getDeclaredMethod("getPayload")
        .apply { isAccessible = true }.invoke(parsed) as ByteArray

    private fun packet(env: Int, count: Int, index: Int, body: ByteArray): ByteArray =
        byteArrayOf(1, (body.size + 3).toByte(), env.toByte(), count.toByte(), index.toByte()) + body

    private fun feed(packet: ByteArray, receivedLength: Int = packet.size): ByteArray? {
        val result = learner.javaClass.getDeclaredMethod(
            "processInboundPacket", ByteArray::class.java, ByteArray::class.java, Int::class.javaPrimitiveType,
            Int::class.javaPrimitiveType,
        ).apply { isAccessible = true }.invoke(learner, packet, aggregate, length, receivedLength) as Int
        length = if (result < 0) 0 else result
        return if (result < 0) aggregate.copyOf(-result) else null
    }

    private fun first() = hex("5354014400") + ByteArray(51) { 0x81.toByte() }

    private fun alternatingFirst() = hex("5354014400") +
        ByteArray(51) { if (it % 2 == 0) 0x81.toByte() else 0x01 }

    @Test fun emptyAndSpaceOnlyCapturesAreRejected() {
        for (frame in listOf("5354014400454e", "53540144000102454e", "53540144000080454e")) {
            assertNull(parse(hex(frame)))
        }
        // Do not invent a minimum duration or protocol-specific pulse count.
        assertNotNull(parse(hex("535401440081454e")))
    }

    @Test fun binaryEndMarkerDoesNotTruncateCapture() {
        val frame = hex("5354014400a3454ea3454e")
        assertArrayEquals(frame, payload(requireNotNull(parse(frame))))
        assertArrayEquals(intArrayOf(560, 2352, 560), preview(frame))
    }

    @Test fun frameMustUseCompleteAggregateBoundaries() {
        val frame = hex("5354014400a323a3454e")
        assertNull(parse(byteArrayOf(0) + frame))
        assertNull(parse(frame + byteArrayOf(0)))
        assertNull(parse(frame.copyOf(frame.size - 1)))
        assertNotNull(parse(hex("5354025213454e")))
    }

    @Test fun zeroDurationBytesDoNotInventPolarityChanges() {
        assertArrayEquals(intArrayOf(48, 16, 16), preview(hex("5354014400008100820181454e")))
        assertArrayEquals(intArrayOf(), preview(hex("5354014400018001454e")))
        assertArrayEquals(intArrayOf(4064, 16, 16), preview(hex("5354014400ffff0181454e")))
    }

    @Test fun unrelatedAckCannotCompleteCapture() {
        assertNull(feed(packet(1, 2, 1, first())))
        val ack = hex("5354025213454e")
        assertArrayEquals(ack, feed(packet(2, 1, 1, ack)))
    }

    @Test fun mixedAckCannotBecomeFiftyTwoDurationCapture() {
        // Previously decoded as 51 alternating 16us runs followed by a 4320us space.
        assertNull(feed(packet(1, 2, 1, alternatingFirst())))
        val ack = hex("5354025213454e")
        val result = requireNotNull(feed(packet(2, 1, 1, ack)))
        assertArrayEquals(ack, result)
        val parsed = requireNotNull(parse(result))
        val type = parsed.javaClass.getDeclaredMethod("getType")
            .apply { isAccessible = true }.invoke(parsed)
        assertEquals(2, type)
    }

    @Test fun fullSizedFragmentedCapturePreservesEveryDuration() {
        val start = alternatingFirst()
        val end = hex("0181454e")
        assertEquals(56, start.size)
        assertNull(feed(packet(7, 2, 1, start)))
        val result = requireNotNull(feed(packet(7, 2, 2, end)))
        assertArrayEquals(start + end, payload(requireNotNull(parse(result))))
        assertArrayEquals(IntArray(53) { 16 }, preview(result))
    }

    @Test fun identityCountAndOrderMustMatch() {
        for ((env, count, index) in listOf(Triple(2, 2, 2), Triple(1, 3, 2), Triple(1, 2, 3))) {
            assertNull(feed(packet(1, 2, 1, first())))
            assertNull(feed(packet(env, count, index, hex("01454e"))))
            assertEquals(0, length)
            assertNull(feed(packet(1, 2, 2, hex("01454e"))))
        }
    }

    @Test fun malformedPacketsResetAssemblyAndFreshStartRecovers() {
        for (bad in listOf(byteArrayOf(1), packet(1, 0, 0, hex("454e")),
            packet(1, 2, 2, hex("01454e")).copyOf(6))) {
            assertNull(feed(packet(1, 2, 1, first())))
            assertNull(feed(bad))
            assertEquals(0, length)
            assertNull(feed(packet(1, 2, 2, hex("01454e"))))
            val frame = hex("5354014400a323a3454e")
            assertArrayEquals(frame, feed(packet(3, 1, 1, frame)))
        }
    }

    @Test fun shortNonfinalFragmentWaitsForDeclaredFinalFragment() {
        val frame = hex("5354014400a323a3454e")
        assertNull(feed(packet(1, 2, 1, frame.copyOfRange(0, 6))))
        assertArrayEquals(frame, feed(packet(1, 2, 2, frame.copyOfRange(6, frame.size))))
    }

    @Test fun actualReadLengthNotBackingArrayCapacityBoundsPayload() {
        val frame = hex("535401440081454e")
        val padded = packet(1, 1, 1, frame).copyOf(64)
        assertNull(feed(padded, 11))
        assertEquals(0, length)
        assertArrayEquals(frame, feed(padded, 13))
        assertNull(feed(padded, 4))
    }

    @Test fun duplicateFragmentAndOverflowDropAssembly() {
        assertNull(feed(packet(1, 3, 1, first())))
        assertNull(feed(packet(1, 3, 2, byteArrayOf(0x81.toByte()))))
        assertNull(feed(packet(1, 3, 2, byteArrayOf(0x81.toByte()))))
        assertEquals(0, length)
        for (index in 1..19) assertNull(feed(packet(1, 20, index, first())))
        assertEquals(0, length)
        assertNull(feed(packet(1, 20, 20, hex("454e"))))
    }
}
