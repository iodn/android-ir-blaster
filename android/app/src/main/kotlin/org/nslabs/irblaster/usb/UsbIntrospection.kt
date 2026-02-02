package org.nslabs.ir_blaster

import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbEndpoint
import android.hardware.usb.UsbInterface

object UsbIntrospection {

    fun describeDevice(device: UsbDevice, hasPermission: Boolean): Map<String, Any?> {
        val interfaces = ArrayList<Map<String, Any?>>()

        for (i in 0 until device.interfaceCount) {
            val intf: UsbInterface = device.getInterface(i)
            val eps = ArrayList<Map<String, Any?>>()

            for (e in 0 until intf.endpointCount) {
                val ep: UsbEndpoint = intf.getEndpoint(e)
                eps.add(
                    mapOf(
                        "address" to ep.address,
                        "direction" to ep.direction,
                        "type" to ep.type,
                        "maxPacketSize" to ep.maxPacketSize,
                        "interval" to ep.interval
                    )
                )
            }

            interfaces.add(
                mapOf(
                    "id" to intf.id,
                    "class" to intf.interfaceClass,
                    "subclass" to intf.interfaceSubclass,
                    "protocol" to intf.interfaceProtocol,
                    "endpointCount" to intf.endpointCount,
                    "endpoints" to eps
                )
            )
        }

        return mapOf(
            "vendorId" to device.vendorId,
            "productId" to device.productId,
            "deviceId" to device.deviceId,
            "productName" to (device.productName ?: ""),
            "deviceName" to (device.deviceName ?: ""),
            "manufacturerName" to (device.manufacturerName ?: ""),
            "hasPermission" to hasPermission,
            "interfaceCount" to device.interfaceCount,
            "interfaces" to interfaces
        )
    }
}
