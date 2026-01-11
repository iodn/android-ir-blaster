package org.nslabs.ir_blaster

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.hardware.ConsumerIrManager
import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbManager
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.content.pm.PackageManager
import android.content.ComponentName
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.nslabs.ir_blaster.audio.AudioIrTransmitter

class MainActivity : FlutterActivity() {

  private enum class TxType { INTERNAL, USB, AUDIO_1_LED, AUDIO_2_LED }

  private val TAG = "IRBlaster"

  private var currentTxType: TxType = TxType.INTERNAL
  private var autoSwitchEnabled: Boolean = false
  private var openOnUsbAttachEnabled: Boolean = false

  private var irManager: ConsumerIrManager? = null
  private var internalTx: InternalIrTransmitter? = null

  private var usbManager: UsbManager? = null
  private var usbDiscovery: UsbDiscoveryManager? = null
  private var usbTransmitter: UsbIrTransmitter? = null

  private val audio1Tx = AudioIrTransmitter(mode = 1)
  private val audio2Tx = AudioIrTransmitter(mode = 2)

  private val prefs by lazy {
    applicationContext.getSharedPreferences("ir_blaster_prefs", Context.MODE_PRIVATE)
  }

  private val mainHandler = Handler(Looper.getMainLooper())

  private var txEventSink: EventChannel.EventSink? = null
  private var lastEmittedSnapshot: String? = null

  private fun loadTxTypeFromPrefs(): TxType {
    val v = prefs.getString("tx_type", TxType.INTERNAL.name) ?: TxType.INTERNAL.name
    return try { TxType.valueOf(v) } catch (_: Throwable) { TxType.INTERNAL }
  }

  private fun saveTxTypeToPrefs(t: TxType) {
    prefs.edit().putString("tx_type", t.name).apply()
  }

  private fun loadPreferredUiTxTypeFromPrefs(): String {
    val v = prefs.getString("ui_tx_type", null)
    return if (!v.isNullOrBlank()) v else currentTxType.name
  }

  private fun savePreferredUiTxTypeToPrefs(v: String) {
    prefs.edit().putString("ui_tx_type", v).apply()
  }

  private fun isValidPreferredUiTxType(v: String): Boolean {
    return v == "INTERNAL" || v == "USB" || v == "AUDIO_1_LED" || v == "AUDIO_2_LED"
  }

  private fun loadAutoSwitchFromPrefs(defaultValue: Boolean): Boolean {
    return try { prefs.getBoolean("auto_switch", defaultValue) } catch (_: Throwable) { defaultValue }
  }

  private fun saveAutoSwitchToPrefs(v: Boolean) {
    prefs.edit().putBoolean("auto_switch", v).apply()
  }

  private fun loadOpenOnUsbAttachFromPrefs(defaultValue: Boolean): Boolean {
    return try { prefs.getBoolean("open_on_usb_attach", defaultValue) } catch (_: Throwable) { defaultValue }
  }

  private fun saveOpenOnUsbAttachToPrefs(v: Boolean) {
    prefs.edit().putBoolean("open_on_usb_attach", v).apply()
  }

  private fun setUsbAttachAliasEnabled(enabled: Boolean) {
    val pm = applicationContext.packageManager
    val cn = ComponentName(applicationContext, "org.nslabs.ir_blaster.UsbAttachAlias")
    val state = if (enabled) PackageManager.COMPONENT_ENABLED_STATE_ENABLED else PackageManager.COMPONENT_ENABLED_STATE_DISABLED
    try {
      pm.setComponentEnabledSetting(cn, state, PackageManager.DONT_KILL_APP)
      Log.i(TAG, "UsbAttachAlias set to ${if (enabled) "ENABLED" else "DISABLED"}")
    } catch (t: Throwable) {
      Log.w(TAG, "Failed to toggle UsbAttachAlias: ${t.message}")
    }
  }

  private fun internalAvailable(): Boolean = (irManager?.hasIrEmitter() == true)

  private fun openUsbIfPermitted(): UsbIrTransmitter? {
    val disc = usbDiscovery ?: return null
    val mgr = usbManager ?: return null
    val dev = disc.scanSupported().firstOrNull() ?: return null
    return if (mgr.hasPermission(dev)) openUsbDevice(dev) else null
  }

  private fun ensureUsbOpenedIfPermitted(): Boolean {
    if (usbTransmitter != null) return true
    val disc = usbDiscovery ?: return false
    val mgr = usbManager ?: return false
    val dev = try { disc.scanSupported().firstOrNull() } catch (_: Throwable) { null } ?: return false
    if (!mgr.hasPermission(dev)) return false
    val opened = openUsbDevice(dev)
    if (opened != null) {
      usbTransmitter = opened
      return true
    }
    return false
  }

  private fun applyAutoSwitchIfEnabled(reason: String) {
    if (!autoSwitchEnabled) return
    if (!internalAvailable()) return
    if (currentTxType == TxType.AUDIO_1_LED || currentTxType == TxType.AUDIO_2_LED) return

    val usbReady = ensureUsbOpenedIfPermitted()
    val desired = if (usbReady) TxType.USB else TxType.INTERNAL

    if (desired != currentTxType) {
      currentTxType = desired
      saveTxTypeToPrefs(currentTxType)
      Log.i(TAG, "Auto-switch applied ($reason): currentTxType=${currentTxType.name}")
      emitTxStatus("auto_switch:$reason")
      emitTxStatusDelayed("auto_switch_delayed:$reason", 350L)
    }
  }

  private fun buildTxCapsMap(): Map<String, Any?> {
    val hasInternal = internalAvailable()
    val usbDevs = try {
      val mgr = usbManager
      usbDiscovery?.scanSupported()?.map { d ->
        mapOf(
          "vendorId" to d.vendorId,
          "productId" to d.productId,
          "deviceId" to d.deviceId,
          "productName" to (d.productName ?: ""),
          "deviceName" to (d.deviceName ?: ""),
          "hasPermission" to (mgr?.hasPermission(d) ?: false)
        )
      } ?: emptyList()
    } catch (_: Throwable) {
      emptyList<Map<String, Any?>>()
    }

    return mapOf(
      "hasInternal" to hasInternal,
      "hasUsb" to usbDevs.isNotEmpty(),
      "usbOpened" to (usbTransmitter != null),
      "hasAudio" to true,
      "currentType" to currentTxType.name,
      "usbDevices" to usbDevs,
      "autoSwitchEnabled" to autoSwitchEnabled
    )
  }

  private fun emitTxStatus(reason: String) {
    val sink = txEventSink ?: return
    val payload = buildTxCapsMap()

    val snapshot = try { payload.toString() } catch (_: Throwable) { null }
    if (snapshot != null && snapshot == lastEmittedSnapshot) return
    lastEmittedSnapshot = snapshot

    runOnUiThread {
      try { sink.success(payload) } catch (t: Throwable) { Log.w(TAG, "emitTxStatus failed ($reason): ${t.message}") }
    }
  }

  private fun emitTxStatusDelayed(reason: String, delayMs: Long) {
    mainHandler.postDelayed({ emitTxStatus(reason) }, delayMs)
  }

  private val usbReceiver = object : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
      val i = intent ?: return
      when (i.action) {
        UsbManager.ACTION_USB_DEVICE_ATTACHED -> {
          val dev = getUsbDeviceExtra(i) ?: return
          Log.i(TAG, "USB attached vid=0x${dev.vendorId.toString(16)} pid=0x${dev.productId.toString(16)} name=${dev.productName}")

          if (UsbDeviceFilter.isSupported(dev)) {
            val mgr = usbManager
            val disc = usbDiscovery
            if (mgr != null && disc != null) {
              if (!mgr.hasPermission(dev)) {
                Log.i(TAG, "Requesting USB permission on attach...")
                disc.requestPermission(dev)
              } else {
                openUsbDevice(dev)?.let { usbTransmitter = it }
                applyAutoSwitchIfEnabled("usb_attached_permitted")
              }
            }
          }

          emitTxStatus("usb_attached")
          emitTxStatusDelayed("usb_attached_delayed", 350L)
        }

        UsbManager.ACTION_USB_DEVICE_DETACHED -> {
          val dev = getUsbDeviceExtra(i) ?: return
          Log.i(TAG, "USB detached vid=0x${dev.vendorId.toString(16)} pid=0x${dev.productId.toString(16)}")

          if (UsbDeviceFilter.hasKnownVidPid(dev)) {
            usbTransmitter?.closeSafely()
            usbTransmitter = null
          }

          applyAutoSwitchIfEnabled("usb_detached")
          emitTxStatus("usb_detached")
          emitTxStatusDelayed("usb_detached_delayed", 450L)
        }

        UsbDiscoveryManager.ACTION_USB_PERMISSION -> {
          val dev = getUsbDeviceExtra(i)
          val granted = i.getBooleanExtra(UsbManager.EXTRA_PERMISSION_GRANTED, false)
          Log.i(TAG, "USB permission result granted=$granted dev=${dev?.productName} vid=0x${dev?.vendorId?.toString(16)} pid=0x${dev?.productId?.toString(16)}")

          if (!granted || dev == null || !UsbDeviceFilter.isSupported(dev)) {
            usbTransmitter?.closeSafely()
            usbTransmitter = null
            applyAutoSwitchIfEnabled("usb_permission_denied")
            emitTxStatus("usb_permission_denied")
            emitTxStatusDelayed("usb_permission_denied_delayed", 350L)
            return
          }

          val opened = openUsbDevice(dev)
          if (opened != null) {
            usbTransmitter = opened
            applyAutoSwitchIfEnabled("usb_permission_granted")
          } else {
            Log.w(TAG, "openTransmitter() returned null (could not claim interface / endpoints)")
            applyAutoSwitchIfEnabled("usb_open_failed")
          }

          emitTxStatus("usb_permission_result")
          emitTxStatusDelayed("usb_permission_result_delayed", 350L)
        }
      }
    }
  }

  companion object {
    private const val CHANNEL = "org.nslabs/irtransmitter"
    private const val EVENT_CHANNEL = "org.nslabs/irtransmitter_events"

    private const val DEFAULT_HEX_FREQUENCY = 38000
    private const val MIN_IR_HZ = 15000
    private const val MAX_IR_HZ = 60000
  }

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    irManager = applicationContext.getSystemService(Context.CONSUMER_IR_SERVICE) as? ConsumerIrManager
    internalTx = InternalIrTransmitter(irManager)

    usbManager = applicationContext.getSystemService(Context.USB_SERVICE) as? UsbManager
    usbDiscovery = usbManager?.let { UsbDiscoveryManager(applicationContext, it) }

    currentTxType = loadTxTypeFromPrefs()
    autoSwitchEnabled = loadAutoSwitchFromPrefs(defaultValue = internalAvailable())
    openOnUsbAttachEnabled = loadOpenOnUsbAttachFromPrefs(defaultValue = false)
    setUsbAttachAliasEnabled(openOnUsbAttachEnabled)

    if (currentTxType == TxType.AUDIO_1_LED || currentTxType == TxType.AUDIO_2_LED) {
      autoSwitchEnabled = false
      saveAutoSwitchToPrefs(false)
    }

    registerUsbReceiver()

    requestUsbPermissionIfDongleAlreadyAttached()
    openUsbIfPermitted()?.let { usbTransmitter = it }

    applyAutoSwitchIfEnabled("startup")

    if (!internalAvailable() && usbTransmitter != null && currentTxType == TxType.INTERNAL) {
      currentTxType = TxType.USB
      saveTxTypeToPrefs(currentTxType)
    }

    EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)
      .setStreamHandler(object : EventChannel.StreamHandler {
        override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
          txEventSink = events
          lastEmittedSnapshot = null
          emitTxStatus("event_listen")
          emitTxStatusDelayed("event_listen_delayed", 250L)
        }

        override fun onCancel(arguments: Any?) {
          txEventSink = null
          lastEmittedSnapshot = null
        }
      })

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
      .setMethodCallHandler { call, result ->
        when (call.method) {
          "transmit" -> handleTransmit(call, result)
          "transmitRaw" -> handleTransmitRaw(call, result)
          "hasIrEmitter" -> handleHasAnyEmitter(result)
          "getTransmitterCapabilities" -> handleGetTxCaps(result)
          "setTransmitterType" -> handleSetTxType(call, result)
          "getTransmitterType" -> result.success(currentTxType.name)
          "usbScanAndRequest" -> handleUsbScanAndRequest(result)
          "getSupportedFrequencies" -> handleGetSupportedFrequencies(result)
          "usbDescribe" -> handleUsbDescribe(result)
          "getPreferredTransmitterType" -> result.success(loadPreferredUiTxTypeFromPrefs())
          "setPreferredTransmitterType" -> handleSetPreferredUiTxType(call, result)
          "getAutoSwitchEnabled" -> result.success(autoSwitchEnabled)
          "setAutoSwitchEnabled" -> handleSetAutoSwitchEnabled(call, result)
          "getOpenOnUsbAttachEnabled" -> result.success(openOnUsbAttachEnabled)
          "setOpenOnUsbAttachEnabled" -> handleSetOpenOnUsbAttachEnabled(call, result)
          else -> result.notImplemented()
        }
      }

    emitTxStatus("startup_done")
    emitTxStatusDelayed("startup_done_delayed", 350L)
  }

  override fun onDestroy() {
    try { applicationContext.unregisterReceiver(usbReceiver) } catch (_: Throwable) {}
    try { mainHandler.removeCallbacksAndMessages(null) } catch (_: Throwable) {}
    txEventSink = null
    usbTransmitter?.closeSafely()
    usbTransmitter = null
    audio1Tx.stop()
    audio2Tx.stop()
    super.onDestroy()
  }

  private fun registerUsbReceiver() {
    val f = IntentFilter().apply {
      addAction(UsbManager.ACTION_USB_DEVICE_ATTACHED)
      addAction(UsbManager.ACTION_USB_DEVICE_DETACHED)
      addAction(UsbDiscoveryManager.ACTION_USB_PERMISSION)
    }
    if (android.os.Build.VERSION.SDK_INT >= 33) {
      applicationContext.registerReceiver(usbReceiver, f, Context.RECEIVER_NOT_EXPORTED)
    } else {
      @Suppress("DEPRECATION")
      applicationContext.registerReceiver(usbReceiver, f)
    }
  }

  private fun requestUsbPermissionIfDongleAlreadyAttached() {
    val mgr = usbManager ?: return
    val disc = usbDiscovery ?: return
    val dev = disc.scanSupported().firstOrNull() ?: return
    if (!mgr.hasPermission(dev)) {
      Log.i(TAG, "Supported USB dongle already attached; requesting permission now...")
      disc.requestPermission(dev)
    } else {
      Log.i(TAG, "Supported USB dongle already attached and already permitted.")
    }
  }

  private fun openUsbDevice(device: UsbDevice): UsbIrTransmitter? {
    val disc = usbDiscovery ?: return null
    val tx = disc.openTransmitter(device)
    if (tx != null) {
      Log.i(TAG, "USB transmitter opened for ${device.productName} (vid=0x${device.vendorId.toString(16)} pid=0x${device.productId.toString(16)})")
    }
    return tx
  }

  private fun getOrOpenUsbTransmitterOrRequest(): UsbIrTransmitter? {
    usbTransmitter?.let { return it }
    val disc = usbDiscovery ?: return null
    val mgr = usbManager ?: return null
    val dev = disc.scanSupported().firstOrNull() ?: return null
    if (!mgr.hasPermission(dev)) {
      disc.requestPermission(dev)
      return null
    }
    return disc.openTransmitter(dev)?.also { usbTransmitter = it }
  }

  private fun handleHasAnyEmitter(result: MethodChannel.Result) {
    val internal = internalAvailable()
    val usbPresent = try { usbDiscovery?.scanSupported()?.isNotEmpty() ?: false } catch (_: Throwable) { false }
    val audioPresent = true
    result.success(internal || usbPresent || audioPresent)
  }

  private fun handleTransmit(call: MethodCall, result: MethodChannel.Result) {
    val pattern = call.readIntArrayArg("list")
    if (pattern == null || pattern.isEmpty()) {
      result.error("NO_PATTERN", "No pattern provided", null)
      return
    }
    if (!validatePattern(pattern)) {
      result.error("BAD_PATTERN", "All durations must be > 0 µs", null)
      return
    }

    val frequency = DEFAULT_HEX_FREQUENCY

    when (currentTxType) {
      TxType.USB -> {
        val usb = getOrOpenUsbTransmitterOrRequest()
        if (usb == null) {
          val dev = usbDiscovery?.scanSupported()?.firstOrNull()
          if (dev == null) result.error("NO_USB_DEVICE", "No supported USB IR device is attached", null)
          else result.error("USB_PERMISSION_REQUIRED", "USB permission required or device not ready", null)
          return
        }
        val ok = usb.transmitRaw(frequency, pattern)
        if (ok) result.success(null) else result.error("USB_TX_FAIL", "USB transmit failed (bulkTransfer returned <= 0)", null)
      }

      TxType.INTERNAL -> {
        val internalOk = internalTx?.transmitRaw(frequency, pattern) == true
        if (internalOk) { result.success(null); return }
        result.error("NO_IR", "Internal IR transmit failed or IR emitter not available", null)
      }

      TxType.AUDIO_1_LED -> {
        val ok = audio1Tx.transmitRaw(frequency, pattern)
        if (ok) result.success(null) else result.error("AUDIO_TX_FAIL", "Audio transmit failed", null)
      }

      TxType.AUDIO_2_LED -> {
        val ok = audio2Tx.transmitRaw(frequency, pattern)
        if (ok) result.success(null) else result.error("AUDIO_TX_FAIL", "Audio transmit failed", null)
      }
    }
  }

  private fun handleTransmitRaw(call: MethodCall, result: MethodChannel.Result) {
    val pattern = call.readIntArrayArg("list")
    val freq = call.readIntArg("frequency") ?: DEFAULT_HEX_FREQUENCY

    if (pattern == null || pattern.isEmpty()) {
      result.error("NO_PATTERN", "No pattern provided", null)
      return
    }
    if (!validatePattern(pattern)) {
      result.error("BAD_PATTERN", "All durations must be > 0 µs", null)
      return
    }

    val safeFreq = freq.coerceIn(MIN_IR_HZ, MAX_IR_HZ)

    when (currentTxType) {
      TxType.USB -> {
        val usb = getOrOpenUsbTransmitterOrRequest()
        if (usb == null) {
          val dev = usbDiscovery?.scanSupported()?.firstOrNull()
          if (dev == null) result.error("NO_USB_DEVICE", "No supported USB IR device is attached", null)
          else result.error("USB_PERMISSION_REQUIRED", "USB permission required or device not ready", null)
          return
        }
        val ok = usb.transmitRaw(safeFreq, pattern)
        if (ok) result.success(null) else result.error("USB_TX_FAIL", "USB transmit failed (bulkTransfer returned <= 0)", null)
      }

      TxType.INTERNAL -> {
        val ok = internalTx?.transmitRaw(safeFreq, pattern) == true
        if (ok) { result.success(null); return }
        result.error("NO_IR", "Internal IR transmit failed or IR emitter not available", null)
      }

      TxType.AUDIO_1_LED -> {
        val ok = audio1Tx.transmitRaw(safeFreq, pattern)
        if (ok) result.success(null) else result.error("AUDIO_TX_FAIL", "Audio transmit failed", null)
      }

      TxType.AUDIO_2_LED -> {
        val ok = audio2Tx.transmitRaw(safeFreq, pattern)
        if (ok) result.success(null) else result.error("AUDIO_TX_FAIL", "Audio transmit failed", null)
      }
    }
  }

  private fun handleGetSupportedFrequencies(result: MethodChannel.Result) {
    val mgr = irManager
    if (mgr == null) { result.success(emptyList<List<Int>>()); return }
    result.success(readCarrierFrequencyPairs(mgr))
  }

  private fun handleGetTxCaps(result: MethodChannel.Result) {
    result.success(buildTxCapsMap())
  }

  private fun handleUsbScanAndRequest(result: MethodChannel.Result) {
    val disc = usbDiscovery
    if (disc == null) {
      result.error("NO_USB", "UsbManager not available", null)
      return
    }
    val devices = disc.scanSupported()
    if (devices.isEmpty()) {
      result.success(false)
      return
    }
    disc.requestPermission(devices.first())
    emitTxStatus("usb_scan_request")
    emitTxStatusDelayed("usb_scan_request_delayed", 350L)
    result.success(true)
  }

  private fun handleSetTxType(call: MethodCall, result: MethodChannel.Result) {
    val t = call.argument<String>("type")?.uppercase()
    when (t) {
      "INTERNAL" -> {
        autoSwitchEnabled = false
        saveAutoSwitchToPrefs(false)

        currentTxType = TxType.INTERNAL
        saveTxTypeToPrefs(currentTxType)

        emitTxStatus("set_tx_internal")
        emitTxStatusDelayed("set_tx_internal_delayed", 250L)

        result.success(currentTxType.name)
      }

      "USB" -> {
        autoSwitchEnabled = false
        saveAutoSwitchToPrefs(false)

        currentTxType = TxType.USB
        saveTxTypeToPrefs(currentTxType)

        val usb = getOrOpenUsbTransmitterOrRequest()

        emitTxStatus("set_tx_usb")
        emitTxStatusDelayed("set_tx_usb_delayed", 350L)

        if (usb == null) {
          val dev = usbDiscovery?.scanSupported()?.firstOrNull()
          if (dev == null) result.error("NO_USB_DEVICE", "No supported USB IR device is attached", null)
          else result.success(currentTxType.name)
        } else {
          result.success(currentTxType.name)
        }
      }

      "AUDIO_1_LED" -> {
        autoSwitchEnabled = false
        saveAutoSwitchToPrefs(false)

        currentTxType = TxType.AUDIO_1_LED
        saveTxTypeToPrefs(currentTxType)

        emitTxStatus("set_tx_audio1")
        emitTxStatusDelayed("set_tx_audio1_delayed", 250L)

        result.success(currentTxType.name)
      }

      "AUDIO_2_LED" -> {
        autoSwitchEnabled = false
        saveAutoSwitchToPrefs(false)

        currentTxType = TxType.AUDIO_2_LED
        saveTxTypeToPrefs(currentTxType)

        emitTxStatus("set_tx_audio2")
        emitTxStatusDelayed("set_tx_audio2_delayed", 250L)

        result.success(currentTxType.name)
      }

      else -> result.error("BAD_TYPE", "Unknown transmitter type: $t", null)
    }
  }

  private fun handleSetPreferredUiTxType(call: MethodCall, result: MethodChannel.Result) {
    val t = call.argument<String>("type")?.uppercase()
    if (t.isNullOrBlank() || !isValidPreferredUiTxType(t)) {
      result.error("BAD_TYPE", "Unknown preferred transmitter type: $t", null)
      return
    }
    savePreferredUiTxTypeToPrefs(t)
    emitTxStatus("set_preferred_ui")
    emitTxStatusDelayed("set_preferred_ui_delayed", 200L)
    result.success(t)
  }

  private fun handleSetAutoSwitchEnabled(call: MethodCall, result: MethodChannel.Result) {
    val enabled = call.argument<Boolean>("enabled") ?: false
    autoSwitchEnabled = if (internalAvailable() && currentTxType != TxType.AUDIO_1_LED && currentTxType != TxType.AUDIO_2_LED) enabled else false
    saveAutoSwitchToPrefs(autoSwitchEnabled)

    applyAutoSwitchIfEnabled("set_auto_switch")

    emitTxStatus("set_auto_switch")
    emitTxStatusDelayed("set_auto_switch_delayed", 350L)

    result.success(autoSwitchEnabled)
  }

  private fun handleSetOpenOnUsbAttachEnabled(call: MethodCall, result: MethodChannel.Result) {
    val enabled = call.argument<Boolean>("enabled") ?: false
    openOnUsbAttachEnabled = enabled
    saveOpenOnUsbAttachToPrefs(openOnUsbAttachEnabled)
    setUsbAttachAliasEnabled(openOnUsbAttachEnabled)
    result.success(openOnUsbAttachEnabled)
  }

  private fun handleUsbDescribe(result: MethodChannel.Result) {
    val disc = usbDiscovery
    val mgr = usbManager
    if (disc == null || mgr == null) { result.success(null); return }
    val dev = disc.scanSupported().firstOrNull()
    if (dev == null) { result.success(null); return }
    val info = UsbIntrospection.describeDevice(dev, mgr.hasPermission(dev))
    result.success(info)
  }

  private fun readCarrierFrequencyPairs(mgr: ConsumerIrManager): List<List<Int>> {
    try {
      val ranges: Array<ConsumerIrManager.CarrierFrequencyRange>? = mgr.carrierFrequencies
      if (ranges != null && ranges.isNotEmpty()) {
        return ranges.map { listOf(it.minFrequency, it.maxFrequency) }
      }
    } catch (_: Throwable) {}

    return try {
      val method = mgr.javaClass.getMethod("getCarrierFrequencies")
      val value = method.invoke(mgr)
      when (value) {
        is Array<*> -> {
          val out = ArrayList<List<Int>>(value.size)
          for (item in value) {
            when (item) {
              is ConsumerIrManager.CarrierFrequencyRange -> out.add(listOf(item.minFrequency, item.maxFrequency))
              else -> {
                val min = item?.javaClass?.methods
                  ?.firstOrNull { it.name == "getMinFrequency" && it.parameterTypes.isEmpty() }
                  ?.invoke(item) as? Number
                val max = item?.javaClass?.methods
                  ?.firstOrNull { it.name == "getMaxFrequency" && it.parameterTypes.isEmpty() }
                  ?.invoke(item) as? Number
                if (min != null && max != null) out.add(listOf(min.toInt(), max.toInt()))
              }
            }
          }
          out
        }
        else -> emptyList()
      }
    } catch (_: Throwable) {
      emptyList()
    }
  }

  private fun validatePattern(pattern: IntArray): Boolean {
    if (pattern.isEmpty()) return false
    for (v in pattern) if (v <= 0) return false
    return true
  }

  private fun getUsbDeviceExtra(intent: Intent): UsbDevice? {
    return if (android.os.Build.VERSION.SDK_INT >= 33) {
      intent.getParcelableExtra(UsbManager.EXTRA_DEVICE, UsbDevice::class.java)
    } else {
      @Suppress("DEPRECATION")
      intent.getParcelableExtra(UsbManager.EXTRA_DEVICE)
    }
  }

  private fun MethodCall.readIntArg(key: String): Int? {
    val n: Any? = this.argument<Any?>(key)
    return (n as? Number)?.toInt()
  }

  private fun MethodCall.readIntArrayArg(key: String): IntArray? {
    val raw: Any? = this.argument<Any?>(key)
    return when (raw) {
      is IntArray -> raw
      is List<*> -> {
        val out = IntArray(raw.size)
        for (i in raw.indices) {
          val n = raw[i] as? Number ?: return null
          out[i] = n.toInt()
        }
        out
      }
      else -> null
    }
  }

  private fun UsbIrTransmitter.closeSafely() {
    try { close() } catch (_: Throwable) {}
  }
}
