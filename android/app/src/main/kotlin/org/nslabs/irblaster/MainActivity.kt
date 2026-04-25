package org.nslabs.ir_blaster

import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.content.pm.ShortcutInfo
import android.content.pm.ShortcutManager
import android.graphics.drawable.Icon
import android.hardware.ConsumerIrManager
import android.hardware.usb.UsbDevice
import android.hardware.usb.UsbManager
import android.media.AudioAttributes
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.VibrationEffect
import android.os.VibrationAttributes
import android.os.Vibrator
import android.os.VibratorManager
import android.provider.Settings
import android.util.Base64
import android.util.Log
import android.view.HapticFeedbackConstants
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.nslabs.ir_blaster.audio.AudioCapturedIrPlayer
import org.nslabs.ir_blaster.audio.AudioIrTransmitter
import org.nslabs.ir_blaster.audio.AudioIrLearner
import org.nslabs.ir_blaster.huawei.HuaweiIrLearner
import org.nslabs.ir_blaster.lg.LgIrLearner
import org.nslabs.ir_blaster.BaseQuickTileService

class MainActivity : FlutterActivity() {
    private enum class TxType { INTERNAL, USB, AUDIO_1_LED, AUDIO_2_LED }
    private enum class UsbAvailabilityState { NO_DEVICE, PERMISSION_REQUIRED, PERMISSION_DENIED, PERMISSION_GRANTED, OPEN_FAILED, READY }
    private data class UsbAcquireResult(val transmitter: UsbIrTransmitter?, val state: UsbAvailabilityState)

    private val TAG = "IRBlaster"

    private var currentTxType: TxType = TxType.INTERNAL
    private var autoSwitchEnabled: Boolean = false
    private var openOnUsbAttachEnabled: Boolean = false

    private var irManager: ConsumerIrManager? = null
    private var internalTx: InternalIrTransmitter? = null

    private var usbManager: UsbManager? = null
    private var usbDiscovery: UsbDiscoveryManager? = null
    private var usbTransmitter: UsbIrTransmitter? = null
    @Volatile private var usbLearner: UsbLearnerSession? = null
    @Volatile private var usbLearningCancelRequested: Boolean = false
    private var usbState: UsbAvailabilityState = UsbAvailabilityState.NO_DEVICE
    private var usbStateMessage: String? = null

    private val audio1Tx by lazy { AudioIrTransmitter(applicationContext, mode = 1) }
    private val audio2Tx by lazy { AudioIrTransmitter(applicationContext, mode = 2) }
    @Volatile private var audioLearner: AudioIrLearner? = null
    @Volatile private var audioLearningCancelRequested: Boolean = false
    private var pendingAudioPermissionResult: MethodChannel.Result? = null

    @Volatile private var huaweiLearner: HuaweiIrLearner? = null
    @Volatile private var huaweiLearningCancelRequested: Boolean = false

    @Volatile private var lgLearner: LgIrLearner? = null
    @Volatile private var lgLearningCancelRequested: Boolean = false

    private val prefs by lazy {
        applicationContext.getSharedPreferences("ir_blaster_prefs", Context.MODE_PRIVATE)
    }

    private val mainHandler = Handler(Looper.getMainLooper())

    private var txEventSink: EventChannel.EventSink? = null
    private var lastEmittedSnapshot: String? = null
    private var controlChannel: MethodChannel? = null
    private var pendingControlButtonId: String? = null
    private var quickTileChannel: MethodChannel? = null
    private var pendingQuickTileChooserKey: String? = null
    private var shortcutsChannel: MethodChannel? = null
    private var pendingShortcutAction: String? = null

    private fun loadTxTypeFromPrefs(): TxType {
        val v = prefs.getString("tx_type", TxType.INTERNAL.name) ?: TxType.INTERNAL.name
        return try {
            TxType.valueOf(v)
        } catch (_: Throwable) {
            TxType.INTERNAL
        }
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
        return try {
            prefs.getBoolean("auto_switch", defaultValue)
        } catch (_: Throwable) {
            defaultValue
        }
    }

    private fun saveAutoSwitchToPrefs(v: Boolean) {
        prefs.edit().putBoolean("auto_switch", v).apply()
    }

    private fun loadOpenOnUsbAttachFromPrefs(defaultValue: Boolean): Boolean {
        return try {
            prefs.getBoolean("open_on_usb_attach", defaultValue)
        } catch (_: Throwable) {
            defaultValue
        }
    }

    private fun saveOpenOnUsbAttachToPrefs(v: Boolean) {
        prefs.edit().putBoolean("open_on_usb_attach", v).apply()
    }

    private fun setUsbAttachAliasEnabled(enabled: Boolean) {
        val pm = applicationContext.packageManager
        val cn = ComponentName(applicationContext, "org.nslabs.ir_blaster.UsbAttachAlias")
        val state = if (enabled) {
            PackageManager.COMPONENT_ENABLED_STATE_ENABLED
        } else {
            PackageManager.COMPONENT_ENABLED_STATE_DISABLED
        }

        try {
            pm.setComponentEnabledSetting(cn, state, PackageManager.DONT_KILL_APP)
            Log.i(TAG, "UsbAttachAlias set to ${if (enabled) "ENABLED" else "DISABLED"}")
        } catch (t: Throwable) {
            Log.w(TAG, "Failed to toggle UsbAttachAlias: ${t.message}")
        }
    }

    private fun internalAvailable(): Boolean = (irManager?.hasIrEmitter() == true)

    private fun openUsbIfPermitted(): UsbIrTransmitter? {
        return acquireUsbTransmitter(requestPermissionIfNeeded = false).transmitter
    }

    private fun ensureUsbOpenedIfPermitted(): Boolean {
        return acquireUsbTransmitter(requestPermissionIfNeeded = false).transmitter != null
    }

    private fun setUsbState(state: UsbAvailabilityState, detail: String? = null) {
        usbState = state
        usbStateMessage = detail
    }

    private fun usbStateWireValue(state: UsbAvailabilityState): String {
        return when (state) {
            UsbAvailabilityState.NO_DEVICE -> "NO_DEVICE"
            UsbAvailabilityState.PERMISSION_REQUIRED -> "PERMISSION_REQUIRED"
            UsbAvailabilityState.PERMISSION_DENIED -> "PERMISSION_DENIED"
            UsbAvailabilityState.PERMISSION_GRANTED -> "PERMISSION_GRANTED"
            UsbAvailabilityState.OPEN_FAILED -> "OPEN_FAILED"
            UsbAvailabilityState.READY -> "READY"
        }
    }

    private fun refreshUsbStateSnapshot() {
        val disc = usbDiscovery
        val mgr = usbManager
        val dev = try {
            disc?.scanSupported()?.firstOrNull()
        } catch (_: Throwable) {
            null
        }

        when {
            dev == null -> setUsbState(UsbAvailabilityState.NO_DEVICE, "No supported USB IR dongle is attached.")
            usbTransmitter != null -> setUsbState(UsbAvailabilityState.READY, "USB dongle is connected and initialized.")
            mgr == null -> setUsbState(UsbAvailabilityState.NO_DEVICE, "UsbManager is not available.")
            !mgr.hasPermission(dev) -> {
                if (usbState != UsbAvailabilityState.PERMISSION_DENIED) {
                    setUsbState(UsbAvailabilityState.PERMISSION_REQUIRED, "USB permission is required for the attached dongle.")
                }
            }
            usbState != UsbAvailabilityState.OPEN_FAILED -> {
                setUsbState(UsbAvailabilityState.PERMISSION_GRANTED, "USB permission is granted, but the dongle is not initialized yet.")
            }
        }
    }

    private fun acquireUsbTransmitter(requestPermissionIfNeeded: Boolean): UsbAcquireResult {
        if (usbLearner != null) {
            setUsbState(UsbAvailabilityState.OPEN_FAILED, "USB dongle is busy in learning mode.")
            return UsbAcquireResult(null, UsbAvailabilityState.OPEN_FAILED)
        }

        usbTransmitter?.let {
            setUsbState(UsbAvailabilityState.READY, "USB dongle is connected and initialized.")
            return UsbAcquireResult(it, UsbAvailabilityState.READY)
        }

        val disc = usbDiscovery
        val mgr = usbManager
        if (disc == null || mgr == null) {
            setUsbState(UsbAvailabilityState.NO_DEVICE, "UsbManager is not available.")
            return UsbAcquireResult(null, UsbAvailabilityState.NO_DEVICE)
        }

        val dev = try {
            disc.scanSupported().firstOrNull()
        } catch (_: Throwable) {
            null
        }
        if (dev == null) {
            setUsbState(UsbAvailabilityState.NO_DEVICE, "No supported USB IR dongle is attached.")
            return UsbAcquireResult(null, UsbAvailabilityState.NO_DEVICE)
        }

        if (!mgr.hasPermission(dev)) {
            setUsbState(UsbAvailabilityState.PERMISSION_REQUIRED, "USB permission is required for the attached dongle.")
            if (requestPermissionIfNeeded) {
                disc.requestPermission(dev)
            }
            return UsbAcquireResult(null, UsbAvailabilityState.PERMISSION_REQUIRED)
        }

        val opened = openUsbDevice(dev)
        if (opened != null) {
            usbTransmitter = opened
            setUsbState(UsbAvailabilityState.READY, "USB dongle is connected and initialized.")
            return UsbAcquireResult(opened, UsbAvailabilityState.READY)
        }

        setUsbState(
            UsbAvailabilityState.OPEN_FAILED,
            "USB permission is granted, but the dongle could not be initialized."
        )
        return UsbAcquireResult(null, UsbAvailabilityState.OPEN_FAILED)
    }

    private fun applyAutoSwitchIfEnabled(reason: String) {
        if (!autoSwitchEnabled) return
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
        refreshUsbStateSnapshot()
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
            "usbStatus" to usbStateWireValue(usbState),
            "usbStatusMessage" to usbStateMessage,
            "hasAudio" to true,
            "hasHuaweiIrLearning" to HuaweiIrLearner.isSupported(applicationContext),
            "hasLgeIrLearning"    to LgIrLearner.isSupported(applicationContext),
            "currentType" to currentTxType.name,
            "usbDevices" to usbDevs,
            "autoSwitchEnabled" to autoSwitchEnabled
        )
    }

    private fun emitTxStatus(reason: String) {
        val sink = txEventSink ?: return
        val payload = buildTxCapsMap()
        val snapshot = try {
            payload.toString()
        } catch (_: Throwable) {
            null
        }
        if (snapshot != null && snapshot == lastEmittedSnapshot) return
        lastEmittedSnapshot = snapshot
        runOnUiThread {
            try {
                sink.success(payload)
            } catch (t: Throwable) {
                Log.w(TAG, "emitTxStatus failed ($reason): ${t.message}")
            }
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
                    Log.i(
                        TAG,
                        "USB attached vid=0x${dev.vendorId.toString(16)} pid=0x${dev.productId.toString(16)} name=${dev.productName}"
                    )
                    if (UsbDeviceFilter.isSupported(dev)) {
                        val mgr = usbManager
                        val disc = usbDiscovery
                        if (mgr != null && disc != null) {
                            if (!mgr.hasPermission(dev)) {
                                setUsbState(UsbAvailabilityState.PERMISSION_REQUIRED, "USB permission is required for the attached dongle.")
                                Log.i(TAG, "Requesting USB permission on attach...")
                                disc.requestPermission(dev)
                            } else {
                                val opened = openUsbDevice(dev)
                                if (opened != null) {
                                    usbTransmitter = opened
                                    setUsbState(UsbAvailabilityState.READY, "USB dongle is connected and initialized.")
                                } else {
                                    setUsbState(
                                        UsbAvailabilityState.OPEN_FAILED,
                                        "USB permission is granted, but the dongle could not be initialized."
                                    )
                                }
                                applyAutoSwitchIfEnabled("usb_attached_permitted")
                            }
                        }
                    }
                    emitTxStatus("usb_attached")
                    emitTxStatusDelayed("usb_attached_delayed", 350L)
                }

                UsbManager.ACTION_USB_DEVICE_DETACHED -> {
                    val dev = getUsbDeviceExtra(i) ?: return
                    Log.i(
                        TAG,
                        "USB detached vid=0x${dev.vendorId.toString(16)} pid=0x${dev.productId.toString(16)}"
                    )
                    if (UsbDeviceFilter.hasKnownVidPid(dev)) {
                        usbTransmitter?.closeSafely()
                        usbTransmitter = null
                    }
                    refreshUsbStateSnapshot()
                    applyAutoSwitchIfEnabled("usb_detached")
                    emitTxStatus("usb_detached")
                    emitTxStatusDelayed("usb_detached_delayed", 450L)
                }

                UsbDiscoveryManager.ACTION_USB_PERMISSION -> {
                    val dev = getUsbDeviceExtra(i)
                    val granted = i.getBooleanExtra(UsbManager.EXTRA_PERMISSION_GRANTED, false)
                    Log.i(
                        TAG,
                        "USB permission result granted=$granted dev=${dev?.productName} vid=0x${dev?.vendorId?.toString(16)} pid=0x${dev?.productId?.toString(16)}"
                    )
                    if (!granted || dev == null || !UsbDeviceFilter.isSupported(dev)) {
                        usbTransmitter?.closeSafely()
                        usbTransmitter = null
                        setUsbState(UsbAvailabilityState.PERMISSION_DENIED, "USB permission was denied for the attached dongle.")
                        applyAutoSwitchIfEnabled("usb_permission_denied")
                        emitTxStatus("usb_permission_denied")
                        emitTxStatusDelayed("usb_permission_denied_delayed", 350L)
                        return
                    }
                    val opened = openUsbDevice(dev)
                    if (opened != null) {
                        usbTransmitter = opened
                        setUsbState(UsbAvailabilityState.READY, "USB dongle is connected and initialized.")
                        applyAutoSwitchIfEnabled("usb_permission_granted")
                    } else {
                        Log.w(TAG, "openTransmitter() returned null (could not claim interface / endpoints)")
                        setUsbState(
                            UsbAvailabilityState.OPEN_FAILED,
                            "USB permission is granted, but the dongle could not be initialized."
                        )
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
        private const val CONTROL_CHANNEL = "org.nslabs/irtransmitter_controls"
        private const val QUICK_TILE_CHANNEL = "org.nslabs/irtransmitter_quick_tile"
        private const val SHORTCUTS_CHANNEL = "org.nslabs/app_shortcuts"
        private const val EXTRA_SHORTCUT_ACTION = "org.nslabs.irblaster.SHORTCUT_ACTION"
        private const val DEFAULT_HEX_FREQUENCY = 38000
        private const val MIN_IR_HZ = 15000
        private const val MAX_IR_HZ = 60000
        private const val RECORD_AUDIO_PERMISSION_REQUEST = 1007
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
                    "transmitRawCycles" -> handleTransmitRawCycles(call, result)
                    "performHaptic" -> handlePerformHaptic(call, result)
                    "getHapticDiagnostics" -> result.success(buildHapticDiagnostics())
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
                    "shareText" -> handleShareText(call, result)
                    "learnUsbSignal" -> handleLearnUsbSignal(call, result)
                    "cancelUsbLearning" -> handleCancelUsbLearning(result)
                    "replayLearnedUsbSignal" -> handleReplayLearnedUsbSignal(call, result)
                    "getAudioLearningDiagnostics" -> result.success(buildAudioLearningDiagnostics())
                    "requestAudioLearningPermission" -> handleRequestAudioLearningPermission(result)
                    "learnHuaweiSignal" -> handleLearnHuaweiSignal(call, result)
                    "cancelHuaweiLearning" -> handleCancelHuaweiLearning(result)
                    "learnLgSignal" -> handleLearnLgSignal(call, result)
                    "cancelLgLearning" -> handleCancelLgLearning(result)
                    else -> result.notImplemented()
                }
            }

        controlChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CONTROL_CHANNEL)
        pendingControlButtonId?.let { id ->
            pendingControlButtonId = null
            dispatchControlButton(id)
        }

        quickTileChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, QUICK_TILE_CHANNEL)
        pendingQuickTileChooserKey?.let { key ->
            pendingQuickTileChooserKey = null
            dispatchQuickTileChooser(key)
        }

        shortcutsChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SHORTCUTS_CHANNEL)
        shortcutsChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "updateDynamicShortcuts" -> handleUpdateDynamicShortcuts(call, result)
                "consumeInitialShortcutAction" -> {
                    val action = pendingShortcutAction
                    pendingShortcutAction = null
                    result.success(action)
                }
                else -> result.notImplemented()
            }
        }

        emitTxStatus("startup_done")
        emitTxStatusDelayed("startup_done_delayed", 350L)
    }

    private fun handleUpdateDynamicShortcuts(call: MethodCall, result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT < 25) {
            result.success(false)
            return
        }

        val shortcutManager = getSystemService(ShortcutManager::class.java)
        if (shortcutManager == null) {
            result.success(false)
            return
        }

        val args = call.arguments as? Map<*, *>
        val rawItems = args?.get("items") as? List<*>
        val maxShortcuts = shortcutManager.maxShortcutCountPerActivity.coerceAtLeast(1)
        val shortcuts = rawItems
            ?.mapIndexedNotNull { index, raw -> buildDynamicShortcut(raw as? Map<*, *>, index) }
            ?.take(maxShortcuts)
            ?: emptyList()

        shortcutManager.dynamicShortcuts = shortcuts
        result.success(true)
    }

    private fun handleShareText(call: MethodCall, result: MethodChannel.Result) {
        val text = call.argument<String>("text")?.trim().orEmpty()
        val subject = call.argument<String>("subject")?.trim().orEmpty()
        if (text.isEmpty()) {
            result.error("INVALID_ARGUMENT", "Missing share text.", null)
            return
        }

        runOnUiThread {
            try {
                val chooserTitle: String? = if (subject.isNotEmpty()) subject else null
                val intent = Intent(Intent.ACTION_SEND).apply {
                    type = "text/plain"
                    putExtra(Intent.EXTRA_TEXT, text)
                    if (subject.isNotEmpty()) {
                        putExtra(Intent.EXTRA_SUBJECT, subject)
                    }
                }
                startActivity(Intent.createChooser(intent, chooserTitle))
                result.success(true)
            } catch (t: Throwable) {
                result.error("SHARE_FAILED", t.message, null)
            }
        }
    }

    private fun buildDynamicShortcut(raw: Map<*, *>?, rank: Int): ShortcutInfo? {
        if (raw == null || Build.VERSION.SDK_INT < 25) return null
        val id = (raw["id"] as? String)?.trim().orEmpty()
        val shortLabel = (raw["shortLabel"] as? String)?.trim().orEmpty()
        val longLabel = (raw["longLabel"] as? String)?.trim().orEmpty()
        if (id.isEmpty() || shortLabel.isEmpty()) return null

        val intent = Intent(applicationContext, MainActivity::class.java).apply {
            action = Intent.ACTION_VIEW
            putExtra(EXTRA_SHORTCUT_ACTION, id)
            flags = Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }

        return ShortcutInfo.Builder(applicationContext, id)
            .setShortLabel(shortLabel)
            .setLongLabel(if (longLabel.isNotEmpty()) longLabel else shortLabel)
            .setIcon(Icon.createWithResource(applicationContext, R.mipmap.ic_launcher))
            .setIntent(intent)
            .setRank(rank)
            .build()
    }

    private fun handlePerformHaptic(call: MethodCall, result: MethodChannel.Result) {
        val type = call.argument<String>("type") ?: "selection"
        val intensity = (call.argument<Int>("intensity") ?: 2).coerceIn(1, 3)
        val forceVibrationOverride = call.argument<Boolean>("forceVibrationOverride") ?: false
        Log.i(TAG, "performHaptic request type=$type intensity=$intensity force=$forceVibrationOverride")
        runOnUiThread {
            try {
                result.success(performNativeHaptic(type, intensity, forceVibrationOverride))
            } catch (t: Throwable) {
                Log.w(TAG, "performNativeHaptic failed: ${t.message}")
                result.error("HAPTIC_FAILED", t.message, null)
            }
        }
    }

    private fun performNativeHaptic(type: String, intensity: Int, forceVibrationOverride: Boolean): Boolean {
        val diagnostics = buildHapticDiagnostics()
        val hasVibrator = diagnostics["hasVibrator"] == true
        val systemTouchFeedbackEnabled = diagnostics["systemTouchFeedbackEnabled"] == true
        val masterVibrationEnabled = diagnostics["masterVibrationEnabled"] == true
        val forceOverrideLikelyBlocked = diagnostics["forceOverrideLikelyBlocked"] == true

        if (!hasVibrator) {
            Log.w(TAG, "performNativeHaptic: no vibrator available")
            return false
        }
        if (forceVibrationOverride) {
            if (forceOverrideLikelyBlocked) {
                Log.w(TAG, "performNativeHaptic: force override blocked by system settings")
                return false
            }
            Log.i(TAG, "performNativeHaptic: forcing direct vibration path")
            return performVibratorFallback(type, intensity)
        }
        if (!systemTouchFeedbackEnabled || !masterVibrationEnabled) {
            Log.w(
                TAG,
                "performNativeHaptic: system settings suppress touch feedback (touch=$systemTouchFeedbackEnabled, master=$masterVibrationEnabled)"
            )
            return false
        }

        val decorView = window?.decorView
        val constant = when (type) {
            "selection" -> {
                if (Build.VERSION.SDK_INT >= 34) {
                    HapticFeedbackConstants.SEGMENT_TICK
                } else {
                    HapticFeedbackConstants.CLOCK_TICK
                }
            }
            "light" -> HapticFeedbackConstants.VIRTUAL_KEY
            "medium" -> HapticFeedbackConstants.KEYBOARD_TAP
            "heavy" -> {
                if (Build.VERSION.SDK_INT >= 23) {
                    HapticFeedbackConstants.CONTEXT_CLICK
                } else {
                    HapticFeedbackConstants.LONG_PRESS
                }
            }
            else -> HapticFeedbackConstants.CLOCK_TICK
        }

        val viewOk = try {
            if (decorView != null) {
                decorView.isHapticFeedbackEnabled = true
                decorView.performHapticFeedback(constant)
            } else {
                false
            }
        } catch (_: Throwable) {
            false
        }
        Log.i(TAG, "performNativeHaptic: view feedback constant=$constant success=$viewOk")
        return viewOk
    }

    private fun performVibratorFallback(type: String, intensity: Int): Boolean {
        val vibrator = getAppVibrator() ?: return false
        if (!vibrator.hasVibrator()) {
            Log.w(TAG, "performVibratorFallback: device reports no vibrator")
            return false
        }
        return try {
            val (duration, rawAmplitude) = fallbackOneShotFor(type, intensity)
            val amplitude = if (Build.VERSION.SDK_INT >= 26 && vibrator.hasAmplitudeControl()) {
                rawAmplitude
            } else {
                VibrationEffect.DEFAULT_AMPLITUDE
            }
            val effect = VibrationEffect.createOneShot(duration, amplitude)
            when {
                Build.VERSION.SDK_INT >= 33 -> {
                    vibrator.vibrate(
                        effect,
                        VibrationAttributes.createForUsage(VibrationAttributes.USAGE_COMMUNICATION_REQUEST)
                    )
                }
                Build.VERSION.SDK_INT >= 26 -> {
                    @Suppress("DEPRECATION")
                    vibrator.vibrate(
                        effect,
                        AudioAttributes.Builder()
                            .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                            .setUsage(AudioAttributes.USAGE_NOTIFICATION_COMMUNICATION_REQUEST)
                            .build()
                    )
                }
                else -> {
                    @Suppress("DEPRECATION")
                    vibrator.vibrate(duration)
                }
            }
            Log.i(
                TAG,
                "performVibratorFallback: success type=$type intensity=$intensity duration=${duration}ms amplitude=$amplitude hasAmplitude=${if (Build.VERSION.SDK_INT >= 26) vibrator.hasAmplitudeControl() else false}"
            )
            true
        } catch (t: Throwable) {
            Log.w(TAG, "performVibratorFallback failed: ${t.message}")
            false
        }
    }

    private fun buildHapticDiagnostics(): Map<String, Any?> {
        val vibrator = getAppVibrator()
        val hasVibrator = try {
            vibrator?.hasVibrator() == true
        } catch (_: Throwable) {
            false
        }
        val systemTouchFeedbackEnabled = try {
            Settings.System.getInt(contentResolver, Settings.System.HAPTIC_FEEDBACK_ENABLED, 1) == 1
        } catch (_: Throwable) {
            true
        }
        val masterVibrationEnabled = try {
            Settings.System.getInt(contentResolver, "vibrate_on", 1) == 1
        } catch (_: Throwable) {
            true
        }
        val reasonCode = when {
            !hasVibrator -> "no_vibrator"
            !masterVibrationEnabled -> "master_vibration_disabled"
            !systemTouchFeedbackEnabled -> "touch_feedback_disabled"
            else -> null
        }
        return mapOf(
            "hasVibrator" to hasVibrator,
            "systemTouchFeedbackEnabled" to systemTouchFeedbackEnabled,
            "masterVibrationEnabled" to masterVibrationEnabled,
            "forceOverrideLikelyBlocked" to (!hasVibrator || !masterVibrationEnabled),
            "reasonCode" to reasonCode,
        )
    }

    private fun getAppVibrator(): Vibrator? {
        return if (Build.VERSION.SDK_INT >= 31) {
            val mgr = getSystemService(Context.VIBRATOR_MANAGER_SERVICE) as? VibratorManager
            mgr?.defaultVibrator
                ?: run {
                    @Suppress("DEPRECATION")
                    getSystemService(Context.VIBRATOR_SERVICE) as? Vibrator
                }
        } else {
            @Suppress("DEPRECATION")
            getSystemService(Context.VIBRATOR_SERVICE) as? Vibrator
        }
    }

    private fun fallbackOneShotFor(type: String, intensity: Int): Pair<Long, Int> {
        return when (type) {
            "selection" -> when (intensity.coerceIn(1, 3)) {
                1 -> 16L to 90
                2 -> 22L to 160
                else -> 30L to 220
            }
            "light" -> when (intensity.coerceIn(1, 3)) {
                1 -> 18L to 100
                2 -> 24L to 170
                else -> 32L to 230
            }
            "medium" -> when (intensity.coerceIn(1, 3)) {
                1 -> 22L to 120
                2 -> 30L to 190
                else -> 40L to 255
            }
            "heavy" -> when (intensity.coerceIn(1, 3)) {
                1 -> 28L to 150
                2 -> 38L to 220
                else -> 52L to 255
            }
            else -> when (intensity.coerceIn(1, 3)) {
                1 -> 18L to 100
                2 -> 24L to 170
                else -> 32L to 230
            }
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handleControlIntent(intent)
        handleQuickTileIntent(intent)
        handleRuntimeShortcutIntent(intent)
    }

    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        handleControlIntent(intent)
        handleQuickTileIntent(intent)
        captureInitialShortcutIntent(intent)
    }

    private fun handleControlIntent(intent: Intent?) {
        val id = intent?.getStringExtra(DeviceControlsService.EXTRA_CONTROL_BUTTON_ID) ?: return
        dispatchControlButton(id)
    }

    private fun dispatchControlButton(buttonId: String) {
        val ch = controlChannel
        if (ch == null) {
            pendingControlButtonId = buttonId
            return
        }
        ch.invokeMethod("sendButton", mapOf("buttonId" to buttonId))
    }

    private fun handleQuickTileIntent(intent: Intent?) {
        val key = intent?.getStringExtra(BaseQuickTileService.EXTRA_TILE_KEY) ?: return
        if (key.isBlank()) return
        dispatchQuickTileChooser(key)
    }

    private fun dispatchQuickTileChooser(tileKey: String) {
        val ch = quickTileChannel
        if (ch == null) {
            pendingQuickTileChooserKey = tileKey
            return
        }
        ch.invokeMethod("openChooser", mapOf("tileKey" to tileKey))
    }

    private fun captureInitialShortcutIntent(intent: Intent?) {
        val action = intent?.getStringExtra(EXTRA_SHORTCUT_ACTION)?.trim().orEmpty()
        if (action.isEmpty()) return
        pendingShortcutAction = action
    }

    private fun handleRuntimeShortcutIntent(intent: Intent?) {
        val action = intent?.getStringExtra(EXTRA_SHORTCUT_ACTION)?.trim().orEmpty()
        if (action.isEmpty()) return
        dispatchShortcutAction(action)
    }

    private fun dispatchShortcutAction(action: String) {
        val ch = shortcutsChannel
        if (ch == null) {
            pendingShortcutAction = action
            return
        }
        ch.invokeMethod("openShortcut", mapOf("action" to action))
    }

    override fun onDestroy() {
        try {
            applicationContext.unregisterReceiver(usbReceiver)
        } catch (_: Throwable) {
        }
        try {
            mainHandler.removeCallbacksAndMessages(null)
        } catch (_: Throwable) {
        }
        txEventSink = null
        usbLearner?.closeSafely()
        usbLearner = null
        audioLearner?.cancel()
        audioLearner = null
        huaweiLearner?.cancel()
        huaweiLearner = null
        lgLearner?.cancel()
        lgLearner = null
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
            setUsbState(UsbAvailabilityState.PERMISSION_REQUIRED, "USB permission is required for the attached dongle.")
            Log.i(TAG, "Supported USB dongle already attached; requesting permission now...")
            disc.requestPermission(dev)
        } else {
            setUsbState(UsbAvailabilityState.PERMISSION_GRANTED, "USB permission is granted for the attached dongle.")
            Log.i(TAG, "Supported USB dongle already attached and already permitted.")
        }
    }

    private fun openUsbDevice(device: UsbDevice): UsbIrTransmitter? {
        val disc = usbDiscovery ?: return null
        val tx = disc.openTransmitter(device)
        if (tx != null) {
            Log.i(
                TAG,
                "USB transmitter opened for ${device.productName} (vid=0x${device.vendorId.toString(16)} pid=0x${device.productId.toString(16)})"
            )
        }
        return tx
    }

    private fun openTiqiaaLearnerDevice(device: UsbDevice): TiqiaaUsbLearner? {
        val mgr = usbManager ?: return null
        return TiqiaaUsbLearner.open(mgr, device)
    }

    private fun openElkSmartLearnerDevice(device: UsbDevice): ElkSmartUsbLearner? {
        val mgr = usbManager ?: return null
        return ElkSmartUsbLearner.open(mgr, device)
    }

    private fun currentAudioModeOrNull(): Short? {
        return when (currentTxType) {
            TxType.AUDIO_1_LED -> 1
            TxType.AUDIO_2_LED -> 2
            else -> null
        }
    }

    private fun buildAudioLearningDiagnostics(): Map<String, Any?> {
        val diag = AudioIrLearner.diagnostics(applicationContext)
        return mapOf(
            "permissionGranted" to diag.permissionGranted,
            "usbInputAvailable" to diag.usbInputAvailable,
            "inputName" to diag.inputName,
            "currentAudioMode" to currentAudioModeOrNull()?.toInt(),
        )
    }

    private fun handleRequestAudioLearningPermission(result: MethodChannel.Result) {
        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.RECORD_AUDIO) ==
            PackageManager.PERMISSION_GRANTED
        ) {
            result.success(true)
            return
        }
        if (pendingAudioPermissionResult != null) {
            result.error("AUDIO_PERMISSION_BUSY", "Audio permission request already in progress", null)
            return
        }
        pendingAudioPermissionResult = result
        ActivityCompat.requestPermissions(
            this,
            arrayOf(android.Manifest.permission.RECORD_AUDIO),
            RECORD_AUDIO_PERMISSION_REQUEST,
        )
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray,
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode != RECORD_AUDIO_PERMISSION_REQUEST) return
        val granted = grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED
        pendingAudioPermissionResult?.success(granted)
        pendingAudioPermissionResult = null
    }

    private fun beginUsbLearningSession(predicate: (UsbDevice) -> Boolean): UsbDevice? {
        val disc = usbDiscovery ?: return null
        val mgr = usbManager ?: return null
        val dev = try {
            disc.scanSupported().firstOrNull(predicate)
        } catch (_: Throwable) {
            null
        } ?: return null
        if (!mgr.hasPermission(dev)) {
            return null
        }

        usbLearner?.closeSafely()
        usbLearner = null
        usbTransmitter?.closeSafely()
        usbTransmitter = null
        refreshUsbStateSnapshot()
        emitTxStatus("usb_learning_session_begin")
        emitTxStatusDelayed("usb_learning_session_begin_delayed", 150L)
        return dev
    }

    private fun endUsbLearningSession(reason: String) {
        usbLearner?.closeSafely()
        usbLearner = null

        try {
            openUsbIfPermitted()?.let { usbTransmitter = it }
        } catch (_: Throwable) {
        }

        refreshUsbStateSnapshot()
        emitTxStatus(reason)
        emitTxStatusDelayed("${reason}_delayed", 250L)
    }

    private fun getOrOpenUsbTransmitterOrRequest(): UsbIrTransmitter? {
        return acquireUsbTransmitter(requestPermissionIfNeeded = true).transmitter
    }

    private fun resetUsbTransmitter() {
        usbTransmitter?.closeSafely()
        usbTransmitter = null
        refreshUsbStateSnapshot()
        emitTxStatus("usb_reset")
        emitTxStatusDelayed("usb_reset_delayed", 250L)
    }

    private fun transmitUsbWithRecovery(freqHz: Int, pattern: IntArray): Boolean {
        val tx = getOrOpenUsbTransmitterOrRequest() ?: return false
        val ok1 = try {
            tx.transmitRaw(freqHz, pattern)
        } catch (_: Throwable) {
            false
        }
        if (ok1) return true

        resetUsbTransmitter()

        val tx2 = getOrOpenUsbTransmitterOrRequest() ?: return false
        return try {
            tx2.transmitRaw(freqHz, pattern)
        } catch (_: Throwable) {
            false
        }
    }

    private fun handleHasAnyEmitter(result: MethodChannel.Result) {
        val internal = internalAvailable()
        val usbPresent = try {
            usbDiscovery?.scanSupported()?.isNotEmpty() ?: false
        } catch (_: Throwable) {
            false
        }
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
                val usbResult = acquireUsbTransmitter(requestPermissionIfNeeded = true)
                if (usbResult.transmitter == null) {
                    when (usbResult.state) {
                        UsbAvailabilityState.NO_DEVICE -> {
                            result.error("NO_USB_DEVICE", "No supported USB IR device is attached", null)
                        }
                        UsbAvailabilityState.PERMISSION_REQUIRED,
                        UsbAvailabilityState.PERMISSION_DENIED -> {
                            result.error("USB_PERMISSION_REQUIRED", "USB permission is required for the attached dongle.", null)
                        }
                        UsbAvailabilityState.OPEN_FAILED,
                        UsbAvailabilityState.PERMISSION_GRANTED -> {
                            result.error("USB_OPEN_FAILED", "USB permission granted, but the dongle could not be initialized.", null)
                        }
                        UsbAvailabilityState.READY -> {
                            result.error("USB_OPEN_FAILED", "USB dongle state is inconsistent. Try reconnecting the dongle.", null)
                        }
                    }
                    return
                }

                val ok = transmitUsbWithRecovery(frequency, pattern)
                if (ok) result.success(null) else result.error("USB_TX_FAIL", "USB transmit failed (bulkTransfer returned <= 0)", null)
            }

            TxType.INTERNAL -> {
                val internalOk = internalTx?.transmitRaw(frequency, pattern) == true
                if (internalOk) {
                    result.success(null)
                    return
                }

                val ok = transmitUsbWithRecovery(frequency, pattern)
                if (ok) {
                    result.success(null)
                    return
                }
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
                val usbResult = acquireUsbTransmitter(requestPermissionIfNeeded = true)
                if (usbResult.transmitter == null) {
                    when (usbResult.state) {
                        UsbAvailabilityState.NO_DEVICE -> {
                            result.error("NO_USB_DEVICE", "No supported USB IR device is attached", null)
                        }
                        UsbAvailabilityState.PERMISSION_REQUIRED,
                        UsbAvailabilityState.PERMISSION_DENIED -> {
                            result.error("USB_PERMISSION_REQUIRED", "USB permission is required for the attached dongle.", null)
                        }
                        UsbAvailabilityState.OPEN_FAILED,
                        UsbAvailabilityState.PERMISSION_GRANTED -> {
                            result.error("USB_OPEN_FAILED", "USB permission granted, but the dongle could not be initialized.", null)
                        }
                        UsbAvailabilityState.READY -> {
                            result.error("USB_OPEN_FAILED", "USB dongle state is inconsistent. Try reconnecting the dongle.", null)
                        }
                    }
                    return
                }
                val ok = transmitUsbWithRecovery(safeFreq, pattern)
                if (ok) result.success(null) else result.error("USB_TX_FAIL", "USB transmit failed (bulkTransfer returned <= 0)", null)
            }

            TxType.INTERNAL -> {
                val okInternal = internalTx?.transmitRaw(safeFreq, pattern) == true
                if (okInternal) {
                    result.success(null)
                    return
                }

                val ok = transmitUsbWithRecovery(safeFreq, pattern)
                if (ok) {
                    result.success(null)
                    return
                }
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

    private fun handleTransmitRawCycles(call: MethodCall, result: MethodChannel.Result) {
        val cycles = call.readIntArrayArg("list")
        val freq = call.readIntArg("frequency") ?: DEFAULT_HEX_FREQUENCY
        if (cycles == null || cycles.isEmpty()) {
            result.error("NO_PATTERN", "No pattern provided", null)
            return
        }
        if (!validatePattern(cycles)) {
            result.error("BAD_PATTERN", "All durations must be > 0", null)
            return
        }

        val safeFreq = freq.coerceIn(MIN_IR_HZ, MAX_IR_HZ)
        val converted = convertCyclesToMicros(cycles, safeFreq)
        if (!validatePattern(converted)) {
            result.error("BAD_PATTERN", "Converted pattern contained invalid durations", null)
            return
        }

        transmitRawWithCurrentTx(safeFreq, converted, result)
    }

    private fun transmitRawWithCurrentTx(freq: Int, pattern: IntArray, result: MethodChannel.Result) {
        when (currentTxType) {
            TxType.USB -> {
                val usbResult = acquireUsbTransmitter(requestPermissionIfNeeded = true)
                if (usbResult.transmitter == null) {
                    when (usbResult.state) {
                        UsbAvailabilityState.NO_DEVICE -> {
                            result.error("NO_USB_DEVICE", "No supported USB IR device is attached", null)
                        }
                        UsbAvailabilityState.PERMISSION_REQUIRED,
                        UsbAvailabilityState.PERMISSION_DENIED -> {
                            result.error("USB_PERMISSION_REQUIRED", "USB permission is required for the attached dongle.", null)
                        }
                        UsbAvailabilityState.OPEN_FAILED,
                        UsbAvailabilityState.PERMISSION_GRANTED -> {
                            result.error("USB_OPEN_FAILED", "USB permission granted, but the dongle could not be initialized.", null)
                        }
                        UsbAvailabilityState.READY -> {
                            result.error("USB_OPEN_FAILED", "USB dongle state is inconsistent. Try reconnecting the dongle.", null)
                        }
                    }
                    return
                }
                val ok = transmitUsbWithRecovery(freq, pattern)
                if (ok) result.success(null) else result.error("USB_TX_FAIL", "USB transmit failed (bulkTransfer returned <= 0)", null)
            }

            TxType.INTERNAL -> {
                val okInternal = internalTx?.transmitRaw(freq, pattern) == true
                if (okInternal) {
                    result.success(null)
                    return
                }

                val ok = transmitUsbWithRecovery(freq, pattern)
                if (ok) {
                    result.success(null)
                    return
                }
                result.error("NO_IR", "Internal IR transmit failed or IR emitter not available", null)
            }

            TxType.AUDIO_1_LED -> {
                val ok = audio1Tx.transmitRaw(freq, pattern)
                if (ok) result.success(null) else result.error("AUDIO_TX_FAIL", "Audio transmit failed", null)
            }

            TxType.AUDIO_2_LED -> {
                val ok = audio2Tx.transmitRaw(freq, pattern)
                if (ok) result.success(null) else result.error("AUDIO_TX_FAIL", "Audio transmit failed", null)
            }
        }
    }

    private fun convertCyclesToMicros(input: IntArray, frequency: Int): IntArray {
        val convertMode = when {
            android.os.Build.VERSION.SDK_INT >= 21 -> 1
            android.os.Build.MANUFACTURER.equals("HTC", ignoreCase = true) -> 1
            android.os.Build.MANUFACTURER.equals("SAMSUNG", ignoreCase = true) -> {
                val rel = android.os.Build.VERSION.RELEASE
                val lastIdx = rel.lastIndexOf('.')
                val mr = if (lastIdx >= 0 && lastIdx < rel.length - 1) {
                    rel.substring(lastIdx + 1).toIntOrNull() ?: 0
                } else 0
                if (mr < 3) 0 else 2
            }
            else -> 0
        }

        if (convertMode == 0) return input

        val out = IntArray(input.size)
        if (convertMode == 1) {
            val mult = 1_000_000 / frequency.toDouble()
            for (i in input.indices) {
                out[i] = (input[i] * mult).toInt()
            }
        } else {
            for (i in input.indices) {
                out[i] = kotlin.math.ceil(input[i] * 26.27272727272727).toInt()
            }
        }
        return out
    }

    private fun handleGetSupportedFrequencies(result: MethodChannel.Result) {
        val mgr = irManager
        if (mgr == null) {
            result.success(emptyList<List<Int>>())
            return
        }
        result.success(readCarrierFrequencyPairs(mgr))
    }

    private fun handleGetTxCaps(result: MethodChannel.Result) {
        result.success(buildTxCapsMap())
    }

    private fun handleLearnUsbSignal(call: MethodCall, result: MethodChannel.Result) {
        val audioMode = currentAudioModeOrNull()
        if (audioMode != null) {
            result.error("LEARN_UNSUPPORTED", "Learning Mode supports compatible USB IR dongles only.", null)
            return
        }
        if (usbLearner != null) {
            result.error("LEARN_BUSY", "USB learning is already active", null)
            return
        }

        val timeoutMs = (call.argument<Int>("timeoutMs") ?: 30000).coerceIn(1000, 60000)
        val disc = usbDiscovery
        val mgr = usbManager
        if (disc == null || mgr == null) {
            result.error("NO_USB", "UsbManager not available", null)
            return
        }

        val dev = try {
            disc.scanSupported().firstOrNull {
                UsbDeviceFilter.isTiqiaaTviewFamily(it) || UsbDeviceFilter.isElkSmart(it)
            }
        } catch (_: Throwable) {
            null
        }
        if (dev == null) {
            result.error("LEARN_UNSUPPORTED", "No learning-capable USB IR dongle is attached", null)
            return
        }
        if (!mgr.hasPermission(dev)) {
            disc.requestPermission(dev)
            result.error("USB_PERMISSION_REQUIRED", "USB permission is required for the attached dongle.", null)
            return
        }

        val sessionDevice = beginUsbLearningSession { it.deviceId == dev.deviceId }
        if (sessionDevice == null) {
            result.error("LEARN_OPEN_FAILED", "The USB IR dongle could not be prepared for learning", null)
            return
        }
        usbLearningCancelRequested = false

        Thread {
            var learner: UsbLearnerSession? = null
            try {
                val learned: Map<String, Any?>? = when {
                    UsbDeviceFilter.isTiqiaaTviewFamily(sessionDevice) -> {
                        val tiqiaaLearner = openTiqiaaLearnerDevice(sessionDevice)
                        learner = tiqiaaLearner
                        tiqiaaLearner?.learn(timeoutMs) { usbLearningCancelRequested }?.toWireMap()
                    }
                    UsbDeviceFilter.isElkSmart(sessionDevice) -> {
                        val elkLearner = openElkSmartLearnerDevice(sessionDevice)
                        learner = elkLearner
                        elkLearner?.learn(timeoutMs) { usbLearningCancelRequested }?.toWireMap()
                    }
                    else -> null
                }

                if (learner == null) {
                    runOnUiThread {
                        result.error("LEARN_OPEN_FAILED", "The USB IR dongle could not be opened for learning", null)
                    }
                    return@Thread
                }

                usbLearner = learner
                runOnUiThread {
                    if (usbLearningCancelRequested) {
                        result.success(null)
                    } else if (learned != null) {
                        result.success(learned)
                    } else {
                        result.error("LEARN_TIMEOUT", "No IR signal was captured before the listening window expired", null)
                    }
                }
            } catch (t: Throwable) {
                Log.w(TAG, "learnUsbSignal failed: ${t.message}", t)
                runOnUiThread {
                    result.error("LEARN_FAILED", t.message ?: "USB learning failed", null)
                }
            } finally {
                usbLearningCancelRequested = false
                learner?.closeSafely()
                endUsbLearningSession("usb_learning_finished")
            }
        }.start()
    }

    private fun handleLearnAudioSignal(call: MethodCall, result: MethodChannel.Result, audioMode: Short) {
        if (audioLearner != null) {
            result.error("LEARN_BUSY", "Audio learning is already active", null)
            return
        }
        val diag = AudioIrLearner.diagnostics(applicationContext)
        if (!diag.permissionGranted) {
            result.error("AUDIO_PERMISSION_REQUIRED", "Microphone permission is required for audio learning.", null)
            return
        }
        if (!diag.usbInputAvailable) {
            result.error("AUDIO_INPUT_UNAVAILABLE", "No USB audio input device is available for learning.", null)
            return
        }

        val timeoutMs = (call.argument<Int>("timeoutMs") ?: 30000).coerceIn(1000, 60000)
        audioLearningCancelRequested = false

        Thread {
            val learner = AudioIrLearner(applicationContext, audioMode)
            audioLearner = learner
            try {
                val learned = learner.learn(timeoutMs)
                audioLearningCancelRequested = false
                learner.cancel()
                audioLearner = null
                runOnUiThread {
                    if (audioLearningCancelRequested) {
                        result.success(null)
                    } else if (learned != null) {
                        result.success(learned.toWireMap())
                    } else {
                        result.error("LEARN_TIMEOUT", "No audio learning signal was captured before the listening window expired", null)
                    }
                }
            } catch (t: Throwable) {
                Log.w(TAG, "learnAudioSignal failed: ${t.message}", t)
                runOnUiThread {
                    result.error("LEARN_FAILED", t.message ?: "Audio learning failed", null)
                }
            } finally {
                audioLearningCancelRequested = false
                learner.cancel()
                audioLearner = null
            }
        }.start()
    }

    private fun handleCancelUsbLearning(result: MethodChannel.Result) {
        usbLearningCancelRequested = true
        usbLearner?.cancel()
        audioLearningCancelRequested = true
        audioLearner?.cancel()
        // Also cancel any concurrent internal-hardware learning sessions so a
        // single cancel call from the Flutter side covers all active learners.
        huaweiLearningCancelRequested = true
        huaweiLearner?.cancel()
        lgLearningCancelRequested = true
        lgLearner?.cancel()
        result.success(true)
    }

    private fun handleLearnHuaweiSignal(call: MethodCall, result: MethodChannel.Result) {
        if (huaweiLearner != null) {
            result.error("LEARN_BUSY", "Huawei IR learning is already active", null)
            return
        }
        if (!HuaweiIrLearner.isSupported(applicationContext)) {
            result.error(
                "LEARN_UNSUPPORTED",
                "This device does not support Huawei IR self-learning",
                null,
            )
            return
        }

        val timeoutMs = (call.argument<Int>("timeoutMs") ?: 30_000).coerceIn(1_000, 60_000)
        huaweiLearningCancelRequested = false

        Thread {
            var learner: HuaweiIrLearner? = null
            try {
                val opened = HuaweiIrLearner.open(applicationContext)
                if (opened == null) {
                    runOnUiThread {
                        result.error(
                            "LEARN_OPEN_FAILED",
                            "Could not initialize Huawei IR learning hardware",
                            null,
                        )
                    }
                    return@Thread
                }
                learner = opened
                huaweiLearner = opened

                val learned = opened.learn(timeoutMs) { huaweiLearningCancelRequested }

                runOnUiThread {
                    when {
                        huaweiLearningCancelRequested -> result.success(null)
                        learned != null -> result.success(learned.toWireMap())
                        else -> result.error(
                            "LEARN_TIMEOUT",
                            "No IR signal was captured before the listening window expired",
                            null,
                        )
                    }
                }
            } catch (t: Throwable) {
                Log.w(TAG, "learnHuaweiSignal failed: ${t.message}", t)
                runOnUiThread {
                    result.error("LEARN_FAILED", t.message ?: "Huawei IR learning failed", null)
                }
            } finally {
                huaweiLearningCancelRequested = false
                learner?.cancel()
                huaweiLearner = null
            }
        }.start()
    }

    private fun handleCancelHuaweiLearning(result: MethodChannel.Result) {
        huaweiLearningCancelRequested = true
        huaweiLearner?.cancel()
        result.success(true)
    }

    private fun handleLearnLgSignal(call: MethodCall, result: MethodChannel.Result) {
        if (lgLearner != null) {
            result.error("LEARN_BUSY", "LG IR learning is already active", null)
            return
        }
        if (!LgIrLearner.isSupported(applicationContext)) {
            result.error(
                "LEARN_UNSUPPORTED",
                "This device does not have the LG UEI Quickset IR service",
                null,
            )
            return
        }

        val timeoutMs = (call.argument<Int>("timeoutMs") ?: 30_000).coerceIn(1_000, 60_000)
        lgLearningCancelRequested = false

        Thread {
            var learner: LgIrLearner? = null
            try {
                val opened = LgIrLearner.open(applicationContext)
                if (opened == null) {
                    runOnUiThread {
                        result.error(
                            "LEARN_OPEN_FAILED",
                            "Could not connect to LG UEI Quickset service",
                            null,
                        )
                    }
                    return@Thread
                }
                learner = opened
                lgLearner = opened

                if (!opened.isLearningSupported()) {
                    runOnUiThread {
                        result.error(
                            "LEARN_UNSUPPORTED",
                            "This LG device does not support IR learning",
                            null,
                        )
                    }
                    return@Thread
                }

                val learned = opened.learn(timeoutMs) { lgLearningCancelRequested }

                runOnUiThread {
                    when {
                        lgLearningCancelRequested -> result.success(null)
                        learned != null           -> result.success(learned.toWireMap())
                        else -> result.error(
                            "LEARN_TIMEOUT",
                            "No IR signal was captured before the listening window expired",
                            null,
                        )
                    }
                }
            } catch (t: Throwable) {
                Log.w(TAG, "learnLgSignal failed: ${t.message}", t)
                runOnUiThread {
                    result.error("LEARN_FAILED", t.message ?: "LG IR learning failed", null)
                }
            } finally {
                lgLearningCancelRequested = false
                learner?.cancel()
                lgLearner = null
            }
        }.start()
    }

    private fun handleCancelLgLearning(result: MethodChannel.Result) {
        lgLearningCancelRequested = true
        lgLearner?.cancel()
        result.success(true)
    }

    private fun handleReplayLearnedUsbSignal(call: MethodCall, result: MethodChannel.Result) {
        val family = (call.argument<String>("family") ?: "").trim().lowercase()
        val frameBase64 = (call.argument<String>("opaqueFrameBase64") ?: "").trim()
        if ((family != "tiqiaa" && family != "elksmart" && family != "audio") || frameBase64.isEmpty()) {
            result.error("BAD_LEARNED_SIGNAL", "Missing learned USB frame payload", null)
            return
        }

        val frame = try {
            Base64.decode(frameBase64, Base64.DEFAULT)
        } catch (t: Throwable) {
            result.error("BAD_LEARNED_SIGNAL", "Opaque learned frame is not valid Base64", null)
            return
        }

        if (family == "audio") {
            val mode = ((call.argument<Int>("opaqueMeta") ?: currentAudioModeOrNull()?.toInt() ?: 1)
                .coerceIn(1, 2)).toShort()
            val ok = AudioCapturedIrPlayer.playMonoPcm16(frame, 44_100, mode)
            result.success(ok)
            return
        }

        val disc = usbDiscovery
        val mgr = usbManager
        if (disc == null || mgr == null) {
            result.error("NO_USB", "UsbManager not available", null)
            return
        }
        val dev = try {
            disc.scanSupported().firstOrNull {
                when (family) {
                    "tiqiaa" -> UsbDeviceFilter.isTiqiaaTviewFamily(it)
                    "elksmart" -> UsbDeviceFilter.isElkSmart(it)
                    else -> false
                }
            }
        } catch (_: Throwable) {
            null
        }
        if (dev == null) {
            result.error("NO_USB_DEVICE", "No matching USB IR dongle is attached", null)
            return
        }
        if (!mgr.hasPermission(dev)) {
            disc.requestPermission(dev)
            result.error("USB_PERMISSION_REQUIRED", "USB permission is required for the attached dongle.", null)
            return
        }

        val sessionDevice = beginUsbLearningSession { it.deviceId == dev.deviceId }
        if (sessionDevice == null) {
            result.error("LEARNED_REPLAY_FAILED", "The USB IR dongle could not be prepared for replay", null)
            return
        }

        Thread {
            var learner: UsbLearnerSession? = null
            try {
                val ok = when (family) {
                    "tiqiaa" -> {
                        val tiqiaaLearner = openTiqiaaLearnerDevice(sessionDevice)
                        learner = tiqiaaLearner
                        usbLearner = tiqiaaLearner
                        tiqiaaLearner?.replayOpaqueFrame(frame) == true
                    }
                    "elksmart" -> {
                        val pattern = ElkSmartUsbLearner.decodeOpaqueFrameToPattern(frame)
                        if (pattern.isEmpty()) {
                            false
                        } else {
                            val tx = openUsbDevice(sessionDevice)
                            try {
                                tx?.transmitRaw(38000, pattern) == true
                            } finally {
                                tx?.closeSafely()
                            }
                        }
                    }
                    else -> false
                }
                runOnUiThread {
                    if (ok) {
                        result.success(true)
                    } else {
                        result.error("LEARNED_REPLAY_FAILED", "The learned signal could not be replayed", null)
                    }
                }
            } catch (t: Throwable) {
                Log.w(TAG, "replayLearnedUsbSignal failed: ${t.message}", t)
                runOnUiThread {
                    result.error("LEARNED_REPLAY_FAILED", t.message ?: "Replay failed", null)
                }
            } finally {
                learner?.closeSafely()
                endUsbLearningSession("usb_learning_replay_finished")
            }
        }.start()
    }

    private fun handleUsbScanAndRequest(result: MethodChannel.Result) {
        val disc = usbDiscovery
        val mgr = usbManager
        if (disc == null || mgr == null) {
            result.error("NO_USB", "UsbManager not available", null)
            return
        }
        val devices = disc.scanSupported()
        if (devices.isEmpty()) {
            setUsbState(UsbAvailabilityState.NO_DEVICE, "No supported USB IR dongle is attached.")
            result.success(false)
            return
        }
        val dev = devices.first()
        if (mgr.hasPermission(dev)) {
            val opened = openUsbDevice(dev)
            if (opened != null) {
                usbTransmitter = opened
                setUsbState(UsbAvailabilityState.READY, "USB dongle is connected and initialized.")
                applyAutoSwitchIfEnabled("usb_scan_request_already_permitted")
                emitTxStatus("usb_already_permitted_opened")
                emitTxStatusDelayed("usb_already_permitted_opened_delayed", 250L)
                result.success(true)
                return
            }
            setUsbState(
                UsbAvailabilityState.OPEN_FAILED,
                "USB permission is granted, but the dongle could not be initialized."
            )
            applyAutoSwitchIfEnabled("usb_scan_request_open_failed")
            emitTxStatus("usb_already_permitted_open_failed")
            emitTxStatusDelayed("usb_already_permitted_open_failed_delayed", 250L)
            result.success(true)
            return
        }
        setUsbState(UsbAvailabilityState.PERMISSION_REQUIRED, "USB permission is required for the attached dongle.")
        disc.requestPermission(dev)
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
                val usbResult = acquireUsbTransmitter(requestPermissionIfNeeded = true)
                emitTxStatus("set_tx_usb")
                emitTxStatusDelayed("set_tx_usb_delayed", 350L)
                if (usbResult.transmitter == null) {
                    when (usbResult.state) {
                        UsbAvailabilityState.NO_DEVICE -> {
                        result.error("NO_USB_DEVICE", "No supported USB IR device is attached", null)
                        }
                        UsbAvailabilityState.OPEN_FAILED -> {
                            result.error(
                                "USB_OPEN_FAILED",
                                "USB permission granted, but the dongle could not be initialized.",
                                null
                            )
                        }
                        else -> {
                            result.success(currentTxType.name)
                        }
                    }
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
        if (disc == null || mgr == null) {
            result.success(null)
            return
        }
        val dev = disc.scanSupported().firstOrNull()
        if (dev == null) {
            result.success(null)
            return
        }
        val info = UsbIntrospection.describeDevice(dev, mgr.hasPermission(dev))
        result.success(info)
    }

    private fun readCarrierFrequencyPairs(mgr: ConsumerIrManager): List<List<Int>> {
        try {
            val ranges: Array<ConsumerIrManager.CarrierFrequencyRange>? = mgr.carrierFrequencies
            if (ranges != null && ranges.isNotEmpty()) {
                return ranges.map { listOf(it.minFrequency, it.maxFrequency) }
            }
        } catch (_: Throwable) {
        }

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
        try {
            close()
        } catch (_: Throwable) {
        }
    }

    private fun UsbLearnerSession.closeSafely() {
        try {
            close()
        } catch (_: Throwable) {
        }
    }
}
