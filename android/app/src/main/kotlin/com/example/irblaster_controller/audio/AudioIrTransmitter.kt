package org.nslabs.ir_blaster.audio

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Build
import android.util.Log

class AudioIrTransmitter(
  private val mode: Short,
  private val prePadFrames: Long = 0L,
) {
  @Volatile private var activeTrack: AudioTrack? = null

  fun transmitRaw(freqHz: Int, patternUs: IntArray): Boolean {
    return try {
      val safeFreq = freqHz.coerceIn(15_000, 60_000)
      val builder = AudioPcmBuilder(
        carrierHz = safeFreq,
        patternUs = patternUs,
        mode = mode,
        prePadFrames = prePadFrames,
      )

      val pcm = builder.pcm
      if (pcm.isEmpty()) return false

      val channelMask = if (mode.toInt() == 1) {
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

      val frames = pcm.size / builder.channelCount
      scheduleRelease(track, frames)

      true
    } catch (t: Throwable) {
      Log.w("AudioIrTx", "transmitRaw failed: ${t.message}")
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
}
