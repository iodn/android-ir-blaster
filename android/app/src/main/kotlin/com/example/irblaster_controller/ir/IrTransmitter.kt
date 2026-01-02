package org.nslabs.ir_blaster

interface IrTransmitter {
    fun transmitRaw(frequencyHz: Int, patternUs: IntArray): Boolean
}
