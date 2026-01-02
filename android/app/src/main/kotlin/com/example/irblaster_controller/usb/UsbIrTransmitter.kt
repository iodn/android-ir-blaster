package org.nslabs.ir_blaster

import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbDeviceConnection
import android.hardware.usb.UsbEndpoint
import android.hardware.usb.UsbInterface
import android.os.SystemClock
import android.util.Log
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import java.util.concurrent.atomic.AtomicLong

class UsbIrTransmitter(
    val device: UsbDevice,
    private val connection: UsbDeviceConnection,
    private val claimedInterface: UsbInterface,
    private val outEndpoint: UsbEndpoint,
    private val inEndpoint: UsbEndpoint,
    private val formatter: UsbProtocolFormatter = UsbProtocolFormatter
) : IrTransmitter {

    private val TAG = "UsbIrTransmitter"

    @Volatile
    private var closed: Boolean = false

    private val readUntilMs = AtomicLong(0)
    private var readerJob: Job? = null

    init {
        // Does handshake immediately in constructor.
        try {
            for (frame in formatter.handshakeFrames()) {
                val ok = sendFrame(frame)
                if (ok != true) break
            }
        } catch (t: Throwable) {
            Log.w(TAG, "Handshake error: ${t.message}")
        }
    }

    override fun transmitRaw(frequencyHz: Int, patternUs: IntArray): Boolean {
        if (closed) return false
        if (patternUs.isEmpty()) return false

        val frames = formatter.encode(frequencyHz, patternUs)
        for (frame in frames) {
            val ok = sendFrame(frame) ?: return false
            if (!ok) return false
        }

        // Delays roughly (sum(pattern)/1000) + 2 ms.
        val totalUs = safeSumUs(patternUs)
        val sleepMs = (totalUs / 1000L) + 2L
        if (sleepMs > 0) SystemClock.sleep(sleepMs)

        return true
    }

    fun close() {
        if (closed) return
        closed = true
        try { readerJob?.cancel() } catch (_: Throwable) {}
        readerJob = null
        try { connection.releaseInterface(claimedInterface) } catch (_: Throwable) {}
        try { connection.close() } catch (_: Throwable) {}
    }

    /**
     * bulkTransfer(out, bytes, len, 0xFA)
     * readUntil = now + 1000
     * ensure background reader running
     */
    private fun sendFrame(frame: ByteArray): Boolean? {
        if (closed) return null

        val rc = try {
            connection.bulkTransfer(outEndpoint, frame, frame.size, 250)
        } catch (t: Throwable) {
            Log.e(TAG, "bulkTransfer(out) exception: ${t.message}", t)
            return false
        }

        if (rc <= 0) {
            Log.w(TAG, "bulkTransfer(out) failed rc=$rc len=${frame.size}")
            return false
        }

        readUntilMs.set(System.currentTimeMillis() + 1000L)
        ensureReader()
        return true
    }

    /**
     * while (readUntil > now) {
     *   bulkTransfer(in, buf, mps, 0x12c)
     *   delay(1)
     * }
     * on exception: log + delay(5)
     */
    private fun ensureReader() {
        if (readerJob?.isActive == true) return

        readerJob = CoroutineScope(Dispatchers.IO).launch {
            val buf = ByteArray(inEndpoint.maxPacketSize.coerceAtLeast(64))
            while (isActive && !closed) {
                val until = readUntilMs.get()
                val now = System.currentTimeMillis()
                if (until <= now) break

                try {
                    connection.bulkTransfer(inEndpoint, buf, buf.size, 300)
                    delay(1)
                } catch (t: Throwable) {
                    Log.e(TAG, "Background reader error", t)
                    delay(5)
                }
            }
        }
    }

    private fun safeSumUs(p: IntArray): Long {
        var s = 0L
        for (v in p) s += v.toLong()
        return s.coerceAtLeast(0L)
    }
}
