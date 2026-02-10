package org.nslabs.ir_blaster

import android.hardware.usb.UsbDevice

object UsbDeviceFilter {
  private const val TIQIAA_VID_1 = 0x10C4
  private const val TIQIAA_VID_2 = 0x045E
  private const val TIQIAA_PID = 0x8468

  private const val ELKSMART_VID = 0x045C
  private val ELKSMART_PIDS = setOf(0x0132, 0x0184, 0x0195)

  private val OTHER_KNOWN_ELKSMART_PIDS = setOf(0x014A, 0x02AA)

  fun hasKnownVidPid(device: UsbDevice): Boolean {
    val vid = device.vendorId
    val pid = device.productId
    return isTiqiaaTviewFamily(device) ||
      (vid == ELKSMART_VID && (pid in ELKSMART_PIDS || pid in OTHER_KNOWN_ELKSMART_PIDS))
  }

  fun isSupported(device: UsbDevice): Boolean = hasKnownVidPid(device)

  fun isElkSmart(device: UsbDevice): Boolean {
    val vid = device.vendorId
    val pid = device.productId
    return vid == ELKSMART_VID && pid in ELKSMART_PIDS
  }

  fun isTiqiaaTviewFamily(device: UsbDevice): Boolean {
    val vid = device.vendorId
    val pid = device.productId
    return pid == TIQIAA_PID && (vid == TIQIAA_VID_1 || vid == TIQIAA_VID_2)
  }

  fun isZaZaRemoteFamily(device: UsbDevice): Boolean {
    return isTiqiaaTviewFamily(device)
  }
}
