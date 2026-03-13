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
  private data class EndpointPair(val outEp: UsbEndpoint, val inEp: UsbEndpoint, val endpointNumber: Int)

  companion object {
    const val ACTION_USB_PERMISSION = "org.nslabs.irblaster.USB_PERMISSION"
  }

  fun scanSupported(): List<UsbDevice> = usb.deviceList.values.filter { UsbDeviceFilter.isSupported(it) }

  fun requestPermission(device: UsbDevice) {
    val intent = Intent(ACTION_USB_PERMISSION).setPackage(context.packageName)
    val pi = PendingIntent.getBroadcast(context, 0, intent, permissionPiFlags())
    usb.requestPermission(device, pi)
  }

  fun openTransmitter(device: UsbDevice): UsbIrTransmitter? {
    Log.i(
      TAG,
      "openTransmitter: ${device.productName} vid=0x${device.vendorId.toString(16)} pid=0x${device.productId.toString(16)} ifCount=${device.interfaceCount}"
    )

    if (!UsbDeviceFilter.isSupported(device)) {
      Log.w(TAG, "Device is not supported by filter (vid/pid/interface constraints)")
      return null
    }

    val protocol: UsbWireProtocol = when {
      UsbDeviceFilter.isElkSmart(device) -> ElkSmartUsbProtocolFormatter()
      UsbDeviceFilter.isZaZaRemoteFamily(device) -> UsbProtocolFormatter
      UsbDeviceFilter.isTiqiaaTviewFamily(device) -> UsbProtocolFormatter
      else -> UsbProtocolFormatter
    }

    for (i in 0 until device.interfaceCount) {
      val intf = device.getInterface(i)
      val pairs = findEndpointPairs(intf)
      if (pairs.isEmpty()) continue

      for (pair in pairs) {
        val conn: UsbDeviceConnection = usb.openDevice(device) ?: run {
          Log.w(TAG, "openDevice() returned null")
          return null
        }

        if (!conn.claimInterface(intf, true)) {
          Log.w(
            TAG,
            "claimInterface failed if=${intf.id} class=${intf.interfaceClass} sub=${intf.interfaceSubclass} proto=${intf.interfaceProtocol}"
          )
          conn.close()
          continue
        }

        Log.i(
          TAG,
          "Trying IF=${intf.id} EP#${pair.endpointNumber} OUT(addr=${pair.outEp.address},type=${pair.outEp.type},mps=${pair.outEp.maxPacketSize}) " +
            "IN(addr=${pair.inEp.address},type=${pair.inEp.type},mps=${pair.inEp.maxPacketSize}) protocol=${protocol.name}"
        )

        val tx = UsbIrTransmitter.create(
          device = device,
          connection = conn,
          claimedInterface = intf,
          outEndpoint = pair.outEp,
          inEndpoint = pair.inEp,
          protocol = protocol
        )

        if (tx != null) {
          Log.i(TAG, "Opened USB transmitter on IF=${intf.id} EP#${pair.endpointNumber} protocol=${protocol.name}")
          return tx
        }

        try {
          conn.releaseInterface(intf)
        } catch (_: Throwable) {
        }
        try {
          conn.close()
        } catch (_: Throwable) {
        }
      }
    }

    Log.w(TAG, "Failed to open USB transmitter on all endpoint pairs protocol=${protocol.name}")
    return null
  }

  private fun endpointNumber(ep: UsbEndpoint): Int {
    return ep.address and UsbConstants.USB_ENDPOINT_NUMBER_MASK
  }

  private fun findEndpointPairs(intf: UsbInterface): List<EndpointPair> {
    fun collectForType(typeWanted: Int): List<EndpointPair> {
      val outByNum = HashMap<Int, UsbEndpoint>()
      val inByNum = HashMap<Int, UsbEndpoint>()

      for (i in 0 until intf.endpointCount) {
        val ep = intf.getEndpoint(i)
        if (ep.type != typeWanted) continue
        val num = endpointNumber(ep)
        if (ep.direction == UsbConstants.USB_DIR_OUT) outByNum[num] = ep
        if (ep.direction == UsbConstants.USB_DIR_IN) inByNum[num] = ep
      }

      val nums = (outByNum.keys intersect inByNum.keys).toList().sorted()
      return nums.mapNotNull { n ->
        val out = outByNum[n]
        val inn = inByNum[n]
        if (out != null && inn != null) EndpointPair(out, inn, n) else null
      }
    }

    val bulkPairs = collectForType(UsbConstants.USB_ENDPOINT_XFER_BULK)
    if (bulkPairs.isNotEmpty()) return bulkPairs
    return collectForType(UsbConstants.USB_ENDPOINT_XFER_INT)
  }

  private fun permissionPiFlags(): Int {
    val base = PendingIntent.FLAG_UPDATE_CURRENT
    return if (android.os.Build.VERSION.SDK_INT >= 31) {
      base or PendingIntent.FLAG_MUTABLE
    } else {
      base
    }
  }
}
