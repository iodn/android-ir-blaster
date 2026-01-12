package org.nslabs.ir_blaster

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.hardware.usb.UsbConstants
import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbDeviceConnection
import android.hardware.usb.UsbEndpoint
import android.hardware.usb.UsbInterface
import android.hardware.usb.UsbManager
import android.util.Log

class UsbDiscoveryManager(
    private val context: Context,
    private val usb: UsbManager
) {
    private val TAG = "UsbDiscovery"

    companion object {
        const val ACTION_USB_PERMISSION = "org.nslabs.irblaster.USB_PERMISSION"
    }

    fun scanSupported(): List<UsbDevice> =
        usb.deviceList.values.filter { UsbDeviceFilter.isSupported(it) }

    fun requestPermission(device: UsbDevice) {
        // IMPORTANT: must be MUTABLE on Android 12+ so the system can add EXTRA_DEVICE / EXTRA_PERMISSION_GRANTED.
        val intent = Intent(ACTION_USB_PERMISSION).setPackage(context.packageName)
        val pi = PendingIntent.getBroadcast(context, 0, intent, permissionPiFlags())
        usb.requestPermission(device, pi)
    }

    fun openTransmitter(device: UsbDevice): UsbIrTransmitter? {
        Log.i(
            TAG,
            "openTransmitter: ${device.productName} vid=0x${device.vendorId.toString(16)} " +
                "pid=0x${device.productId.toString(16)} ifCount=${device.interfaceCount}"
        )

        if (!UsbDeviceFilter.isSupported(device)) {
            Log.w(TAG, "Device is not supported by filter (vid/pid/interface constraints)")
            return null
        }

        // Search all interfaces for a pair of BULK OUT + BULK IN endpoints.
        var selectedInterface: UsbInterface? = null
        var outEp: UsbEndpoint? = null
        var inEp: UsbEndpoint? = null
        for (i in 0 until device.interfaceCount) {
            val intf = device.getInterface(i)
            val pair = findBulkOutIn(intf)
            if (pair != null) {
                selectedInterface = intf
                outEp = pair.first
                inEp = pair.second
                break
            }
        }

        val intf: UsbInterface = selectedInterface ?: run {
            Log.w(TAG, "Could not find required BULK OUT + BULK IN endpoints on any interface")
            return null
        }

        val outEpNonNull = outEp!!
        val inEpNonNull = inEp!!

        val conn: UsbDeviceConnection = usb.openDevice(device) ?: run {
            Log.w(TAG, "openDevice() returned null")
            return null
        }

        if (!conn.claimInterface(intf, true)) {
            Log.w(
                TAG,
                "claimInterface failed if=${intf.id} class=${intf.interfaceClass} " +
                    "sub=${intf.interfaceSubclass} proto=${intf.interfaceProtocol}"
            )
            conn.close()
            return null
        }

        Log.i(
            TAG,
            "Selected IF=${intf.id} OUT(mps=${outEp.maxPacketSize}) IN(mps=${inEp.maxPacketSize})"
        )

        return UsbIrTransmitter(
            device = device,
            connection = conn,
            claimedInterface = intf,
            outEndpoint = outEpNonNull,
            inEndpoint = inEpNonNull,
            formatter = UsbProtocolFormatter
        )
    }

    private fun findBulkOutIn(intf: UsbInterface): Pair<UsbEndpoint, UsbEndpoint>? {
        var outBulk: UsbEndpoint? = null
        var inBulk: UsbEndpoint? = null

        for (i in 0 until intf.endpointCount) {
            val ep = intf.getEndpoint(i)
            val isBulk = ep.type == UsbConstants.USB_ENDPOINT_XFER_BULK
            if (!isBulk) continue

            if (ep.direction == UsbConstants.USB_DIR_OUT && outBulk == null) outBulk = ep
            if (ep.direction == UsbConstants.USB_DIR_IN && inBulk == null) inBulk = ep
        }

        val out = outBulk ?: return null
        val inn = inBulk ?: return null
        return Pair(out, inn)
    }

    private fun permissionPiFlags(): Int {
        // Use UPDATE_CURRENT so repeated requests reuse/update the same PendingIntent.
        // On Android S+ require MUTABLE so system can add extras.
        val base = PendingIntent.FLAG_UPDATE_CURRENT
        return if (android.os.Build.VERSION.SDK_INT >= 31) {
            base or PendingIntent.FLAG_MUTABLE
        } else {
            base
        }
    }
}
