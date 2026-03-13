package org.nslabs.ir_blaster

import android.hardware.usb.UsbDeviceConnection
import android.hardware.usb.UsbEndpoint
import android.os.SystemClock
import android.util.Log
import kotlin.math.min
import kotlin.math.roundToLong

class ElkSmartUsbProtocolFormatter : UsbWireProtocol {
    override val name: String = "elksmart_bulk"
    override val strictHandshake: Boolean = true
    override val wantsBackgroundReader: Boolean = false
    override val interFrameDelayMs: Long = 2L

    private enum class Subtype {
        D552,
        D226,
    }

    private var subtype: Subtype? = null

    companion object {
        private const val TAG = "ElkSmartUsbProtocol"
        private const val IDENT_PREFIX = 0xFC
        private const val TYPE_D552_HI = 0x70
        private const val TYPE_D552_LO = 0x01
        private const val TYPE_D226_HI = 0x02
        private const val TYPE_D226_LO = 0xAA
        private const val ODD_PATTERN_TRAILING_GAP_US = 10_000
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

            val identify = byteArrayOf(
                IDENT_PREFIX.toByte(),
                IDENT_PREFIX.toByte(),
                IDENT_PREFIX.toByte(),
                IDENT_PREFIX.toByte()
            )

            val w = connection.bulkTransfer(outEndpoint, identify, identify.size, 200)
            if (w != identify.size) return false

            val resp = ByteArray(64)
            var got = -1
            val deadline = SystemClock.uptimeMillis() + 450L
            while (SystemClock.uptimeMillis() < deadline) {
                val n = connection.bulkTransfer(inEndpoint, resp, resp.size, 150)
                if (n > 0) {
                    got = n
                    break
                }
            }

            if (got < 6) return false

            val identified = identifySubtype(resp, got)
            if (identified == null) {
                Log.w(TAG, "Unexpected identify response: ${resp.copyOf(got).toHexString()}")
                return false
            }
            subtype = identified
            true
        } catch (t: Throwable) {
            Log.w(TAG, "openHandshake failed: ${t.message}")
            false
        }
    }

    private fun identifySubtype(resp: ByteArray, size: Int): Subtype? {
        if (size < 6) return null
        if (resp[0] != IDENT_PREFIX.toByte() ||
            resp[1] != IDENT_PREFIX.toByte() ||
            resp[2] != IDENT_PREFIX.toByte() ||
            resp[3] != IDENT_PREFIX.toByte()
        ) {
            return null
        }

        val typeHi = resp[4].toInt() and 0xFF
        val typeLo = resp[5].toInt() and 0xFF
        return when {
            typeHi == TYPE_D552_HI && typeLo == TYPE_D552_LO -> {
                Log.i(TAG, "Identified ElkSmart subtype 70 01")
                Subtype.D552
            }
            typeHi == TYPE_D226_HI && typeLo == TYPE_D226_LO -> {
                Log.i(TAG, "Identified ElkSmart subtype 02 AA")
                Subtype.D226
            }
            else -> null
        }
    }

    override fun encode(frequencyHz: Int, patternUs: IntArray): List<ByteArray> {
        val pulses = toPulses(patternUs)
        val rawCompressed = compressPulses(pulses)
        val payload = when (subtype ?: Subtype.D552) {
            Subtype.D552 -> rawCompressed
            Subtype.D226 -> encodeD226Payload(rawCompressed)
        }

        val f = (frequencyHz + 0x7FFFF)
        val len = payload.size

        val msg = ByteArrayOutput()
        msg.write(0xFF)
        msg.write(0xFF)
        msg.write(0xFF)
        msg.write(0xFF)
        msg.write(mangleByte(f ushr 8).toInt() and 0xFF)
        msg.write(mangleByte(f ushr 16).toInt() and 0xFF)
        msg.write(mangleByte(f).toInt() and 0xFF)
        msg.write(mangleByte(len ushr 8).toInt() and 0xFF)
        msg.write(mangleByte(len).toInt() and 0xFF)

        for (b in payload) msg.write(b.toInt() and 0xFF)

        val message = msg.toByteArray()

        val frames = ArrayList<ByteArray>()
        var offset = 0
        while (offset < message.size) {
            val chunk = min(62, message.size - offset)
            if (chunk == 62) {
                val buf = ByteArray(63)
                System.arraycopy(message, offset, buf, 0, 62)
                buf[62] = checksum62(buf)
                frames.add(buf)
            } else {
                val buf = ByteArray(chunk)
                System.arraycopy(message, offset, buf, 0, chunk)
                frames.add(buf)
            }
            offset += chunk
        }
        return frames
    }

    override fun postTransmitDelayMs(patternUs: IntArray): Long {
        var totalUs = 0L
        for (v in patternUs) totalUs += v.toLong().coerceAtLeast(0L)
        val patternMs = (totalUs.toDouble() / 1000.0).roundToLong()
        val base = patternMs + 25L
        return base.coerceAtLeast(80L)
    }

    override fun drainAfterTransmit(connection: UsbDeviceConnection, inEndpoint: UsbEndpoint) {
        try {
            val tmp = ByteArray(maxOf(inEndpoint.maxPacketSize, 64))
            val deadline = SystemClock.uptimeMillis() + 120L
            while (SystemClock.uptimeMillis() < deadline) {
                val r = connection.bulkTransfer(inEndpoint, tmp, tmp.size, 20)
                if (r <= 0) break
            }
        } catch (_: Throwable) {
        }
    }

    private data class Pulse(val onUs: Int, val offUs: Int)

    private fun toPulses(patternUs: IntArray): List<Pulse> {
        if (patternUs.isEmpty()) return emptyList()
        val out = ArrayList<Pulse>((patternUs.size + 1) / 2)
        var i = 0
        while (i < patternUs.size) {
            val on = patternUs[i].coerceAtLeast(0)
            // Some protocol encoders (e.g. RC6) can end with a trailing mark (odd-length pattern).
            // A zero off-time can make certain ElkSmart firmware variants truncate the tail.
            // Provide a short safety gap so the final mark is preserved.
            val off = if (i + 1 < patternUs.size) {
                patternUs[i + 1].coerceAtLeast(0)
            } else {
                ODD_PATTERN_TRAILING_GAP_US
            }
            out.add(Pulse(on, off))
            i += 2
        }
        return out
    }

    private fun compressPulses(pulses: List<Pulse>): ByteArray {
        if (pulses.isEmpty()) return ByteArray(0)
        val freq = HashMap<Pulse, Int>(pulses.size)
        for (p in pulses) {
            freq[p] = (freq[p] ?: 0) + 1
        }
        val sorted = freq.entries.sortedByDescending { it.value }
        val p1 = sorted.getOrNull(0)?.key ?: pulses[0]
        val p2 = sorted.getOrNull(1)?.key ?: p1

        val out = ByteArrayOutput()
        compressValueUs(p2.onUs, out)
        compressValueUs(p2.offUs, out)
        compressValueUs(p1.onUs, out)
        compressValueUs(p1.offUs, out)
        out.write(0xFF)
        out.write(0xFF)
        out.write(0xFF)

        for (p in pulses) {
            when {
                p == p1 -> out.write(0x00)
                p == p2 -> out.write(0x01)
                else -> {
                    compressValueUs(p.onUs, out)
                    compressValueUs(p.offUs, out)
                }
            }
        }
        return out.toByteArray()
    }

    private fun encodeD226Payload(rawCompressed: ByteArray): ByteArray {
        if (rawCompressed.isEmpty()) return rawCompressed

        val freq = IntArray(256)
        for (b in rawCompressed) {
            freq[b.toInt() and 0xFF]++
        }

        val pq = java.util.PriorityQueue<Node>(compareBy<Node> { it.weight })
        for (symbol in 0..0xFF) {
            val weight = freq[symbol]
            if (weight > 0) {
                pq.offer(Leaf(weight, symbol))
            }
        }
        if (pq.isEmpty()) return rawCompressed

        while (pq.size > 1) {
            val left = pq.poll()
            val right = pq.poll()
            pq.offer(Branch(left, right))
        }

        val codes = ArrayList<CodeEntry>()
        buildCodes(pq.poll(), StringBuilder(), codes)
        codes.sortBy { it.symbol }

        val codeBySymbol = HashMap<Int, String>(codes.size)
        val out = ByteArrayOutput()
        out.write((codes.size ushr 8) and 0xFF)
        out.write(codes.size and 0xFF)

        for (entry in codes) {
            codeBySymbol[entry.symbol] = entry.bits
            out.write(entry.symbol and 0xFF)
            out.write((entry.weight ushr 8) and 0xFF)
            out.write(entry.weight and 0xFF)
        }

        val bitString = StringBuilder()
        for (b in rawCompressed) {
            bitString.append(codeBySymbol[b.toInt() and 0xFF] ?: "")
        }

        var tailBits = bitString.length % 8
        if (tailBits > 0) {
            repeat(8 - tailBits) { bitString.append('0') }
        }
        out.write(tailBits and 0xFF)

        var i = 0
        while (i < bitString.length) {
            val chunk = bitString.substring(i, i + 8)
            out.write(chunk.toInt(2) and 0xFF)
            i += 8
        }
        return out.toByteArray()
    }

    private sealed class Node(val weight: Int)
    private class Leaf(weight: Int, val symbol: Int) : Node(weight)
    private class Branch(val left: Node, val right: Node) : Node(left.weight + right.weight)
    private data class CodeEntry(val symbol: Int, val weight: Int, val bits: String)

    private fun buildCodes(node: Node, prefix: StringBuilder, out: MutableList<CodeEntry>) {
        when (node) {
            is Leaf -> {
                val bits = if (prefix.isEmpty()) "0" else prefix.toString()
                out.add(CodeEntry(node.symbol, node.weight, bits))
            }
            is Branch -> {
                prefix.append('0')
                buildCodes(node.left, prefix, out)
                prefix.deleteCharAt(prefix.lastIndex)
                prefix.append('1')
                buildCodes(node.right, prefix, out)
                prefix.deleteCharAt(prefix.lastIndex)
            }
        }
    }

    private fun compressValueUs(valueUs: Int, out: ByteArrayOutput) {
        if (valueUs <= 2032) {
            val q = if (valueUs == 0 || valueUs == 1) valueUs else ((valueUs / 16.0) + 0.5).toInt()
            out.write(q and 0xFF)
            return
        }
        var v = valueUs
        while (true) {
            var b = v and 0x7F
            v = v ushr 7
            if (v != 0) b = b or 0x80
            if ((b and 0xFF) == 0xFF) b = 0xFE
            out.write(b and 0xFF)
            if (v == 0) break
        }
    }

    private fun mangleByte(v: Int): Byte {
        var value = v and 0xFF
        var reversed = 0
        repeat(8) {
            reversed = (reversed shl 1) or (value and 1)
            value = value ushr 1
        }
        return (reversed.inv() and 0xFF).toByte()
    }

    private fun checksum62(buf: ByteArray): Byte {
        var sum = 0
        for (i in 0 until 62) sum += (buf[i].toInt() and 0xFF)
        val x = (sum and 0xF0) or ((sum ushr 8) and 0x0F)
        return mangleByte(x)
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

    private fun ByteArray.toHexString(): String = joinToString(" ") { b ->
        (b.toInt() and 0xFF).toString(16).padStart(2, '0').uppercase()
    }
}
