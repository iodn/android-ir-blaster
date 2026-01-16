package org.nslabs.ir_blaster

import android.hardware.usb.UsbDeviceConnection
import android.hardware.usb.UsbEndpoint
import android.os.SystemClock
import android.util.Log
import kotlin.math.min

object ElkSmartUsbProtocolFormatter : UsbWireProtocol {
  override val name: String = "elksmart_bulk"
  override val strictHandshake: Boolean = true
  override val wantsBackgroundReader: Boolean = false
  override val interFrameDelayMs: Long = 2L

  override fun openHandshake(
    connection: UsbDeviceConnection,
    inEndpoint: UsbEndpoint,
    outEndpoint: UsbEndpoint
  ): Boolean {
    return try {
      val tmp = ByteArray(maxOf(inEndpoint.maxPacketSize, 64))
      while (true) {
        val r = connection.bulkTransfer(inEndpoint, tmp, tmp.size, 10)
        if (r < 0) break
      }

      val identify = byteArrayOf(
        0xFC.toByte(),
        0xFC.toByte(),
        0xFC.toByte(),
        0xFC.toByte()
      )

      val w = connection.bulkTransfer(outEndpoint, identify, identify.size, 150)
      if (w != identify.size) return false

      val resp = ByteArray(64)
      var got = -1
      val deadline = SystemClock.uptimeMillis() + 400L
      while (SystemClock.uptimeMillis() < deadline) {
        val n = connection.bulkTransfer(inEndpoint, resp, resp.size, 120)
        if (n > 0) {
          got = n
          break
        }
      }
      if (got < 6) return false

      resp[0] == 0xFC.toByte() &&
        resp[1] == 0xFC.toByte() &&
        resp[2] == 0xFC.toByte() &&
        resp[3] == 0xFC.toByte() &&
        (resp[4].toInt() and 0xFF) == 0x70 &&
        (resp[5].toInt() and 0xFF) == 0x01
    } catch (t: Throwable) {
      Log.w("ElkSmartUsbProtocol", "openHandshake failed: ${t.message}")
      false
    }
  }

  override fun encode(frequencyHz: Int, patternUs: IntArray): List<ByteArray> {
    val pulses = toPulses(patternUs)
    val payload = compressPulses(pulses)

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
    return 2L
  }

  private data class Pulse(val onUs: Int, val offUs: Int)

  private fun toPulses(patternUs: IntArray): List<Pulse> {
    if (patternUs.isEmpty()) return emptyList()
    val out = ArrayList<Pulse>((patternUs.size + 1) / 2)
    var i = 0
    while (i < patternUs.size) {
      val on = patternUs[i].coerceAtLeast(0)
      val off = if (i + 1 < patternUs.size) patternUs[i + 1].coerceAtLeast(0) else 0
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

  private fun compressValueUs(valueUs: Int, out: ByteArrayOutput) {
    if (valueUs <= 2032) {
      val q = ((valueUs + 8) / 16).coerceAtLeast(2)
      out.write(q and 0xFF)
      return
    }

    var v = valueUs
    while (true) {
      var b = v and 0x7F
      v = v ushr 7
      if (v != 0) b = b or 0x80
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
}
