package org.nslabs.ir_blaster.audio

import kotlin.math.roundToInt
import kotlin.math.sin

internal class AudioPcmBuilder(
  carrierHz: Int,
  private val patternUs: IntArray,
  private val mode: Short,
  private val prePadFrames: Long = 0L,
  private val sampleRate: Int = 48_000,
) {
  val channelCount: Int = if (mode.toInt() == 2) 2 else 1
  val pcm: ShortArray

  private val toneHz: Int = (carrierHz / 2).coerceAtLeast(1)
  private val phaseInc: Double = (toneHz.toDouble() * TWO_PI) / sampleRate.toDouble()

  init {
    val padFrames = prePadFrames.coerceAtLeast(0L)

    var totalFrames = padFrames
    for (d in patternUs) {
      val us = d.coerceAtLeast(0)
      totalFrames += ((us.toDouble() * sampleRate) / 1_000_000.0)
        .roundToInt()
        .coerceAtLeast(0)
        .toLong()
    }

    val totalSamplesLong = totalFrames * channelCount.toLong()
    val totalSamples = totalSamplesLong.coerceAtMost(Int.MAX_VALUE.toLong()).toInt()

    pcm = ShortArray(totalSamples)

    var idx = 0

    val padFramesInt = padFrames.coerceAtMost(Int.MAX_VALUE.toLong()).toInt()
    run pad@{
      repeat(padFramesInt) {
        idx = writeFrame(idx, 0)
        if (idx >= pcm.size) return@pad
      }

      var on = true
      for (d in patternUs) {
        val frames = ((d.toDouble() * sampleRate) / 1_000_000.0).roundToInt().coerceAtLeast(0)
        if (frames <= 0) {
          on = !on
          continue
        }

        if (on) {
          var phase = 0.0
          for (i in 0 until frames) {
            val s = (sin(phase) * AMP).toInt().toShort()
            idx = writeFrame(idx, s)
            if (idx >= pcm.size) break
            phase += phaseInc
            if (phase >= TWO_PI) phase -= TWO_PI
          }
        } else {
          for (i in 0 until frames) {
            idx = writeFrame(idx, 0)
            if (idx >= pcm.size) break
          }
        }

        if (idx >= pcm.size) break
        on = !on
      }
    }
  }

  private fun writeFrame(idx0: Int, s: Short): Int {
    var idx = idx0
    if (idx >= pcm.size) return idx

    if (channelCount == 1) {
      pcm[idx] = s
      return idx + 1
    }

    pcm[idx] = s
    if (idx + 1 < pcm.size) {
      pcm[idx + 1] = (-s).toInt().toShort()
    }
    return idx + 2
  }

  companion object {
    private const val AMP = 32000.0
    private const val TWO_PI = 6.283185307179586
  }
}
