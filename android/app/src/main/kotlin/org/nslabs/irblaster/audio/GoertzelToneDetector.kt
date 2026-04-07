package org.nslabs.ir_blaster.audio

import kotlin.math.PI
import kotlin.math.cos

internal class GoertzelToneDetector(
    sampleRate: Int,
    targetHz: Double,
    windowSize: Int,
) {
    private val coeff: Double

    init {
        val k = (0.5 + (windowSize * targetHz) / sampleRate).toInt()
        val omega = (2.0 * PI * k) / windowSize.toDouble()
        coeff = 2.0 * cos(omega)
    }

    fun magnitudeSquared(samples: ShortArray, offset: Int, length: Int): Double {
        var q0: Double
        var q1 = 0.0
        var q2 = 0.0
        val end = (offset + length).coerceAtMost(samples.size)
        for (i in offset until end) {
            q0 = coeff * q1 - q2 + samples[i].toDouble()
            q2 = q1
            q1 = q0
        }
        return q1 * q1 + q2 * q2 - coeff * q1 * q2
    }
}
