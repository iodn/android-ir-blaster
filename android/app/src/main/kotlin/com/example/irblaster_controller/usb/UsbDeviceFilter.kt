package org.nslabs.ir_blaster

import android.hardware.usb.UsbDevice

object UsbDeviceFilter {

    fun hasKnownVidPid(device: UsbDevice): Boolean {
        val vid = device.vendorId
        val pid = device.productId
        return (vid == 0x10C4 && pid == 0x8468) ||
               (vid == 0x045E && pid == 0x8468) ||
               (vid == 0x045C && (pid == 0x0195 || pid == 0x014A || pid == 0x02AA))
    }

    fun isSupported(device: UsbDevice): Boolean {
        // Relax detection: rely on known VID/PID only.
        // Some dongle variants expose multiple interfaces or expose endpoints on a non-zero interface.
        return hasKnownVidPid(device)
    }
}
