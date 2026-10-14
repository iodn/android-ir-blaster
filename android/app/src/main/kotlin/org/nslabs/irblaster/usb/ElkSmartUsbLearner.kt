package org.nslabs.ir_blaster

import android.hardware.usb.UsbConstants
import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbDeviceConnection
import android.hardware.usb.UsbEndpoint
import android.hardware.usb.UsbInterface
import android.hardware.usb.UsbManager
import android.os.SystemClock
import android.util.Base64
import android.util.Log
import java.util.concurrent.atomic.AtomicBoolean

class ElkSmartUsbLearner private constructor(
    val device: UsbDevice,
    private val connection: UsbDeviceConnection,
    private val claimedInterface: UsbInterface,
    private val outEndpoint: UsbEndpoint,
    private val inEndpoint: UsbEndpoint,
    private val deviceLease: UsbDeviceAccess.Lease
) : UsbLearnerSession {
    data class LearnedSignal(
        val rawPatternUs: IntArray,
        val opaqueFrame: ByteArray,
        val quality: Int = -1,
        val frequencyHzGuess: Int = 38000,
    ) {
        fun toWireMap(): Map<String, Any?> = mapOf(
            "family" to "elksmart",
            "rawPatternUs" to rawPatternUs.toList(),
            "opaqueFrameBase64" to Base64.encodeToString(opaqueFrame, Base64.NO_WRAP),
            "opaqueMeta" to 0,
            "quality" to quality,
            "frequencyHz" to frequencyHzGuess,
        )
    }

    private data class EndpointPair(val outEp: UsbEndpoint, val inEp: UsbEndpoint)

    private val tag = "ElkSmartUsbLearner"
    private val closed = AtomicBoolean(false)
    private val cancelled = AtomicBoolean(false)

    companion object {
        private val AUTHORIZE = byteArrayOf(0xFC.toByte(), 0xFC.toByte(), 0xFC.toByte(), 0xFC.toByte())
        private val AUTHORIZE_ACK = byteArrayOf(0xFA.toByte(), 0xFA.toByte(), 0xFA.toByte(), 0xFA.toByte())
        private val START_LEARN = byteArrayOf(0xFE.toByte(), 0xFE.toByte(), 0xFE.toByte(), 0xFE.toByte())
        private val STOP_LEARN = byteArrayOf(0xFD.toByte(), 0xFD.toByte(), 0xFD.toByte(), 0xFD.toByte())
        private const val AUTHORIZE_RETRY_COUNT = 3

        fun open(usb: UsbManager, device: UsbDevice): ElkSmartUsbLearner? {
            if (!UsbDeviceFilter.isElkSmart(device)) return null
            val lease = UsbDeviceAccess.reserve(device.deviceName) ?: return null
            var opened: ElkSmartUsbLearner? = null
            try {
                opened = openReserved(usb, device, lease)
                return opened
            } finally {
                if (opened == null) lease.close()
            }
        }

        private fun openReserved(usb: UsbManager, device: UsbDevice, lease: UsbDeviceAccess.Lease): ElkSmartUsbLearner? {
            for (i in 0 until device.interfaceCount) {
                val intf = device.getInterface(i)
                val pair = findEndpointPair(intf) ?: continue
                val conn = usb.openDevice(device) ?: return null
                if (!conn.claimInterface(intf, true)) {
                    try {
                        conn.close()
                    } catch (_: Throwable) {
                    }
                    continue
                }
                return ElkSmartUsbLearner(device, conn, intf, pair.outEp, pair.inEp, lease)
            }
            return null
        }

        fun decodeOpaqueFrameToPattern(frame: ByteArray): IntArray {
            if (frame.isEmpty()) return IntArray(0)
            require(frame.size % 4 == 0) { "Opaque ElkSmart frame length must be a multiple of 4 bytes" }
            val out = IntArray(frame.size / 4)
            var src = 0
            var dst = 0
            while (src < frame.size) {
                out[dst++] =
                    (frame[src].toInt() and 0xFF) or
                        ((frame[src + 1].toInt() and 0xFF) shl 8) or
                        ((frame[src + 2].toInt() and 0xFF) shl 16) or
                        ((frame[src + 3].toInt() and 0xFF) shl 24)
                src += 4
            }
            return out
        }

        private fun findEndpointPair(intf: UsbInterface): EndpointPair? {
            val outByNum = HashMap<Int, UsbEndpoint>()
            val inByNum = HashMap<Int, UsbEndpoint>()
            for (i in 0 until intf.endpointCount) {
                val ep = intf.getEndpoint(i)
                if (ep.type != UsbConstants.USB_ENDPOINT_XFER_BULK) continue
                val num = ep.address and UsbConstants.USB_ENDPOINT_NUMBER_MASK
                when (ep.direction) {
                    UsbConstants.USB_DIR_OUT -> outByNum[num] = ep
                    UsbConstants.USB_DIR_IN -> inByNum[num] = ep
                }
            }
            val match = (outByNum.keys intersect inByNum.keys).sorted().firstOrNull() ?: return null
            return EndpointPair(outByNum.getValue(match), inByNum.getValue(match))
        }
    }

    fun learn(timeoutMs: Int, cancelCheck: () -> Boolean): LearnedSignal? {
        if (closed.get()) return null
        val deadline = SystemClock.uptimeMillis() + timeoutMs.coerceAtLeast(1000).toLong()
        try {
            if (!flushInput(deadline, cancelCheck)) return null
            if (!authorize(deadline, cancelCheck)) return null
            if (shouldStop(deadline, cancelCheck)) return null
            if (!sendControl(START_LEARN)) return null

            while (!shouldStop(deadline, cancelCheck)) {
                val packet = readPacket((deadline - SystemClock.uptimeMillis()).coerceAtLeast(1).toInt().coerceAtMost(300))
                    ?: continue
                val learned = parseLearnPacket(packet, deadline, cancelCheck)
                if (learned != null) return learned
            }
            return null
        } finally {
            try {
                sendControl(STOP_LEARN)
            } catch (_: Throwable) {
            }
        }
    }

    override fun cancel() {
        cancelled.set(true)
        if (closed.get()) return
        try {
            sendControl(STOP_LEARN)
        } catch (_: Throwable) {
        }
    }

    override fun close() {
        if (!closed.compareAndSet(false, true)) return
        try {
            connection.releaseInterface(claimedInterface)
        } catch (_: Throwable) {
        }
        try {
            connection.close()
        } catch (_: Throwable) {
        }
        deviceLease.close()
    }

    private fun authorize(sessionDeadline: Long, cancelCheck: () -> Boolean): Boolean {
        repeat(AUTHORIZE_RETRY_COUNT) { attempt ->
            if (shouldStop(sessionDeadline, cancelCheck)) return false
            if (!sendControl(AUTHORIZE)) return false
            val deadline = minOf(sessionDeadline, SystemClock.uptimeMillis() + 500L)
            while (!shouldStop(deadline, cancelCheck)) {
                val packet = readPacket((deadline - SystemClock.uptimeMillis()).coerceIn(1, 120).toInt()) ?: continue
                if (shouldStop(sessionDeadline, cancelCheck)) return false
                if (packet.size == 6 && packet.hasPrefix(0xFC)) {
                    Log.i(
                        tag,
                        "authorize ok attempt=${attempt + 1} subtype=${packet[4].toInt() and 0xFF} ${packet[5].toInt() and 0xFF}"
                    )
                    sendControl(AUTHORIZE_ACK)
                    return true
                }
            }
            Log.w(tag, "authorize attempt ${attempt + 1} timed out")
            if (!flushInput(sessionDeadline, cancelCheck)) return false
        }
        Log.w(tag, "authorize timeout")
        return false
    }

    private fun sendControl(bytes: ByteArray): Boolean {
        val rc = try {
            connection.bulkTransfer(outEndpoint, bytes, bytes.size, 300)
        } catch (t: Throwable) {
            Log.w(tag, "control send failed: ${t.message}")
            -1
        }
        return rc == bytes.size
    }

    private fun shouldStop(deadline: Long, cancelCheck: () -> Boolean): Boolean =
        closed.get() || cancelled.get() || cancelCheck() || SystemClock.uptimeMillis() >= deadline

    private fun flushInput(sessionDeadline: Long, cancelCheck: () -> Boolean): Boolean {
        val buf = ByteArray(maxOf(inEndpoint.maxPacketSize, 64))
        val deadline = minOf(sessionDeadline, SystemClock.uptimeMillis() + 250L)
        while (!shouldStop(deadline, cancelCheck)) {
            val rc = try {
                connection.bulkTransfer(inEndpoint, buf, buf.size,
                    (deadline - SystemClock.uptimeMillis()).coerceIn(1, 15).toInt())
            } catch (_: Throwable) {
                -1
            }
            if (rc <= 0) return !shouldStop(sessionDeadline, cancelCheck)
        }
        return false
    }

    private fun readPacket(timeoutMs: Int): ByteArray? {
        val buf = ByteArray(0x4000)
        val rc = try {
            connection.bulkTransfer(inEndpoint, buf, buf.size, timeoutMs)
        } catch (t: Throwable) {
            Log.w(tag, "read failed: ${t.message}")
            -1
        }
        if (rc <= 0) return null
        return buf.copyOf(rc)
    }

    private fun parseLearnPacket(firstPacket: ByteArray, deadline: Long, cancelCheck: () -> Boolean): LearnedSignal? {
        if (shouldStop(deadline, cancelCheck)) return null
        if (firstPacket.size <= 7 || !firstPacket.hasPrefix(0xFE)) return null
        val expected = ((firstPacket[4].toInt() and 0xFF) shl 8) or (firstPacket[5].toInt() and 0xFF)
        if (expected <= 0) return null

        val payload = ArrayList<Byte>(expected)
        appendBytes(payload, firstPacket, 6)
        while (payload.size < expected && !shouldStop(deadline, cancelCheck)) {
            val next = readPacket((deadline - SystemClock.uptimeMillis()).coerceIn(1, 250).toInt()) ?: break
            appendBytes(payload, next, 0)
        }
        if (shouldStop(deadline, cancelCheck)) return null
        if (payload.size != expected) {
            Log.w(tag, "learn payload incomplete expected=$expected actual=${payload.size}")
            return null
        }

        val opaque = decodeLearnPayload(payload) ?: return null
        val pattern = decodeOpaqueFrameToPattern(opaque)
        if (pattern.isEmpty()) return null
        return LearnedSignal(pattern, opaque)
    }

    private fun decodeLearnPayload(payload: List<Byte>): ByteArray? {
        val out = ArrayList<Byte>(payload.size * 4)
        var carry = 0
        for (byte in payload) {
            val value = byte.toInt() and 0xFF
            if (value < 0xFF) {
                val decoded = value * 0x10 + carry
                if (decoded == 0) return null
                out.add((decoded and 0xFF).toByte())
                out.add(((decoded ushr 8) and 0xFF).toByte())
                out.add(((decoded ushr 16) and 0xFF).toByte())
                out.add(((decoded ushr 24) and 0xFF).toByte())
                carry = 0
            } else {
                carry += 0xFF0
            }
        }
        if (carry != 0) return null
        return out.toByteArray()
    }

    private fun appendBytes(dst: MutableList<Byte>, src: ByteArray, start: Int) {
        for (i in start until src.size) dst.add(src[i])
    }

    private fun ByteArray.hasPrefix(byteValue: Int): Boolean {
        return size >= 4 &&
            (this[0].toInt() and 0xFF) == byteValue &&
            (this[1].toInt() and 0xFF) == byteValue &&
            (this[2].toInt() and 0xFF) == byteValue &&
            (this[3].toInt() and 0xFF) == byteValue
    }
}
