package org.nslabs.ir_blaster

import android.hardware.ConsumerIrManager

class InternalIrTransmitter(private val mgr: ConsumerIrManager?) : IrTransmitter {

    override fun transmitRaw(frequencyHz: Int, patternUs: IntArray): Boolean {
        val m = mgr ?: return false
        if (!m.hasIrEmitter()) return false
        if (patternUs.isEmpty()) return false

        return try {
            m.transmit(frequencyHz, patternUs)
            true
        } catch (_: Throwable) {
            false
        }
    }
}
