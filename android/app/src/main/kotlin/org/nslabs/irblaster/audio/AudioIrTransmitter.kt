package org.nslabs.ir_blaster.audio

import android.content.Context
import android.hardware.usb.UsbManager
import android.media.AudioAttributes
import android.media.AudioDeviceInfo
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Build
import android.util.Log

class AudioIrTransmitter(
  private val context: Context,
  private val mode: Short,
  private val prePadFrames: Long = 0L,
) {
  companion object {
    private const val TAG = "AudioIrTx"
    private val EXPLICIT_USB_ROUTE_ADAPTERS = setOf(
      31 to 2849,
    )
  }

  @Volatile private var activeTrack: AudioTrack? = null

  fun transmitRaw(freqHz: Int, patternUs: IntArray): Boolean {
    return try {
      val safeFreq = freqHz.coerceIn(15_000, 60_000)
      val explicitRouteAdapterAttached = shouldPreferUsbOutputRoute()
      val forceStereoMirror = explicitRouteAdapterAttached && mode.toInt() == 1
      val builder = AudioPcmBuilder(
        carrierHz = safeFreq,
        patternUs = patternUs,
        mode = mode,
        prePadFrames = prePadFrames,
      )

      val pcm = if (forceStereoMirror) {
        expandMonoToStereo(builder.pcm)
      } else {
        builder.pcm
      }
      if (pcm.isEmpty()) return false

      val channelCount = if (forceStereoMirror) 2 else builder.channelCount

      val channelMask = if (channelCount == 1) {
        AudioFormat.CHANNEL_OUT_MONO
      } else {
        AudioFormat.CHANNEL_OUT_STEREO
      }

      val attributes = AudioAttributes.Builder()
        .setUsage(AudioAttributes.USAGE_MEDIA)
        .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
        .build()

      val format = AudioFormat.Builder()
        .setSampleRate(48_000)
        .setChannelMask(channelMask)
        .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
        .build()

      val bufferBytes = pcm.size * 2
      if (bufferBytes <= 0) return false

      stop()

      val track = AudioTrack(
        attributes,
        format,
        bufferBytes,
        AudioTrack.MODE_STATIC,
        AudioManager.AUDIO_SESSION_ID_GENERATE
      )

      activeTrack = track
      if (explicitRouteAdapterAttached) {
        applyPreferredUsbRoute(track)
      }

      if (Build.VERSION.SDK_INT >= 21) {
        track.setVolume(1.0f)
      } else {
        @Suppress("DEPRECATION")
        track.setStereoVolume(1.0f, 1.0f)
      }

      val written = track.write(pcm, 0, pcm.size)
      if (written <= 0) {
        stop()
        return false
      }

      track.play()
      logRoutedDevice(track)

      val frames = pcm.size / channelCount
      scheduleRelease(track, frames)

      true
    } catch (t: Throwable) {
      Log.w(TAG, "transmitRaw failed: ${t.message}")
      stop()
      false
    }
  }

  fun stop() {
    val t = activeTrack
    if (t != null) {
      try { t.pause() } catch (_: Throwable) {}
      try { t.flush() } catch (_: Throwable) {}
      try { t.stop() } catch (_: Throwable) {}
      try { t.release() } catch (_: Throwable) {}
    }
    activeTrack = null
  }

  private fun scheduleRelease(track: AudioTrack, frames: Int) {
    val durationMs = ((frames.toDouble() / 48_000.0) * 1000.0).toLong().coerceAtLeast(50L)
    Thread {
      try { Thread.sleep(durationMs + 200L) } catch (_: Throwable) {}
      try { track.stop() } catch (_: Throwable) {}
      try { track.release() } catch (_: Throwable) {}
      if (activeTrack === track) activeTrack = null
    }.start()
  }

  private fun applyPreferredUsbRoute(track: AudioTrack) {
    if (Build.VERSION.SDK_INT < 23) return
    val preferred = findPreferredUsbOutputDevice() ?: return
    try {
      val ok = track.setPreferredDevice(preferred)
      Log.i(
        TAG,
        "Preferred USB route ${if (ok) "applied" else "rejected"}: " +
          "id=${preferred.id}, type=${preferred.type}, product=${preferred.productName ?: "unknown"}"
      )
    } catch (t: Throwable) {
      Log.w(TAG, "Failed to prefer USB audio route: ${t.message}")
    }
  }

  private fun shouldPreferUsbOutputRoute(): Boolean {
    val usb = context.getSystemService(Context.USB_SERVICE) as? UsbManager ?: return false
    val devices = try {
      usb.deviceList.values
    } catch (_: Throwable) {
      emptyList()
    }
    return devices.any { device ->
      (device.vendorId to device.productId) in EXPLICIT_USB_ROUTE_ADAPTERS
    }
  }

  private fun findPreferredUsbOutputDevice(): AudioDeviceInfo? {
    if (Build.VERSION.SDK_INT < 23) return null
    val mgr = context.getSystemService(Context.AUDIO_SERVICE) as? AudioManager ?: return null
    val outputs = mgr.getDevices(AudioManager.GET_DEVICES_OUTPUTS)
    val preferredTypes = setOf(
      AudioDeviceInfo.TYPE_USB_HEADSET,
      AudioDeviceInfo.TYPE_USB_DEVICE,
    )
    return outputs.firstOrNull { it.type in preferredTypes }
  }

  private fun logRoutedDevice(track: AudioTrack) {
    if (Build.VERSION.SDK_INT < 23) return
    try {
      val routed = track.routedDevice
      if (routed == null) {
        Log.i(TAG, "AudioTrack routed device unavailable after play()")
        return
      }
      Log.i(
        TAG,
        "AudioTrack routed to: id=${routed.id}, type=${routed.type}, product=${routed.productName ?: "unknown"}"
      )
    } catch (t: Throwable) {
      Log.w(TAG, "Failed to inspect routed device: ${t.message}")
    }
  }

  private fun expandMonoToStereo(mono: ShortArray): ShortArray {
    if (mono.isEmpty()) return mono
    val stereo = ShortArray(mono.size * 2)
    var src = 0
    var dst = 0
    while (src < mono.size && dst + 1 < stereo.size) {
      val sample = mono[src]
      stereo[dst] = sample
      stereo[dst + 1] = sample
      src += 1
      dst += 2
    }
    return stereo
  }
}
