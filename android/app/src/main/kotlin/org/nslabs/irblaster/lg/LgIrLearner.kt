package org.nslabs.ir_blaster.lg

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.Binder
import android.os.Build
import android.os.IBinder
import android.os.Parcel
import android.util.Base64
import android.util.Log
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

/**
 * IR self-learning backend for LG devices via the UEI Quickset SDK service.
 *
 * Fully reverse-engineered from LG QuickRemote APK (smali sources):
 *
 *  Service target  ─── package : com.uei.lg.quicksetsdk
 *                       class   : com.uei.control.Service
 *                       action  : com.uei.control.ISetup  (UeiIrBlasterInitializer$4.smali line 84)
 *
 *  AIDL descriptor ─── "com.uei.control.ISetup"  (ISetup.smali, DESCRIPTOR field)
 *
 *  Auth key pipeline (UeiIrBlasterInitializer$6.smali + CallerHelper.smali):
 *   1. assets/publickey (36 bytes) ─ XOR-decoded with Scrambler key starting at offset 18
 *      → UUID "D2871284-D5FB-4429-82A8-E8F998B318A8" (ASCII, 36 bytes)
 *   2. RandomHelper.calculateRandoms()
 *      → seed = currentTimeMs / windowMs  (getSeed() formula from RandomHelper.smali)
 *      → 32 random ints via MwC PRNG (a=0xFFFFDA61, seed overrides nanoTime)
 *      → packed little-endian via convertToBytes() → 128-byte randomBytes
 *   3. CryptographyTEA.encryptData(randomBytes, apiKeyBytes)
 *      → UEI TEA variant (CryptographyTEA.smali: makeSeed little-endian, scramble 32 rounds)
 *   4. Base64.encodeToString(encryptedBytes, Base64.DEFAULT = 0)  → authKey String
 *      (CallerHelper.smali line: const/4 v1, 0x0 — flags = 0 = Base64.DEFAULT)
 *
 *  Transaction codes (ISetup.smali, TRANSACTION_* fields):
 *   ACTIVATEQUICKSETSERVICE  = 0x01    GETSESSION               = 0x04
 *   ISLEARNINGSUPPORTED      = 0x30    STARTIRLEARNING          = 0x29
 *   STOPIRLEARNING           = 0x2A    GETLEARNEDDATA           = 0x3B
 *   REGISTERLEARNIRSTATUSCALLBACK   = 0x2E
 *   UNREGISTERLEARNIRSTATUSCALLBACK = 0x2F
 *
 *  Callback codes (ILearnIRStatusCallback$Stub.smali, TRANSACTION_* fields):
 *   learnIRCompleted(status) = 0x01   learnIRReady(status) = 0x02
 *
 *  LearnedIRData Parcel layout (LearnedIRData.smali readFromParcel):
 *   readInt()          → Id
 *   createByteArray()  → Data (opaque UEI blob, device-locked)
 *
 * NOTE: LG learned signals are opaque UEI proprietary blobs. They can only be
 * replayed on the same LG device via the same UEI service. Unlike Huawei, there
 * are no raw µs pulse timings — ConsumerIrManager cannot replay them.
 */
class LgIrLearner private constructor(
    private val context: Context,
    private val setupBinder: IBinder,
    private val session: Long,
) {

    // -------------------------------------------------------------------------
    // Learned signal model
    // -------------------------------------------------------------------------

    data class LearnedSignal(
        /** Opaque UEI IR blob. Device-locked: only replayable via sendLearnedData(). */
        val data: ByteArray,
        val id: Int,
    ) {
        fun toWireMap(): Map<String, Any?> {
            val encoded = Base64.encodeToString(data, Base64.NO_WRAP)
            val preview = "LG internal IR\n${data.size} bytes · UEI Quickset format\n" +
                "Device-locked — requires same LG phone to replay"
            return mapOf(
                "family"            to FAMILY,
                "rawPatternUs"      to emptyList<Int>(),   // no raw µs timings for LG
                "opaqueFrameBase64" to encoded,
                "opaqueMeta"        to id,
                "quality"           to 80,
                "frequencyHz"       to 38_000,             // nominal; not meaningful
                "displayPreview"    to preview,
            )
        }
    }

    // -------------------------------------------------------------------------
    // Companion – constants, detection, factory
    // -------------------------------------------------------------------------

    companion object {
        const val FAMILY = "lge_ir"

        private const val TAG = "LgIrLearner"

        // UEI Quickset service coordinates (UeiIrBlasterVersion.smali)
        const val SERVICE_PACKAGE   = "com.uei.lg.quicksetsdk"
        const val SERVICE_CLASS     = "com.uei.control.Service"
        const val SERVICE_ACTION    = "com.uei.control.ISetup"

        // AIDL interface descriptors
        private const val ISETUP_DESCRIPTOR         = "com.uei.control.ISetup"
        private const val ILEARN_CALLBACK_DESCRIPTOR = "com.uei.control.ILearnIRStatusCallback"

        // ISetup transaction codes (ISetup.smali TRANSACTION_* fields)
        private const val TX_ACTIVATE           = 0x01
        private const val TX_GET_SESSION        = 0x04
        private const val TX_IS_LEARN_SUPPORTED = 0x30
        private const val TX_START_LEARNING     = 0x29
        private const val TX_STOP_LEARNING      = 0x2A
        private const val TX_GET_LEARNED_DATA   = 0x3B
        private const val TX_REGISTER_CB        = 0x2E
        private const val TX_UNREGISTER_CB      = 0x2F

        // ILearnIRStatusCallback transaction codes (ILearnIRStatusCallback$Stub.smali)
        private const val CB_LEARN_COMPLETED = 0x01
        private const val CB_LEARN_READY     = 0x02

        // Service bind timeout
        private const val BIND_TIMEOUT_MS = 6_000L

        // ── Auth key constants (Scrambler.smali + UeiIrBlasterInitializer$6.smali) ──

        // The assets/publickey file extracted from the APK (36 bytes).
        // Verified against the APK at /home/intra/Downloads/remotes_reverse/LG QuickRemote/LG-QuickRemote.apk
        private val ENCODED_KEY = byteArrayOf(
            0x2f, 0x5e, 0x0c, 0x52, 0x06, 0x0b, 0x00, 0x3d,
            0x19, 0x64, 0x1b, 0x64, 0x3c, 0x1c, 0x01, 0x00,
            0x54, 0x33, 0x47, 0x50, 0x54, 0x2a, 0x50, 0x4a,
            0x7d, 0x0f, 0x72, 0x00, 0x01, 0x50, 0x36, 0x62,
            0x60, 0x0c, 0x73, 0x0a,
        )

        // Scrambler.smali: KEY field (static final String)
        private const val SCRAMBLER_KEY =
            "\u00017954ndsfjkhaklfdjkl4e798\t4 .\"~154f\njhfkhg87498htQQ42293"

        // Decoded once at class load: Scrambler.vencr(ENCODED_KEY) → UUID ASCII bytes
        // enCounter starts at KEY_LEN / 3 = 56 / 3 = 18  (integer division)
        // out[i] = ENCODED_KEY[i] ^ KEY[(18 + i) % 56]
        // Result: "D2871284-D5FB-4429-82A8-E8F998B318A8"
        val API_KEY: ByteArray by lazy {
            val keyLen = SCRAMBLER_KEY.length          // 56
            val start  = keyLen / 3                    // 18
            ByteArray(ENCODED_KEY.size) { i ->
                (ENCODED_KEY[i].toInt() xor SCRAMBLER_KEY[(start + i) % keyLen].code).toByte()
            }
        }

        // RandomHelper defaults (CallerHelper.smali constructor)
        private const val WINDOW_MS       = 5_000L
        private const val ERROR_MS        = 1_000L
        private const val RANDOM_ARR_SIZE = 32

        @Volatile private var supportedCache: Boolean? = null

        /**
         * Returns true when:
         *  • Build.MANUFACTURER is "lge", AND
         *  • the UEI Quickset package (com.uei.lg.quicksetsdk) is installed on this ROM.
         *
         * Safe to call from any thread. Result is cached after the first call.
         */
        fun isSupported(context: Context): Boolean {
            supportedCache?.let { return it }
            val result = probe(context)
            supportedCache = result
            return result
        }

        private fun probe(context: Context): Boolean {
            if (!Build.MANUFACTURER.equals("lge", ignoreCase = true)) return false
            return try {
                context.packageManager.getPackageInfo(SERVICE_PACKAGE, 0)
                true
            } catch (_: Throwable) {
                false
            }
        }

        /**
         * Binds to the UEI Quickset service, activates it, and returns a ready
         * [LgIrLearner], or null if the device is not supported or binding fails.
         *
         * Blocks the calling thread during binding (up to [BIND_TIMEOUT_MS] ms).
         * Must be called from a background thread.
         */
        fun open(context: Context): LgIrLearner? {
            if (!isSupported(context)) return null
            return try {
                val latch = CountDownLatch(1)
                var binder: IBinder? = null

                val conn = object : ServiceConnection {
                    override fun onServiceConnected(name: ComponentName?, service: IBinder?) {
                        binder = service
                        latch.countDown()
                    }
                    override fun onServiceDisconnected(name: ComponentName?) {}
                }

                val intent = Intent(SERVICE_ACTION).setClassName(SERVICE_PACKAGE, SERVICE_CLASS)
                val bound = context.bindService(intent, conn, Context.BIND_AUTO_CREATE)
                if (!bound) {
                    Log.w(TAG, "bindService() returned false — service not available")
                    return null
                }

                if (!latch.await(BIND_TIMEOUT_MS, TimeUnit.MILLISECONDS)) {
                    Log.w(TAG, "Timed out waiting for service connection")
                    try { context.unbindService(conn) } catch (_: Throwable) {}
                    return null
                }

                val setupBinder = binder ?: run {
                    Log.w(TAG, "Service binder is null after connection")
                    try { context.unbindService(conn) } catch (_: Throwable) {}
                    return null
                }

                // Step 1: Retrieve the session ID.
                // Matches UeiIrBlasterInitializer$2.smali onServiceConnected line 77:
                //   invoke-virtual {v2}, ISetup->getSession()J
                // getSession() is called immediately on connect, BEFORE activation.
                // Default return from ISetup proxy is -1L (const-wide/16 v2, -0x1) on error.
                val session = getSession(setupBinder)
                if (session <= 0L) {
                    Log.w(TAG, "getSession() returned $session")
                    try { context.unbindService(conn) } catch (_: Throwable) {}
                    return null
                }

                // Step 2: Activate the service with our auth key.
                // Matches UeiIrBlasterInitializer$7.smali (initSetup thread):
                //   invoke-virtual {v1, v2}, ISetup->activateQuicksetService(String)Z
                val authKey = generateAuthToken(API_KEY)
                if (!activate(setupBinder, authKey)) {
                    Log.w(TAG, "activateQuicksetService() failed")
                    try { context.unbindService(conn) } catch (_: Throwable) {}
                    return null
                }

                Log.i(TAG, "UEI service open — session=$session")
                LgIrLearner(context, setupBinder, session)
            } catch (t: Throwable) {
                Log.w(TAG, "open() failed: ${t.message}")
                null
            }
        }

        // ── ISetup helper calls (used during open()) ──────────────────────────

        private fun activate(binder: IBinder, authKey: String): Boolean {
            val data  = Parcel.obtain()
            val reply = Parcel.obtain()
            return try {
                data.writeInterfaceToken(ISETUP_DESCRIPTOR)
                data.writeString(authKey)
                binder.transact(TX_ACTIVATE, data, reply, 0)
                reply.readException()
                reply.readInt() != 0  // returns boolean
            } catch (_: Throwable) {
                false
            } finally {
                data.recycle(); reply.recycle()
            }
        }

        private fun getSession(binder: IBinder): Long {
            val data  = Parcel.obtain()
            val reply = Parcel.obtain()
            return try {
                data.writeInterfaceToken(ISETUP_DESCRIPTOR)
                binder.transact(TX_GET_SESSION, data, reply, 0)
                reply.readException()
                reply.readLong()
            } catch (_: Throwable) {
                0L
            } finally {
                data.recycle(); reply.recycle()
            }
        }

        // ── Auth key generation ───────────────────────────────────────────────

        /**
         * Replicates CallerHelper.getEncryptedStringBase64(secretKey):
         *  1. seed = currentTimeMs / WINDOW_MS  (RandomHelper.getSeed() formula)
         *  2. 32 random ints via MwC PRNG → 128 bytes (little-endian via convertToBytes)
         *  3. TEA-encrypt the random bytes using apiKey as the key
         *  4. Base64.encodeToString(encrypted, 0)
         *
         * Flags = 0 = Base64.DEFAULT (CallerHelper.smali: `const/4 v1, 0x0`).
         * DEFAULT adds "\n" every 76 chars; the UEI service validates after decoding
         * which is whitespace-tolerant, but we match the original encoding exactly.
         */
        fun generateAuthToken(apiKey: ByteArray): String {
            val timeMs      = System.currentTimeMillis()
            val seed        = timeMs / WINDOW_MS           // RandomHelper.getSeed()
            val randomInts  = mwcRandoms(seed, RANDOM_ARR_SIZE)
            val randomBytes = intsToBytes(randomInts)      // 32 * 4 = 128 bytes

            val encrypted = teaEncryptData(randomBytes, apiKey)
            // Base64.DEFAULT (= 0): matches CallerHelper.smali `const/4 v1, 0x0`
            return Base64.encodeToString(encrypted, Base64.DEFAULT)
        }

        // ── MwC PRNG (RandomMwC.smali) ────────────────────────────────────────

        // a = 0xFFFFDA61 (RandomMwC.smali static field)
        private const val MWC_A = 0xFFFFDA61L

        /**
         * Generates [count] pseudo-random ints using the MwC PRNG (RandomMwC.smali).
         *
         * Constructor sets x = System.nanoTime() & 0xFFFFFFFF then immediately
         * overwrites x = seed (smali line 29: iput-wide p1, p0, x).
         * Net effect: seed is the sole state. nanoTime is irrelevant.
         */
        private fun mwcRandoms(seed: Long, count: Int): IntArray {
            // Direct seed assignment mirrors the constructor override (smali line 29).
            var x = seed
            val result = IntArray(count)
            for (i in 0 until count) {
                val xLow  = x and 0xFFFFFFFFL
                val xHigh = x ushr 32
                x = MWC_A * xLow + xHigh   // nextInt() from smali
                result[i] = x.toInt()
            }
            return result
        }

        /** convertToBytes([I)[B from RandomHelper.smali: packs each int little-endian. */
        private fun intsToBytes(ints: IntArray): ByteArray {
            val out = ByteArray(ints.size * 4)
            for (i in ints.indices) {
                val v = ints[i]
                out[i * 4 + 0] = (v and 0xFF).toByte()
                out[i * 4 + 1] = (v ushr 8  and 0xFF).toByte()
                out[i * 4 + 2] = (v ushr 16 and 0xFF).toByte()
                out[i * 4 + 3] = (v ushr 24 and 0xFF).toByte()
            }
            return out
        }

        // ── UEI TEA encryption (CryptographyTEA.smali) ───────────────────────

        /**
         * Replicates CryptographyTEA.encryptData(data, key):
         *  1. makeSeed(key)  — first 16 key bytes → 4 little-endian int32s
         *  2. pad data to an even count of 8-byte blocks
         *  3. buffer[0] = data.length; pack data big-endian into buffer[1..]
         *  4. scrambleData(buffer) — TEA-encrypt pairs at indices 1..
         *  5. unpack all of buffer (including [0]) to bytes big-endian → output
         *
         * CryptographyTEA.smali constants: CYCLES=32, DELTA=0x9E3779B9
         */
        fun teaEncryptData(data: ByteArray, key: ByteArray): ByteArray {
            require(key.size >= 16) { "TEA key must be at least 16 bytes" }
            val seed = makeSeed(key)

            // paddedSize (in pairs of ints): matches smali line 65-69
            val n = data.size / 8
            val r = data.size % 8
            val paddedSize = if (r != 0) (n + 1) * 2 else n * 2

            // buffer: [0] = original length, [1..] = packed data
            val buffer = IntArray(paddedSize + 1)
            buffer[0] = data.size
            packBigEndian(data, buffer, 1)
            scramble(buffer, seed)

            return unpackBigEndian(buffer, 0, buffer.size * 4)
        }

        /** makeSeed([B)V from CryptographyTEA.smali: 4 ints, each packed little-endian. */
        private fun makeSeed(key: ByteArray): IntArray = IntArray(4) { i ->
            val o = i * 4
            (key[o].toInt()     and 0xFF) or
            ((key[o + 1].toInt() and 0xFF) shl 8) or
            ((key[o + 2].toInt() and 0xFF) shl 16) or
            ((key[o + 3].toInt() and 0xFF) shl 24)
        }

        /**
         * packInputData([B[II)V — packs bytes big-endian into ints.
         * shift starts at 24, decrements by 8; advances to next int after 4 bytes.
         */
        private fun packBigEndian(src: ByteArray, dest: IntArray, destOffset: Int) {
            var j = destOffset
            var shift = 24
            if (j < dest.size) dest[j] = 0
            for (b in src) {
                dest[j] = dest[j] or ((b.toInt() and 0xFF) shl shift)
                if (shift == 0) {
                    shift = 24
                    j++
                    if (j < dest.size) dest[j] = 0
                } else {
                    shift -= 8
                }
            }
        }

        /**
         * scrambleData([I)V from CryptographyTEA.smali.
         * Processes pairs starting at index 1 (index 0 is the length header).
         * UEI TEA variant:
         *   sum starts at 0, each round: sum -= 0x61C88647 (≡ sum += 0x9E3779B9)
         *   v0 += ((v1 << 4) + k[0]) ^ v1 + (v1 >>> 5) ^ sum + k[1]
         *   v1 += ((v0 << 4) + k[2]) ^ v0 + (v0 >>> 5) ^ sum + k[3]
         */
        private fun scramble(buffer: IntArray, seed: IntArray) {
            var i = 1
            while (i < buffer.size) {
                var v0  = buffer[i]
                var v1  = buffer[i + 1]
                var sum = 0
                repeat(32) {
                    sum -= 0x61c88647            // += 0x9E3779B9

                    val f0 = ((v1 shl 4) + seed[0]) xor v1
                    val g0 = (v1 ushr 5) xor sum
                    v0 += f0 + g0 + seed[1]

                    val f1 = ((v0 shl 4) + seed[2]) xor v0
                    val g1 = (v0 ushr 5) xor sum
                    v1 += f1 + g1 + seed[3]
                }
                buffer[i]     = v0
                buffer[i + 1] = v1
                i += 2
            }
        }

        /**
         * unpackInputData([III)[B — unpacks ints to bytes big-endian.
         * Produces destLength bytes from buffer starting at srcOffset.
         */
        private fun unpackBigEndian(src: IntArray, srcOffset: Int, destLength: Int): ByteArray {
            val dest = ByteArray(destLength)
            var j     = srcOffset
            var count = 0
            for (k in 0 until destLength) {
                dest[k] = ((src[j] ushr (24 - count * 8)) and 0xFF).toByte()
                count++
                if (count == 4) { count = 0; j++ }
            }
            return dest
        }
    }

    // -------------------------------------------------------------------------
    // Instance – IPC helpers
    // -------------------------------------------------------------------------

    /** Sends a transaction on the ISetup binder and returns the reply Parcel.
     *  Caller MUST call [Parcel.recycle] on the returned parcel when done.
     *  Returns null on any failure. */
    private fun setupCall(txCode: Int, writeParams: Parcel.() -> Unit): Parcel? {
        val data  = Parcel.obtain()
        val reply = Parcel.obtain()
        return try {
            data.writeInterfaceToken(ISETUP_DESCRIPTOR)
            data.writeParams()
            val ok = setupBinder.transact(txCode, data, reply, 0)
            if (!ok) { reply.recycle(); return null }
            reply.readException()
            reply
        } catch (_: Throwable) {
            reply.recycle()
            null
        } finally {
            data.recycle()
        }
    }

    private fun generateAuth() = generateAuthToken(API_KEY)

    // -------------------------------------------------------------------------
    // Instance – ILearnIRStatusCallback binder stub
    // -------------------------------------------------------------------------

    /**
     * Receives learning status callbacks from the UEI service.
     * Implements ILearnIRStatusCallback by handling raw binder transactions.
     *
     * Transaction codes (ILearnIRStatusCallback$Stub.smali):
     *   0x01 = learnIRCompleted(status: int)
     *   0x02 = learnIRReady(status: int)
     */
    private inner class LearnIrCallback : Binder() {
        @Volatile var completedStatus: Int?   = null
        @Volatile var readyFired:      Boolean = false

        override fun onTransact(code: Int, data: Parcel, reply: Parcel?, flags: Int): Boolean {
            return try {
                data.enforceInterface(ILEARN_CALLBACK_DESCRIPTOR)
                val status = data.readInt()
                when (code) {
                    CB_LEARN_COMPLETED -> { completedStatus = status; true }
                    CB_LEARN_READY     -> { readyFired = true;        true }
                    else -> super.onTransact(code, data, reply, flags)
                }
            } catch (_: Throwable) {
                false
            }
        }
    }

    // -------------------------------------------------------------------------
    // Instance – learning session
    // -------------------------------------------------------------------------

    @Volatile private var cancelled = false

    /**
     * Checks whether this LG device's UEI service supports IR learning.
     * Corresponds to ISetup.isLearningSupported()Z (TX = 0x30).
     *
     * No session or authKey parameters — confirmed from UeiIrBlasterWrapper$17.smali:
     *   invoke-virtual {p1}, Lcom/uei/control/ISetup;->isLearningSupported()Z
     */
    fun isLearningSupported(): Boolean {
        // isLearningSupported() takes zero parameters beyond the interface token.
        val reply = setupCall(TX_IS_LEARN_SUPPORTED) { } ?: return false
        return try { reply.readInt() != 0 } finally { reply.recycle() }
    }

    /**
     * Blocks the calling thread until:
     *  • A signal is captured → returns [LearnedSignal] (status = 0 means SUCCESS).
     *  • [timeoutMs] elapses → returns null.
     *  • [cancelCheck] returns true or [cancel] is called → returns null.
     *
     * Flow mirrors LG QuickRemote: register callback → start → wait for
     * learnIRCompleted → get data → stop → unregister.
     *
     * Must be called from a background thread.
     */
    fun learn(timeoutMs: Int, cancelCheck: () -> Boolean): LearnedSignal? {
        cancelled = false
        val cb = LearnIrCallback()

        return try {
            // 1. Register the callback.
            // registerLearnIRStatusCallback(ILearnIRStatusCallback) — no session param.
            // Confirmed: UeiIrLearnCallback$3.smali:
            //   invoke-virtual {p1, v0}, ISetup->registerLearnIRStatusCallback(ILearnIRStatusCallback)V
            setupCall(TX_REGISTER_CB) {
                writeStrongBinder(cb)
            }?.recycle()

            // 2. Start IR learning
            val startResult = setupCall(TX_START_LEARNING) {
                writeLong(session)
                writeString(generateAuth())
            }
            val startCode = startResult?.let { r -> try { r.readInt() } finally { r.recycle() } } ?: -1

            if (startCode != 0) {
                Log.w(TAG, "startIRLearning() returned error code $startCode")
                unregisterCallback(cb)
                return null
            }
            Log.i(TAG, "LG IR learning started (timeout=${timeoutMs}ms)")

            // 3. Poll until callback fires or timeout
            val deadline = System.currentTimeMillis() + timeoutMs
            while (System.currentTimeMillis() < deadline) {
                if (cancelled || cancelCheck()) break
                Thread.sleep(100)
                if (cancelled || cancelCheck()) break

                val status = cb.completedStatus
                if (status != null) {
                    if (status != 0) {
                        Log.w(TAG, "learnIRCompleted with error status=$status")
                        stopAndUnregister(cb)
                        return null
                    }
                    // 4. Retrieve the learned data
                    val signal = getLearnedData()
                    stopAndUnregister(cb)
                    if (signal != null) {
                        Log.i(TAG, "LG IR signal captured: ${signal.data.size} bytes id=${signal.id}")
                    }
                    return signal
                }
            }

            // Timeout or cancelled
            Log.i(TAG, "LG IR learning timed out or cancelled")
            stopAndUnregister(cb)
            null
        } catch (t: Throwable) {
            Log.e(TAG, "learn() error: ${t.message}", t)
            try { stopAndUnregister(cb) } catch (_: Throwable) {}
            null
        }
    }

    /** Aborts an in-progress [learn] call. Safe to call from any thread. */
    fun cancel() {
        cancelled = true
    }

    /**
     * Replays a previously learned signal on this LG device.
     * Requires the UEI service to be running (device-locked).
     *
     * Corresponds to IControl.sendIRWithLearnedData(data, id, duration, macromode)
     * via the ISetup interface proxy path used by UEI's own wrapper.
     *
     * @param data       The opaque byte array from [LearnedSignal.data].
     * @param id         The signal id from [LearnedSignal.id].
     * @param duration   Duration hint (default 300 ms, matches IRBlaster.getDefaultDuration()).
     * @param macromode  Whether to play as a macro sequence.
     */
    fun sendLearnedData(
        data: ByteArray,
        id: Int,
        duration: Int = 300,
        macromode: Boolean = false,
    ): Boolean {
        // sendIRWithLearnedData is on IControl, not ISetup.
        // IControl shares the same service; its descriptor and TX codes require
        // a separate binding (UeiIrBlasterInitializer maintains two connections).
        // TODO: bind IControl service for full replay support.
        // For now, log the limitation and return false.
        Log.w(TAG, "sendLearnedData: IControl binding not yet implemented. " +
            "LG learned signals are device-locked and require the UEI service.")
        return false
    }

    // -------------------------------------------------------------------------
    // Instance – private helpers
    // -------------------------------------------------------------------------

    private fun getLearnedData(): LearnedSignal? {
        val reply = setupCall(TX_GET_LEARNED_DATA) {
            writeLong(session)
            writeString(generateAuth())
        } ?: return null
        return try {
            // Standard AIDL Parcelable return protocol:
            //   reply.readInt()          → null-indicator (0 = null result, non-zero = valid)
            // If non-null, LearnedIRData.readFromParcel() follows (LearnedIRData.smali):
            //   readInt()          → Id
            //   createByteArray()  → Data
            val nonNull = reply.readInt()
            if (nonNull == 0) return null
            val id   = reply.readInt()
            val data = reply.createByteArray() ?: return null
            if (data.isEmpty()) return null
            LearnedSignal(data = data, id = id)
        } catch (_: Throwable) {
            null
        } finally {
            reply.recycle()
        }
    }

    private fun stopAndUnregister(cb: LearnIrCallback) {
        setupCall(TX_STOP_LEARNING) {
            writeLong(session)
            writeString(generateAuth())
        }?.recycle()
        unregisterCallback(cb)
    }

    private fun unregisterCallback(cb: LearnIrCallback) {
        // unregisterLearnIRStatusCallback(ILearnIRStatusCallback) — no session param.
        // Confirmed: UeiIrLearnCallback$4.smali:
        //   invoke-virtual {p1, v0}, ISetup->unregisterLearnIRStatusCallback(ILearnIRStatusCallback)V
        setupCall(TX_UNREGISTER_CB) {
            writeStrongBinder(cb)
        }?.recycle()
    }
}
