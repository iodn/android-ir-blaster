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
import java.util.concurrent.atomic.AtomicBoolean
import java.util.concurrent.locks.ReentrantLock

class UsbIrTransmitter private constructor(
    val device: UsbDevice,
    private val connection: UsbDeviceConnection,
    private val claimedInterface: UsbInterface,
    private val outEndpoint: UsbEndpoint,
    private val inEndpoint: UsbEndpoint,
    private val protocol: UsbWireProtocol
) : IrTransmitter {
    private val TAG = "UsbIrTransmitter"

    @Volatile
    private var closed: Boolean = false

    private val readUntilMs = AtomicLong(0)
    private var readerJob: Job? = null

    private val txLock = ReentrantLock()
    private var lastActivityMs = SystemClock.uptimeMillis()
    private val lifetimeLock = Any()
    private var borrowers = 0
    private var closeRequested = false
    internal var onClosed: (() -> Unit)? = null

    internal class AutomationLease(private val tx: UsbIrTransmitter) : AutoCloseable {
        private val released = AtomicBoolean(false)
        fun transmit(frequency: Int, pattern: IntArray, deadlineMs: Long): Boolean? {
            if (released.get()) return false
            return tx.transmit(frequency, pattern, deadlineMs, automation = true)
        }
        override fun close() {
            if (!released.compareAndSet(false, true)) return
            synchronized(tx.lifetimeLock) {
                tx.borrowers--
                if (tx.borrowers == 0 && tx.closeRequested) tx.closeConnection()
            }
        }
    }

    internal fun borrowForAutomation(): AutomationLease? = synchronized(lifetimeLock) {
        if (closeRequested || closed) return null
        borrowers++
        AutomationLease(this)
    }

    companion object {
        fun create(
            device: UsbDevice,
            connection: UsbDeviceConnection,
            claimedInterface: UsbInterface,
            outEndpoint: UsbEndpoint,
            inEndpoint: UsbEndpoint,
            protocol: UsbWireProtocol,
            deadlineMs: Long = Long.MAX_VALUE
        ): UsbIrTransmitter? {
            val tx = UsbIrTransmitter(
                device = device,
                connection = connection,
                claimedInterface = claimedInterface,
                outEndpoint = outEndpoint,
                inEndpoint = inEndpoint,
                protocol = protocol
            )

            val handshakeOk = try {
                protocol.openHandshake(connection, inEndpoint, outEndpoint, deadlineMs)
            } catch (t: Throwable) {
                Log.w("UsbIrTransmitter", "openHandshake error: ${t.message}")
                false
            }

            if ((!handshakeOk && protocol.strictHandshake) || SystemClock.uptimeMillis() >= deadlineMs) {
                tx.close()
                return null
            }

            return tx
        }
    }

    override fun transmitRaw(frequencyHz: Int, patternUs: IntArray): Boolean {
        return transmit(frequencyHz, patternUs, Long.MAX_VALUE, automation = false) == true
    }

    private fun transmit(frequencyHz: Int, patternUs: IntArray, deadlineMs: Long, automation: Boolean): Boolean? {
        // Never block the activity's main thread behind an automation transmission.
        if (!txLock.tryLock()) return null
        try {
            if (!automation && synchronized(lifetimeLock) { closeRequested }) return false
            if (closed) return false
            if (patternUs.isEmpty()) return false

            val frames = try {
                protocol.encode(frequencyHz, patternUs)
            } catch (t: Throwable) {
                Log.w(TAG, "encode failed: ${t.message}")
                return false
            }

            val post = protocol.postTransmitDelayMs(patternUs)
            if (automation) {
                // Reject before sending any bytes if worst-case USB timeouts cannot fit.
                val budgetMs = frames.size * (400L + protocol.interFrameDelayMs) + post + 150L
                if (budgetMs > deadlineMs - SystemClock.uptimeMillis()) return false
            }

            for (frame in frames) {
                val ok = sendFrame(frame) ?: return false
                if (!ok) return false
                val d = protocol.interFrameDelayMs
                if (d > 0) SystemClock.sleep(d)
            }

            if (post > 0) SystemClock.sleep(post)

            try {
                protocol.drainAfterTransmit(connection, inEndpoint)
            } catch (_: Throwable) {
            }

            return true
        } finally {
            lastActivityMs = SystemClock.uptimeMillis()
            txLock.unlock()
        }
    }

    fun close() {
        synchronized(lifetimeLock) {
            closeRequested = true
            // A borrowed automation handle keeps the connection alive through its send.
            if (borrowers == 0) closeConnection()
        }
    }

    // Background cleanup must not interrupt a send, its response reader, or a widget lease.
    internal fun closeIfIdle(minIdleMs: Long = 0L): Boolean {
        if (!txLock.tryLock()) return false
        try {
            return synchronized(lifetimeLock) {
                if (borrowers != 0 || readerJob?.isActive == true ||
                    SystemClock.uptimeMillis() - lastActivityMs < minIdleMs) return@synchronized false
                closeRequested = true
                closeConnection()
                true
            }
        } finally {
            txLock.unlock()
        }
    }

    private fun closeConnection() {
        if (closed) return
        closed = true
        try {
            readerJob?.cancel()
        } catch (_: Throwable) {
        }
        readerJob = null
        try {
            connection.releaseInterface(claimedInterface)
        } catch (_: Throwable) {
        }
        try {
            connection.close()
        } catch (_: Throwable) {
        }
        onClosed?.invoke()
    }

    private fun sendFrame(frame: ByteArray): Boolean? {
        if (closed) return null
        val rc = try {
            connection.bulkTransfer(outEndpoint, frame, frame.size, 400)
        } catch (t: Throwable) {
            Log.e(TAG, "bulkTransfer(out) exception: ${t.message}", t)
            return false
        }
        if (rc <= 0 || rc != frame.size) {
            Log.w(TAG, "bulkTransfer(out) failed rc=$rc len=${frame.size}")
            return false
        }
        if (protocol.wantsBackgroundReader) {
            readUntilMs.set(System.currentTimeMillis() + 1000L)
            ensureReader()
        }
        return true
    }

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
}
