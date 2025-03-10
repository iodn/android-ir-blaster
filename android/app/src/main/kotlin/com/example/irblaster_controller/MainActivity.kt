package org.nslabs.ir_blaster

import android.content.Context
import android.hardware.ConsumerIrManager
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "org.nslabs/irtransmitter"
    private var irManager: ConsumerIrManager? = null

    @RequiresApi(VERSION_CODES.O)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        irManager = getSystemService(Context.CONSUMER_IR_SERVICE) as? ConsumerIrManager
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when(call.method) {
                "transmit" -> {
                    // This is for hex (NEC) transmissions
                    val list = call.argument<ArrayList<Int>>("list")
                    if (irManager == null) {
                        result.success(null)
                    } else if (list == null) {
                        result.error("NOPATTERN", "No pattern given", null)
                    } else {
                        // Using default frequency for hex codes (38028)
                        irManager?.transmit(38028, list.toIntArray())
                        result.success(null)
                    }
                }
                "transmitRaw" -> {
                    // This branch is for raw transmissions.
                    val list = call.argument<ArrayList<Int>>("list")
                    val frequency = call.argument<Int>("frequency")
                    if (irManager == null) {
                        result.success(null)
                    } else if (list == null || frequency == null) {
                        result.error("NOPATTERN", "No pattern or frequency given", null)
                    } else {
                        irManager?.transmit(frequency, list.toIntArray())
                        result.success(null)
                    }
                }
                "hasIrEmitter" -> {
                    result.success(irManager?.hasIrEmitter() ?: false)
                }
                else -> result.notImplemented()
            }
        }
    }
}
