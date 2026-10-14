package org.nslabs.ir_blaster

import org.junit.Assert.*
import org.junit.Test

class ElkSmartUsbProtocolFormatterTest {
    @Test fun huffmanStoresPaddingCountForEveryBitRemainder() {
        val formatter = ElkSmartUsbProtocolFormatter()
        val encode = formatter.javaClass.getDeclaredMethod("encodeD226Payload", ByteArray::class.java)
            .apply { isAccessible = true }
        // Two symbols have one-bit codes, so input length is the unpadded bit count.
        for (length in 2..9) {
            val input = ByteArray(length) { (it % 2).toByte() }
            val encoded = encode.invoke(formatter, input) as ByteArray
            val symbols = ((encoded[0].toInt() and 0xff) shl 8) or (encoded[1].toInt() and 0xff)
            val paddingIndex = 2 + 3 * symbols
            val padding = (8 - length % 8) % 8
            assertEquals("length=$length", padding, encoded[paddingIndex].toInt() and 0xff)
            assertEquals(length, (encoded.size - paddingIndex - 1) * 8 - padding)
            assertEquals(0, (encoded.last().toInt() and 0xff) and ((1 shl padding) - 1))
        }
    }

    @Test fun huffmanMatchesThreeBitReferenceVector() {
        val formatter = ElkSmartUsbProtocolFormatter()
        val encode = formatter.javaClass.getDeclaredMethod("encodeD226Payload", ByteArray::class.java)
            .apply { isAccessible = true }
        assertArrayEquals(
            byteArrayOf(0, 2, 0, 0, 2, 1, 0, 1, 5, 0xa0.toByte()),
            encode.invoke(formatter, byteArrayOf(0, 1, 0)) as ByteArray,
        )
    }
}
