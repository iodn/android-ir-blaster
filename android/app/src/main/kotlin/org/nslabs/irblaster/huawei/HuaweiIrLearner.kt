package org.nslabs.ir_blaster.huawei

import android.content.Context
import android.os.Build
import android.util.Base64
import android.util.Log
import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * IR self-learning backend for Huawei (and Honor) devices.
 *
 * Huawei ships a proprietary [android.irself.IrSelfLearningManager] API on
 * devices that have a built-in IR receiver for learning third-party remotes.
 * Because this class does not exist in the Android SDK, every call goes through
 * reflection so this file compiles cleanly on all Android devices.
 *
 * Reverse-engineering notes (verified against LearnKeyActivity$IrTestTask.smali
 * and InfraredManager.smali from the official Huawei Remote Controller APK):
 *
 *   • Instance must be obtained via IrSelfLearningManager.getDefault() — this is
 *     the exact static factory used by the ROM (InfraredManager.smali line 127).
 *
 *   • getLearningStatus() returns TRUE once a signal has been captured and is
 *     ready to be read (IrTestTask.smali line 142: if-eqz → timeout path, meaning
 *     fall-through on true = read the code).  Returns FALSE while still waiting.
 *
 *   • The polling interval is exactly 500 ms (0x1f4 hex, IrTestTask.smali line 114).
 *
 *   • readIrFrequency() is called BEFORE readIrCode() (lines 151, 164).
 *
 *   • The code array is validated (null check + length > 0) before accepting the
 *     capture (lines 177, 187).
 *
 *   • A 30-second (0x7530 ms) timeout mirrors the ROM's own deadline
 *     (IrTestTask.smali line 264).
 *
 * Usage
 * -----
 *  1. Call [isSupported] — cheap, cached, safe on any thread.
 *  2. On a background thread, call [open] to get a learner instance.
 *  3. Call [learn] (blocking) and collect the [LearnedSignal].
 *  4. Call [cancel] at any time from any thread to abort.
 */
class HuaweiIrLearner private constructor(
    private val manager: Any,
    private val clazz: Class<*>,
) {

    data class LearnedSignal(
        val rawPatternUs: IntArray,
        val frequencyHz: Int,
        val quality: Int = 80,
    ) {
        /**
         * Returns the wire map sent to the Flutter layer.
         *
         * The signal is stored as raw microsecond pulse data (matching Android's
         * ConsumerIrManager format) so it can be replayed on any IR-capable device
         * without requiring Huawei hardware.  [opaqueFrameBase64] is the same data
         * packed as a little-endian int32 byte array for round-trip fidelity.
         */
        fun toWireMap(): Map<String, Any?> {
            val buf = ByteBuffer.allocate(rawPatternUs.size * Int.SIZE_BYTES)
            buf.order(ByteOrder.LITTLE_ENDIAN)
            rawPatternUs.forEach(buf::putInt)
            val encoded = Base64.encodeToString(buf.array(), Base64.NO_WRAP)

            val pulseCount = rawPatternUs.size
            val totalMs = rawPatternUs.fold(0L) { acc, v -> acc + v } / 1_000L
            val preview = "Huawei internal IR\n$pulseCount pulses · $frequencyHz Hz · ${totalMs} ms"

            return mapOf(
                "family" to FAMILY,
                "rawPatternUs" to rawPatternUs.toList(),
                "opaqueFrameBase64" to encoded,
                "opaqueMeta" to frequencyHz,
                "quality" to quality,
                "frequencyHz" to frequencyHz,
                "displayPreview" to preview,
            )
        }
    }

    // -------------------------------------------------------------------------
    // Companion – static helpers
    // -------------------------------------------------------------------------

    companion object {
        const val FAMILY = "huawei_ir"

        private const val TAG = "HuaweiIrLearner"
        private const val CLASS_NAME = "android.irself.IrSelfLearningManager"

        // Matches the ROM: 0x1f4 = 500 ms (IrTestTask.smali line 114)
        private const val POLL_INTERVAL_MS = 500L
        private const val MIN_PULSES = 6
        private const val MIN_FREQ_HZ = 15_000
        private const val MAX_FREQ_HZ = 60_000

        @Volatile private var supportedCache: Boolean? = null

        /**
         * Returns true when:
         *   • Build.MANUFACTURER is "huawei" or "honor", AND
         *   • [android.irself.IrSelfLearningManager] is present on this ROM AND
         *     its [getDefault] factory can return a non-null instance.
         *
         * Result is cached after the first call so it is safe on the main thread.
         */
        fun isSupported(context: Context): Boolean {
            supportedCache?.let { return it }
            val result = probe(context)
            supportedCache = result
            return result
        }

        private fun probe(context: Context): Boolean {
            val mfr = Build.MANUFACTURER.lowercase()
            if (mfr != "huawei" && mfr != "honor") return false
            // Primary capability flag: HelpUtils reads this system property at
            // class-init time to gate all learning UI (HelpUtils.<clinit> line 242).
            // Default is true so it is safe if the property is absent.
            if (!readIrdaLearningSupportProp()) return false
            return try {
                val clazz = Class.forName(CLASS_NAME)
                obtainInstance(context, clazz) != null
            } catch (_: Throwable) {
                false
            }
        }

        /**
         * Reads the system property "hw_mc.irda_learning_support" that the ROM
         * uses as its primary IR-learning capability flag.
         * Defaults to true when the property or the API is absent so that devices
         * without the property but with functional hardware are not excluded.
         */
        private fun readIrdaLearningSupportProp(): Boolean {
            // Try Huawei's proprietary SystemPropertiesEx first (exact class used by ROM).
            try {
                val spx = Class.forName("com.huawei.android.os.SystemPropertiesEx")
                val get = spx.getMethod("getBoolean", String::class.java, Boolean::class.java)
                return get.invoke(null, "hw_mc.irda_learning_support", true) as? Boolean ?: true
            } catch (_: Throwable) {
            }
            // Fall back to the hidden-API android.os.SystemProperties (same value, same key).
            return try {
                val sp = Class.forName("android.os.SystemProperties")
                val get = sp.getMethod("getBoolean", String::class.java, Boolean::class.java)
                get.invoke(null, "hw_mc.irda_learning_support", true) as? Boolean ?: true
            } catch (_: Throwable) {
                true // property absent → assume supported (conservative default)
            }
        }

        /**
         * Opens a [HuaweiIrLearner] ready for use, or returns null if the
         * device does not support Huawei IR learning.
         *
         * Calls [deviceInit] internally; returns null if it fails.
         * Must be called from a background thread.
         */
        fun open(context: Context): HuaweiIrLearner? {
            return try {
                val clazz = Class.forName(CLASS_NAME)
                val instance = obtainInstance(context, clazz) ?: run {
                    Log.w(TAG, "Could not obtain IrSelfLearningManager instance")
                    return null
                }
                // deviceInit() must succeed before the hardware can learn.
                // InfraredManager.smali line 167: invoke-virtual {v0}, IrSelfLearningManager->deviceInit()Z
                val initResult = clazz.getMethod("deviceInit").invoke(instance)
                if (initResult == false) {
                    Log.w(TAG, "IrSelfLearningManager.deviceInit() returned false")
                    return null
                }
                HuaweiIrLearner(instance, clazz)
            } catch (t: Throwable) {
                Log.w(TAG, "open() failed: ${t.message}")
                null
            }
        }

        /**
         * Obtains the IrSelfLearningManager singleton, trying three strategies:
         *
         *  1. IrSelfLearningManager.getDefault() — static factory used by the
         *     official ROM (InfraredManager.smali line 127). This is the primary
         *     and correct path.
         *
         *  2. Context.getSystemService("irself") — fallback for ROM variants
         *     that register the manager as a named service.
         *
         *  3. No-arg constructor — last resort for older / heavily modified ROMs.
         */
        private fun obtainInstance(context: Context, clazz: Class<*>): Any? {
            // Primary: static factory — exact method used by InfraredManager.smali
            try {
                val instance = clazz.getMethod("getDefault").invoke(null)
                if (instance != null) return instance
            } catch (_: Throwable) {
            }
            // Secondary: named system service
            try {
                val svc = context.getSystemService("irself")
                if (svc != null && clazz.isInstance(svc)) return svc
            } catch (_: Throwable) {
            }
            // Tertiary: direct construction
            return try {
                clazz.getDeclaredConstructor().newInstance()
            } catch (_: Throwable) {
                null
            }
        }
    }

    // -------------------------------------------------------------------------
    // Instance – learning session
    // -------------------------------------------------------------------------

    @Volatile private var cancelled = false

    /**
     * Blocks the calling thread until one of:
     *   • An IR signal is captured → returns [LearnedSignal].
     *   • [timeoutMs] elapses → returns null.
     *   • [cancelCheck] returns true, or [cancel] is called → returns null.
     *
     * Replicates the exact polling logic in LearnKeyActivity$IrTestTask.smali:
     *   – startLearning() return value is checked; returns null immediately on failure
     *     (LearnKeyActivity.startLearning() line 2311 aborts IrTestTask launch on fail).
     *   – Poll every 500 ms.
     *   – getLearningStatus() == TRUE  → signal ready; read frequency then code.
     *     If code is non-null and non-empty, capture is complete.
     *     If code is empty despite true status, loop back (defensive).
     *   – getLearningStatus() == FALSE → still waiting; loop back.
     *   – Timeout when the deadline elapses (mirrors ROM's 0x7530 = 30 000 ms).
     *
     * Note: the ROM's SetupWizard.readIrCode() (line 1667) passes the raw int[]
     * through IRemoteControllerManager.clipIrData() before use.  That interface is
     * bound to the Huawei app's application context and cannot be reached from a
     * third-party app, so we use the raw IrSelfLearningManager.readIRCode() array
     * directly.  For playback via ConsumerIrManager.transmit() the raw data is
     * sufficient; clipIrData() is a cleanup pass for Huawei's internal DB storage.
     *
     * Must be called from a background thread.
     */
    fun learn(timeoutMs: Int, cancelCheck: () -> Boolean): LearnedSignal? {
        cancelled = false
        return try {
            val startLearning   = clazz.getMethod("startLearning")
            val stopLearning    = clazz.getMethod("stopLearning")
            val getLearningStatus = clazz.getMethod("getLearningStatus")
            val readIRFrequency = clazz.getMethod("readIRFrequency")
            val readIRCode      = clazz.getMethod("readIRCode")

            // LearnKeyActivity.startLearning() (line 2307) checks the return value
            // and aborts immediately if non-zero — IrTestTask is only launched after
            // a successful startLearning() call.  We must do the same: if the hardware
            // fails to enter learning mode we should return null right away rather
            // than waiting the full timeout.
            val started = startLearning.invoke(manager) as? Boolean ?: false
            if (!started) {
                Log.w(TAG, "startLearning() returned false — hardware did not enter learning mode")
                return null
            }
            Log.i(TAG, "IR learning started (timeout=${timeoutMs}ms)")

            val deadline = System.currentTimeMillis() + timeoutMs
            var result: LearnedSignal? = null

            while (System.currentTimeMillis() < deadline) {
                if (cancelled || cancelCheck()) break

                Thread.sleep(POLL_INTERVAL_MS)

                if (cancelled || cancelCheck()) break

                // getLearningStatus() == true  → signal captured, read it.
                // getLearningStatus() == false → still waiting, continue looping.
                //
                // This matches IrTestTask.smali line 142:
                //   if-eqz v7, :cond_2  (false → timeout-check path, loop back)
                //   fall-through        (true  → read frequency & code)
                val signalReady = getLearningStatus.invoke(manager) as? Boolean ?: false
                if (!signalReady) {
                    // Hardware still listening — keep polling.
                    continue
                }

                // Frequency must be read before the code (IrTestTask.smali lines 151, 164).
                val freq = (readIRFrequency.invoke(manager) as? Number)?.toInt() ?: 38_000
                val code = readIRCode.invoke(manager) as? IntArray

                // Defensive: code must be non-null and contain enough pulses.
                // (IrTestTask.smali lines 177, 187 — null check and length > 0 check.)
                if (code == null || code.size < MIN_PULSES) {
                    Log.w(TAG, "Status true but code invalid (size=${code?.size}); retrying")
                    continue
                }

                val safeFreq = freq.coerceIn(MIN_FREQ_HZ, MAX_FREQ_HZ)
                result = LearnedSignal(rawPatternUs = code, frequencyHz = safeFreq)
                Log.i(TAG, "Signal captured: ${code.size} pulses @ $safeFreq Hz")
                break
            }

            stopLearning.invoke(manager)
            result
        } catch (t: Throwable) {
            Log.e(TAG, "learn() error: ${t.message}", t)
            try { clazz.getMethod("stopLearning").invoke(manager) } catch (_: Throwable) {}
            null
        }
    }

    /**
     * Aborts an in-progress [learn] call at the next poll boundary and
     * immediately calls [stopLearning] on the hardware.
     * Safe to call from any thread.
     */
    fun cancel() {
        cancelled = true
        try {
            clazz.getMethod("stopLearning").invoke(manager)
        } catch (_: Throwable) {
        }
    }
}
