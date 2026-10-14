package org.nslabs.ir_blaster

import android.hardware.usb.UsbConstants
import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbDeviceConnection
import android.hardware.usb.UsbEndpoint
import android.hardware.usb.UsbInterface
import android.hardware.usb.UsbManager
import android.hardware.usb.UsbRequest
import android.os.SystemClock
import android.util.Base64
import android.util.Log
import java.nio.ByteBuffer
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.atomic.AtomicBoolean

class TiqiaaUsbLearner private constructor(
    val device: UsbDevice,
    private val connection: UsbDeviceConnection,
    private val claimedInterface: UsbInterface,
    private val outEndpoint: UsbEndpoint,
    private val inEndpoint: UsbEndpoint,
    private val deviceLease: UsbDeviceAccess.Lease
) : UsbLearnerSession {
    private data class ParsedFrame(
        val type: Int,
        val status: Int,
        val payload: ByteArray?,
        val quality: Int,
        val meta: Int,
    )

    data class LearnedSignal(
        val rawPatternUs: IntArray,
        val opaqueFrame: ByteArray,
        val meta: Int,
        val quality: Int,
        val frequencyHzGuess: Int,
    ) {
        fun toWireMap(): Map<String, Any?> = mapOf(
            "family" to "tiqiaa",
            "rawPatternUs" to rawPatternUs.toList(),
            "opaqueFrameBase64" to Base64.encodeToString(opaqueFrame, Base64.NO_WRAP),
            "opaqueMeta" to meta,
            "quality" to quality,
            "frequencyHz" to frequencyHzGuess,
        )
    }

    private val tag = "TiqiaaUsbLearner"
    private var seq: Int = 0
    private var envelopeSeq: Int = 1
    private val notifyLock = Object()
    private val parsedQueue = ConcurrentLinkedQueue<ParsedFrame>()
    private val readerStarted = AtomicBoolean(false)
    private var inboundEnvelope = 0
    private var inboundCount = 0
    private var inboundNextIndex = 0
    @Volatile private var closed: Boolean = false
    @Volatile private var currentState: Int = 0

    companion object {
        private const val MAX_CHUNK = 0x38
        private val MODE_BYTES = byteArrayOf(
            'L'.code.toByte(),
            'S'.code.toByte(),
            'R'.code.toByte(),
            'H'.code.toByte(),
            'O'.code.toByte(),
            'L'.code.toByte(),
            'C'.code.toByte(),
            'V'.code.toByte(),
        )

        fun open(usb: UsbManager, device: UsbDevice): TiqiaaUsbLearner? {
            if (!UsbDeviceFilter.isTiqiaaTviewFamily(device)) return null
            val lease = UsbDeviceAccess.reserve(device.deviceName) ?: return null
            var opened: TiqiaaUsbLearner? = null
            try {
                opened = openReserved(usb, device, lease)
                return opened
            } finally {
                if (opened == null) lease.close()
            }
        }

        private fun openReserved(usb: UsbManager, device: UsbDevice, lease: UsbDeviceAccess.Lease): TiqiaaUsbLearner? {
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
                return TiqiaaUsbLearner(
                    device = device,
                    connection = conn,
                    claimedInterface = intf,
                    outEndpoint = pair.outEp,
                    inEndpoint = pair.inEp,
                    deviceLease = lease,
                )
            }
            return null
        }

        private data class EndpointPair(val outEp: UsbEndpoint, val inEp: UsbEndpoint)

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
        if (closed) return null
        clearParsedQueue()

        // Match the official learn flow more closely:
        // enter learn mode, wait for a learned frame, send cancel if still in learn
        // state on timeout, then return to local/idle mode.
        if (!sendModeAndWaitState(2, 500, cancelCheck)) {
            Log.i(tag, "learn mode was not acknowledged")
            return null
        }
        if (currentState != 2) {
            Log.i(tag, "device state after learn request is $currentState, not learn")
            return null
        }

        var timedOutInLearnState = false
        try {
            val deadline = SystemClock.uptimeMillis() + timeoutMs.coerceAtLeast(1000).toLong()
            while (!closed && !cancelCheck() && SystemClock.uptimeMillis() < deadline) {
                val remain = (deadline - SystemClock.uptimeMillis()).coerceAtLeast(1).toInt().coerceAtMost(1000)
                val parsed = waitForParsedFrame(remain, cancelCheck) ?: continue
                currentState = parsed.status
                Log.i(tag, "learn event type=${parsed.type} status=${parsed.status} meta=${parsed.meta} payload=${parsed.payload?.size ?: 0}")
                if (parsed.type != 5 || parsed.payload == null) {
                    continue
                }
                val preview = decodePreviewPattern(parsed.payload)
                return LearnedSignal(
                    rawPatternUs = preview,
                    opaqueFrame = parsed.payload,
                    meta = parsed.meta,
                    quality = parsed.quality,
                    frequencyHzGuess = 38000,
                )
            }
            if (currentState == 2) {
                timedOutInLearnState = true
            }
            return null
        } finally {
            if ((cancelCheck() || timedOutInLearnState) && currentState == 2) {
                sendModeAndWaitState(6, 500) { false }
            }
            if (currentState != 0) {
                sendModeAndWaitState(0, 500) { false }
            }
        }
    }

    override fun cancel() {
        if (closed) return
        try {
            sendModeAndWaitState(6, 300) { false }
            if (currentState != 0) {
                sendModeAndWaitState(0, 300) { false }
            }
        } catch (_: Throwable) {
        }
    }

    fun replayOpaqueFrame(frame: ByteArray): Boolean {
        if (closed) return false
        if (frame.size < 7) return false
        if (frame[0] != 'S'.code.toByte() || frame[1] != 'T'.code.toByte()) return false
        if (frame[3] != 'D'.code.toByte()) return false
        if (frame[frame.size - 2] != 'E'.code.toByte() || frame[frame.size - 1] != 'N'.code.toByte()) return false

        try {
            if (!sendModeAndWaitState(1, 500) { false }) return false
            if (currentState != 1) return false

            clearParsedQueue()
            val fresh = frame.copyOf()
            fresh[2] = nextSeqByte()
            var wroteAny = false
            for (chunk in wrapPayload(fresh)) {
                val rc = try {
                    connection.bulkTransfer(outEndpoint, chunk, chunk.size, 800)
                } catch (t: Throwable) {
                    Log.w(tag, "replay chunk failed: ${t.message}")
                    -1
                }
                Log.i(
                    tag,
                    "replay chunk rc=$rc env=${chunk[2].toInt() and 0xFF} payloadSeq=${fresh[2].toInt() and 0xFF} part=${chunk[4].toInt() and 0xFF}/${chunk[3].toInt() and 0xFF}"
                )
                if (rc <= 0) {
                    return false
                }
                wroteAny = true
            }
            val ack = waitForParsedFrame(1500) { false }
            if (ack != null) {
                currentState = ack.status
                Log.i(tag, "replay ack type=${ack.type} status=${ack.status} meta=${ack.meta}")
            } else {
                Log.i(tag, "replay produced no post-send ack")
            }
            return wroteAny && (ack == null || ack.type == 4 || ack.type == 1)
        } finally {
            if (!closed && currentState != 0) {
                sendModeAndWaitState(0, 300) { false }
            }
        }
    }

    override fun close() {
        if (closed) return
        try {
            if (currentState != 0) {
                sendModeAndWaitState(0, 250) { false }
            }
        } catch (_: Throwable) {
        }
        closed = true
        synchronized(notifyLock) {
            notifyLock.notifyAll()
        }
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

    private fun nextSeqByte(): Byte {
        seq = (seq + 1) and 0xFF
        if (seq == 0) seq = 1
        return seq.toByte()
    }

    @Synchronized
    private fun nextEnvelopeSeq(): Byte {
        envelopeSeq = if (envelopeSeq < 0x0F) (envelopeSeq + 1) else 0x01
        return envelopeSeq.toByte()
    }

    private fun sendModeAndWaitState(mode: Int, timeoutMs: Int, cancelCheck: () -> Boolean): Boolean {
        if (!sendMode(mode)) return false
        val ack = waitForParsedFrame(timeoutMs, cancelCheck)
        if (ack != null) {
            currentState = ack.status
            Log.i(tag, "mode=$mode ack type=${ack.type} status=${ack.status} meta=${ack.meta}")
        }
        return ack != null
    }

    private fun sendMode(mode: Int): Boolean {
        if (mode !in MODE_BYTES.indices) return false
        clearParsedQueue()
        val payload = byteArrayOf(
            'S'.code.toByte(),
            'T'.code.toByte(),
            nextSeqByte(),
            MODE_BYTES[mode],
            'E'.code.toByte(),
            'N'.code.toByte(),
        )
        val wrapped = wrapPayload(payload)
        var ok = true
        for (frame in wrapped) {
            val rc = try {
                connection.bulkTransfer(outEndpoint, frame, frame.size, 400)
            } catch (t: Throwable) {
                Log.w(tag, "sendMode($mode) failed: ${t.message}")
                -1
            }
            Log.i(tag, "sendMode($mode) rc=$rc env=${frame[2].toInt() and 0xFF} seq=${payload[2].toInt() and 0xFF} cmd=${payload[3].toInt().toChar()}")
            if (rc <= 0) {
                ok = false
                break
            }
        }
        return ok
    }

    private fun wrapPayload(payload: ByteArray): List<ByteArray> {
        val maxChunk = 0x38
        val total = ((payload.size + maxChunk - 1) / maxChunk).coerceAtLeast(1)
        val env = nextEnvelopeSeq()
        val frames = ArrayList<ByteArray>(total)
        var offset = 0
        var index = 1
        while (offset < payload.size) {
            val take = minOf(maxChunk, payload.size - offset)
            val frame = ByteArray(5 + take)
            frame[0] = 0x02
            frame[1] = (take + 3).toByte()
            frame[2] = env
            frame[3] = total.toByte()
            frame[4] = index.toByte()
            System.arraycopy(payload, offset, frame, 5, take)
            frames.add(frame)
            offset += take
            index++
        }
        return frames
    }

    private fun clearParsedQueue() {
        parsedQueue.clear()
    }

    private fun ensureReaderStarted() {
        if (!readerStarted.compareAndSet(false, true)) return
        Thread({
            try {
                runReaderLoop()
            } finally {
                readerStarted.set(false)
                synchronized(notifyLock) {
                    notifyLock.notifyAll()
                }
            }
        }, "tiqiaa-learner-reader").start()
    }

    private fun waitForParsedFrame(timeoutMs: Int, cancelCheck: () -> Boolean): ParsedFrame? {
        parsedQueue.poll()?.let { return it }
        ensureReaderStarted()
        val deadline = SystemClock.uptimeMillis() + timeoutMs.toLong()
        while (!closed && !cancelCheck() && SystemClock.uptimeMillis() < deadline) {
            parsedQueue.poll()?.let { return it }
            val remain = (deadline - SystemClock.uptimeMillis()).coerceAtLeast(1)
            synchronized(notifyLock) {
                try {
                    notifyLock.wait(remain)
                } catch (_: InterruptedException) {
                    Thread.currentThread().interrupt()
                    return null
                }
            }
        }
        return parsedQueue.poll()
    }

    private fun runReaderLoop() {
        val aggregate = ByteArray(0x400)
        var aggregateLen = 0
        while (!closed) {
            val request = UsbRequest()
            if (!request.initialize(connection, inEndpoint)) {
                Log.w(tag, "UsbRequest.initialize failed")
                return
            }
            val packet = ByteBuffer.allocate(0x40)
            try {
                packet.clear()
                val queued = try {
                    request.queue(packet, 0x40)
                } catch (t: Throwable) {
                    Log.w(tag, "UsbRequest.queue failed: ${t.message}")
                    false
                }
                if (!queued) {
                    aggregateLen = 0
                    SystemClock.sleep(20)
                    continue
                }
                val completed = try {
                    connection.requestWait()
                } catch (t: Throwable) {
                    Log.w(tag, "requestWait failed: ${t.message}")
                    aggregateLen = 0
                    SystemClock.sleep(20)
                    continue
                }
                if (completed == null || completed != request) {
                    aggregateLen = 0
                    continue
                }
                val nextLen = processInboundPacket(packet.array(), aggregate, aggregateLen, packet.position())
                if (nextLen >= 0) {
                    aggregateLen = nextLen
                } else {
                    val frame = aggregate.copyOf(-nextLen)
                    aggregateLen = 0
                    handleAggregatedFrame(frame)
                }
            } finally {
                try {
                    request.close()
                } catch (_: Throwable) {
                }
            }
        }
    }

    private fun processInboundPacket(data: ByteArray, aggregate: ByteArray, aggregateLen: Int, receivedLength: Int): Int {
        if (receivedLength < 5 || receivedLength > data.size) return 0
        if (data[0].toInt() != 1) return 0

        val chunkLen = (data[1].toInt() and 0xFF) - 3
        if (chunkLen <= 0 || chunkLen > MAX_CHUNK || 5 + chunkLen > receivedLength) {
            return 0
        }

        val envelope = data[2].toInt() and 0xFF
        val count = data[3].toInt() and 0xFF
        val index = data[4].toInt() and 0xFF
        if (count == 0 || index !in 1..count) return 0
        val offset = if (index == 1) {
            inboundEnvelope = envelope
            inboundCount = count
            0
        } else {
            if (aggregateLen == 0 || envelope != inboundEnvelope ||
                count != inboundCount || index != inboundNextIndex) return 0
            aggregateLen
        }
        if (offset + chunkLen > aggregate.size) return 0
        System.arraycopy(data, 5, aggregate, offset, chunkLen)
        inboundNextIndex = index + 1
        val finalChunk = index == count
        val newLen = offset + chunkLen
        Log.i(tag, "recv chunk len=$chunkLen final=$finalChunk seq=${data[3].toInt() and 0xFF}/${data[4].toInt() and 0xFF}")
        return if (finalChunk) -newLen else newLen
    }

    private fun handleAggregatedFrame(frame: ByteArray) {
        if (frame.isEmpty()) return
        Log.i(tag, "recv aggregated len=${frame.size} hex=${frame.toHexPreview()}")
        parseFrame(frame)?.let {
            parsedQueue.add(it)
            synchronized(notifyLock) {
                notifyLock.notifyAll()
            }
        }
    }

    private fun parseFrame(frame: ByteArray): ParsedFrame? {
        if (frame.size < 7 || frame[0] != 'S'.code.toByte() || frame[1] != 'T'.code.toByte() ||
            frame[frame.size - 2] != 'E'.code.toByte() || frame.last() != 'N'.code.toByte()) return null
        // Fragment counts delimit the frame; EN can also occur inside binary timing data.
        val meta = frame[4].toInt() and 0xFF
        val type = when (frame[3].toInt().toChar()) {
            'L' -> 0
            'S' -> 1
            'R' -> 2
            'H' -> 3
            'O' -> 4
            'D' -> 5
            'C' -> 6
            'V' -> 7
            'B' -> 8
            else -> return null
        }
        if (type == 5) {
            if (decodePreviewPattern(frame).isEmpty()) return null
            return ParsedFrame(type, 2, frame.copyOf(), 0, meta)
        }
        return ParsedFrame(type, (meta shr 3) and 0x3, frame.copyOfRange(5, frame.size - 2), 0, meta)
    }

    private fun decodePreviewPattern(frame: ByteArray): IntArray {
        if (frame.size < 8) return IntArray(0)
        val bodyEndExclusive = frame.size - 2
        if (bodyEndExclusive <= 5) return IntArray(0)

        val out = ArrayList<Int>(64)
        var currentPolarity = true
        var units = 0
        for (i in 5 until bodyEndExclusive) {
            val b = frame[i].toInt() and 0xFF
            val polarity = (b and 0x80) != 0
            val value = b and 0x7F
            // A zero-duration byte must not create a mark/space transition.
            if (value == 0) continue
            if (units == 0 && out.isEmpty() && !polarity) return IntArray(0)
            if (polarity == currentPolarity) {
                units += value
            } else {
                if (units > 0) {
                    out.add((units * 16).coerceAtLeast(1))
                }
                currentPolarity = polarity
                units = value
            }
        }
        if (units > 0) {
            out.add((units * 16).coerceAtLeast(1))
        }
        return out.toIntArray()
    }

    private fun ByteArray.toHexPreview(limit: Int = 96): String {
        if (isEmpty()) return ""
        val size = kotlin.math.min(this.size, limit)
        val sb = StringBuilder(size * 3)
        for (i in 0 until size) {
            if (i > 0) sb.append(' ')
            sb.append(String.format("%02X", this[i].toInt() and 0xFF))
        }
        if (this.size > limit) sb.append(" ...")
        return sb.toString()
    }
}
