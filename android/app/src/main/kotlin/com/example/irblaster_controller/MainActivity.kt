package org.nslabs.ir_blaster

import android.content.Context
import android.hardware.ConsumerIrManager
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object {
        private const val CHANNEL = "org.nslabs/irtransmitter"
        private const val DEFAULT_HEX_FREQUENCY = 38028
    }

    private var irManager: ConsumerIrManager? = null

    @RequiresApi(VERSION_CODES.O)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        irManager = getSystemService(Context.CONSUMER_IR_SERVICE) as? ConsumerIrManager
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "transmit" -> handleTransmit(call, result)
                    "transmitRaw" -> handleTransmitRaw(call, result)
                    "hasIrEmitter" -> result.success(irManager?.hasIrEmitter() ?: false)
                    else -> result.notImplemented()
                }
            }
    }

    private fun handleTransmit(call: MethodCall, result: MethodChannel.Result) {
        val pattern = call.argument<List<Int>>("list")
        if (irManager == null) {
            result.error("NO_IR", "IR emitter not available", null)
            return
        }
        if (pattern == null) {
            result.error("NO_PATTERN", "No pattern provided", null)
            return
        }
        irManager?.transmit(DEFAULT_HEX_FREQUENCY, pattern.toIntArray())
        result.success(null)
    }

    private fun handleTransmitRaw(call: MethodCall, result: MethodChannel.Result) {
        val pattern = call.argument<List<Int>>("list")
        val frequency = call.argument<Int>("frequency")
        if (irManager == null) {
            result.error("NO_IR", "IR emitter not available", null)
            return
        }
        if (pattern == null || frequency == null) {
            result.error("NO_PATTERN_OR_FREQUENCY", "No pattern or frequency provided", null)
            return
        }
        irManager?.transmit(frequency, pattern.toIntArray())
        result.success(null)
    }
}
