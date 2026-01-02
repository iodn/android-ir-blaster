package org.nslabs.ir_blaster

object UsbProtocolFormatter {

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

    /**
     * Constructor sends one handshake frame:
     * [0x02, 0x09, e, 0x01, 0x01, 'S','T', f, 'S','E','N']
     */
    fun handshakeFrames(): List<ByteArray> {
        val eVal = nextE()
        val fVal = nextF()
        val frame = byteArrayOf(
            0x02, 0x09, eVal, 0x01, 0x01,
            0x53, // 'S'
            0x54, // 'T'
            fVal,
            0x53, // 'S'
            0x45, // 'E'
            0x4E  // 'N'
        )
        return listOf(frame)
    }

    fun encode(frequencyHz: Int, patternUs: IntArray): List<ByteArray> = encode(patternUs)

    /**
     * 'S','T', f, 'D', 0x00, RLE_BODY..., 'E','N'
     *
     * RLE_BODY:
     * - durations converted to units = duration/16 (integer)
     * - ON segments (even index) have MSB set on each chunk byte
     * - chunk size max 0x7F
     *
     * Fragmentation:
     * - payload split to 0x38 (56) bytes
     * - e increments ONCE per whole message, same e used for all fragments
     * - frame header: [0x02, (chunkLen+3), e, totalFragments, index] + chunk
     *
     * Pattern tweak (IMPORTANT):
     * - Modifies LAST element only when (len % 2 == 0):
     *   tail = (last > 3000) ? (last - 3000) : 10
     *   pattern[last] = tail
     */
    fun encode(patternUs: IntArray): List<ByteArray> {
        val p = normalizePattern(patternUs)

        val payload = ByteArrayOutput()
        payload.write(0x53) // 'S'
        payload.write(0x54) // 'T'
        payload.write(nextF().toInt() and 0xFF)
        payload.write(0x44) // 'D'
        payload.write(0x00)

        encodeBodyInto(payload, p)

        payload.write(0x45) // 'E'
        payload.write(0x4E) // 'N'

        val payloadBytes = payload.toByteArray()

        val maxChunk = 0x38 // 56
        val total = ((payloadBytes.size + maxChunk - 1) / maxChunk).coerceAtLeast(1)

        // IMPORTANT: one e per whole message, constant across fragments
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

        // Modifies only if (len % 2 == 0)
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
