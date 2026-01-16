package org.nslabs.ir_blaster

import android.hardware.usb.UsbDeviceConnection
import android.hardware.usb.UsbEndpoint
import android.util.Log

interface UsbWireProtocol {
    val name: String
    val strictHandshake: Boolean
    val wantsBackgroundReader: Boolean
    val interFrameDelayMs: Long
    fun openHandshake(connection: UsbDeviceConnection, inEndpoint: UsbEndpoint, outEndpoint: UsbEndpoint): Boolean
    fun encode(frequencyHz: Int, patternUs: IntArray): List<ByteArray>
    fun postTransmitDelayMs(patternUs: IntArray): Long
    fun drainAfterTransmit(connection: UsbDeviceConnection, inEndpoint: UsbEndpoint) {}
}

object UsbProtocolFormatter : UsbWireProtocol {
    override val name: String = "legacy_bulk_st"
    override val strictHandshake: Boolean = false
    override val wantsBackgroundReader: Boolean = true
    override val interFrameDelayMs: Long = 0L

    private var e: Int = 1
    private var f: Int = 0

    @Synchronized
    private fun nextE(): Byte {
        e = if (e < 0x0F) (e + 1) else 0x01
        return e.toByte()
    }

    @Synchronized
    private fun nextF(): Byte {
        f = if (f < 0x7F) (f + 1) else 0x01
        return f.toByte()
    }

    private fun handshakeFrames(): List<ByteArray> {
        val eVal = nextE()
        val fVal = nextF()
        val frame = byteArrayOf(
            0x02,
            0x09,
            eVal,
            0x01,
            0x01,
            0x53,
            0x54,
            fVal,
            0x53,
            0x45,
            0x4E
        )
        return listOf(frame)
    }

    override fun openHandshake(
        connection: UsbDeviceConnection,
        inEndpoint: UsbEndpoint,
        outEndpoint: UsbEndpoint
    ): Boolean {
        return try {
            val tmp = ByteArray(maxOf(inEndpoint.maxPacketSize, 64))
            while (true) {
                val r = connection.bulkTransfer(inEndpoint, tmp, tmp.size, 10)
                if (r <= 0) break
            }
            for (frame in handshakeFrames()) {
                val rc = connection.bulkTransfer(outEndpoint, frame, frame.size, 250)
                if (rc <= 0) return false
            }
            val deadline = android.os.SystemClock.uptimeMillis() + 250L
            while (android.os.SystemClock.uptimeMillis() < deadline) {
                val r = connection.bulkTransfer(inEndpoint, tmp, tmp.size, 20)
                if (r <= 0) break
            }
            true
        } catch (t: Throwable) {
            Log.w("UsbProtocolFormatter", "openHandshake failed: ${t.message}")
            false
        }
    }

    override fun encode(frequencyHz: Int, patternUs: IntArray): List<ByteArray> = encode(patternUs)

    override fun postTransmitDelayMs(patternUs: IntArray): Long {
        var s = 0L
        for (v in patternUs) s += v.toLong()
        val totalUs = s.coerceAtLeast(0L)
        return (totalUs / 1000L) + 2L
    }

    private fun encode(patternUs: IntArray): List<ByteArray> {
        val p = normalizePattern(patternUs)
        val payload = ByteArrayOutput()
        payload.write(0x53)
        payload.write(0x54)
        payload.write(nextF().toInt() and 0xFF)
        payload.write(0x44)
        payload.write(0x00)
        encodeBodyInto(payload, p)
        payload.write(0x45)
        payload.write(0x4E)

        val payloadBytes = payload.toByteArray()
        val maxChunk = 0x38
        val total = ((payloadBytes.size + maxChunk - 1) / maxChunk).coerceAtLeast(1)
        val eVal = nextE()

        val frames = ArrayList<ByteArray>(total)
        var offset = 0
        var index = 1
        while (offset < payloadBytes.size) {
            val take = minOf(maxChunk, payloadBytes.size - offset)
            val frame = ByteArray(5 + take)
            frame[0] = 0x02
            frame[1] = (take + 3).toByte()
            frame[2] = eVal
            frame[3] = total.toByte()
            frame[4] = index.toByte()
            System.arraycopy(payloadBytes, offset, frame, 5, take)
            frames.add(frame)
            offset += take
            index++
        }
        return frames
    }

    private fun normalizePattern(input: IntArray): IntArray {
        if (input.isEmpty()) return input
        if (input.size % 2 != 0) return input
        val out = input.copyOf()
        val last = out[out.lastIndex]
        val tail = if (last > 3000) (last - 3000) else 10
        out[out.lastIndex] = tail
        return out
    }

    private fun encodeBodyInto(out: ByteArrayOutput, patternUs: IntArray) {
        for (i in patternUs.indices) {
            var units = patternUs[i] / 16
            if (units <= 0) units = 1
            val isOn = (i % 2 == 0)
            while (units > 0) {
                val chunk = minOf(units, 0x7F)
                units -= chunk
                var b = chunk
                if (isOn) b = b or 0x80
                out.write(b)
            }
        }
    }

    private class ByteArrayOutput {
        private var buf = ByteArray(256)
        private var size = 0
        fun write(v: Int) {
            ensure(1)
            buf[size++] = v.toByte()
        }

        fun toByteArray(): ByteArray = buf.copyOf(size)

        private fun ensure(n: Int) {
            val need = size + n
            if (need <= buf.size) return
            var newCap = buf.size * 2
            while (newCap < need) newCap *= 2
            buf = buf.copyOf(newCap)
        }
    }
}
