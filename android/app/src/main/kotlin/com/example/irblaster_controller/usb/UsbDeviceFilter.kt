package org.nslabs.ir_blaster

import android.hardware.usb.UsbDevice

object UsbDeviceFilter {

    fun hasKnownVidPid(device: UsbDevice): Boolean {
        val vid = device.vendorId
        val pid = device.productId
        return (vid == 0x10C4 && pid == 0x8468) || (vid == 0x045E && pid == 0x8468)
    }

    fun isSupported(device: UsbDevice): Boolean {
        if (!hasKnownVidPid(device)) return false
        if (device.interfaceCount != 1) return false
        val intf0 = device.getInterface(0)
        if (intf0.endpointCount <= 0) return false
        return true
    }
}
