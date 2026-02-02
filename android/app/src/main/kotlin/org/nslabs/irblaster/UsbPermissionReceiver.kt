package org.nslabs.ir_blaster

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbManager
import android.util.Log

class UsbPermissionReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != UsbDiscoveryManager.ACTION_USB_PERMISSION) return

        val device: UsbDevice? = if (android.os.Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableExtra(UsbManager.EXTRA_DEVICE, UsbDevice::class.java)
        } else {
            @Suppress("DEPRECATION")
            intent.getParcelableExtra(UsbManager.EXTRA_DEVICE)
        }

        val granted = intent.getBooleanExtra(UsbManager.EXTRA_PERMISSION_GRANTED, false)

        // DO NOT forward/rebroadcast. MainActivity's dynamic receiver will also receive this broadcast.
        Log.i(
            "UsbPermissionReceiver",
            "permission result granted=$granted dev=${device?.productName} " +
                "vid=0x${device?.vendorId?.toString(16)} pid=0x${device?.productId?.toString(16)}"
        )
    }
}
