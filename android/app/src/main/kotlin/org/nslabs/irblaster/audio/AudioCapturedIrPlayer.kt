package org.nslabs.ir_blaster.audio

import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.Build

internal object AudioCapturedIrPlayer {
    fun playMonoPcm16(
        pcmBytes: ByteArray,
        sampleRate: Int,
        mode: Short,
    ): Boolean {
        if (pcmBytes.isEmpty()) return false

        val mono = ShortArray(pcmBytes.size / 2)
        var i = 0
        var s = 0
        while (i + 1 < pcmBytes.size && s < mono.size) {
            val lo = pcmBytes[i].toInt() and 0xFF
            val hi = pcmBytes[i + 1].toInt()
            mono[s] = ((hi shl 8) or lo).toShort()
            i += 2
            s += 1
        }

        val channelCount = if (mode.toInt() == 2) 2 else 1
        val out = if (channelCount == 1) {
            mono
        } else {
            ShortArray(mono.size * 2).also { stereo ->
                var src = 0
                var dst = 0
                while (src < mono.size && dst + 1 < stereo.size) {
                    val v = mono[src]
                    stereo[dst] = v
                    stereo[dst + 1] = (-v).toInt().toShort()
                    src += 1
                    dst += 2
                }
            }
        }

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
            .setSampleRate(sampleRate)
            .setChannelMask(channelMask)
            .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
            .build()

        val bufferBytes = out.size * 2
        val track = AudioTrack(
            attributes,
            format,
            bufferBytes,
            AudioTrack.MODE_STATIC,
            AudioManager.AUDIO_SESSION_ID_GENERATE,
        )

        return try {
            if (Build.VERSION.SDK_INT >= 21) {
                track.setVolume(1.0f)
            } else {
                @Suppress("DEPRECATION")
                track.setStereoVolume(1.0f, 1.0f)
            }
            val written = track.write(out, 0, out.size)
            if (written <= 0) {
                track.release()
                return false
            }
            track.play()
            val frames = out.size / channelCount
            val durationMs = ((frames.toDouble() / sampleRate.toDouble()) * 1000.0).toLong()
                .coerceAtLeast(50L)
            Thread {
                try {
                    Thread.sleep(durationMs + 250L)
                } catch (_: Throwable) {
                }
                try {
                    track.stop()
                } catch (_: Throwable) {
                }
                try {
                    track.release()
                } catch (_: Throwable) {
                }
            }.start()
            true
        } catch (_: Throwable) {
            try {
                track.release()
            } catch (_: Throwable) {
            }
            false
        }
    }
}
