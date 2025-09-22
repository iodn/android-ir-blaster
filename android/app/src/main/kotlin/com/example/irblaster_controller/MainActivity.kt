package org.nslabs.ir_blaster

import android.content.Context
import android.hardware.ConsumerIrManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "org.nslabs/irtransmitter"
        private const val DEFAULT_HEX_FREQUENCY = 38000
        private const val MIN_IR_HZ = 15000
        private const val MAX_IR_HZ = 60000
    }

    private var irManager: ConsumerIrManager? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        irManager = applicationContext.getSystemService(Context.CONSUMER_IR_SERVICE) as? ConsumerIrManager

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "transmit" -> handleTransmit(call, result)
                    "transmitRaw" -> handleTransmitRaw(call, result)
                    "hasIrEmitter" -> result.success(irManager?.hasIrEmitter() ?: false)
                    // Non-breaking: expose supported IR frequency ranges to Flutter if needed.
                    "getSupportedFrequencies" -> handleGetSupportedFrequencies(result)
                    else -> result.notImplemented()
                }
            }
    }

    private fun handleTransmit(call: MethodCall, result: MethodChannel.Result) {
        val pattern = call.argument<List<Int>>("list")
        val mgr = irManager

        if (mgr == null) {
            result.error("NO_IR", "IR emitter not available", null)
            return
        }
        if (pattern == null) {
            result.error("NO_PATTERN", "No pattern provided", null)
            return
        }
        if (!validatePattern(pattern)) {
            result.error("BAD_PATTERN", "All durations must be > 0 µs", null)
            return
        }

        try {
            mgr.transmit(DEFAULT_HEX_FREQUENCY, pattern.toIntArray())
            result.success(null)
        } catch (iae: IllegalArgumentException) {
            result.error("TX_ILLEGAL_ARG", "Transmit failed: ${iae.message}", null)
        } catch (t: Throwable) {
            result.error("TX_ERROR", "Transmit failed: ${t.message}", null)
        }
    }

    private fun handleTransmitRaw(call: MethodCall, result: MethodChannel.Result) {
        val pattern = call.argument<List<Int>>("list")
        val frequency = call.argument<Int>("frequency")
        val mgr = irManager

        if (mgr == null) {
            result.error("NO_IR", "IR emitter not available", null)
            return
        }
        if (pattern == null || frequency == null) {
            result.error("NO_PATTERN_OR_FREQUENCY", "No pattern or frequency provided", null)
            return
        }
        if (!validatePattern(pattern)) {
            result.error("BAD_PATTERN", "All durations must be > 0 µs", null)
            return
        }

        // Clamp frequency into a reasonable IR range without failing the call.
        val safeFreq = frequency.coerceIn(MIN_IR_HZ, MAX_IR_HZ)

        try {
            mgr.transmit(safeFreq, pattern.toIntArray())
            result.success(null)
        } catch (iae: IllegalArgumentException) {
            result.error("TX_ILLEGAL_ARG", "Transmit failed: ${iae.message}", null)
        } catch (t: Throwable) {
            result.error("TX_ERROR", "Transmit failed: ${t.message}", null)
        }
    }

    private fun handleGetSupportedFrequencies(result: MethodChannel.Result) {
        val mgr = irManager
        if (mgr == null) {
            result.success(emptyList<List<Int>>())
            return
        }

        // Reflection avoids platform type issues on some OEM stubs.
        val ranges: IntArray? = try {
            val method = ConsumerIrManager::class.java.getMethod("getCarrierFrequencies")
            val value = method.invoke(mgr)
            when (value) {
                is IntArray -> value
                is Array<*> -> {
                    val out = IntArray(value.size)
                    for (i in value.indices) {
                        out[i] = (value[i] as? Number)?.toInt() ?: 0
                    }
                    out
                }
                else -> null
            }
        } catch (_: Throwable) {
            null
        }

        if (ranges == null || ranges.isEmpty()) {
            result.success(emptyList<List<Int>>())
            return
        }

        val pairs = ArrayList<List<Int>>(ranges.size / 2)
        var i = 0
        while (i + 1 < ranges.size) {
            pairs.add(listOf(ranges[i], ranges[i + 1]))
            i += 2
        }
        result.success(pairs)
    }

    private fun validatePattern(pattern: List<Int>): Boolean {
        if (pattern.isEmpty()) return false
        for (v in pattern) if (v <= 0) return false
        return true
    }

    // Convert List<Int> to IntArray safely (avoids platform array pitfalls).
    private fun List<Int>.toIntArray(): IntArray {
        val out = IntArray(this.size)
        for (i in indices) out[i] = this[i]
        return out
    }
}
