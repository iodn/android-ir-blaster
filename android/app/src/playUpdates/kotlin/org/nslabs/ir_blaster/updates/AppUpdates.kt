package org.nslabs.ir_blaster.updates

import android.app.Activity
import com.google.android.play.core.appupdate.AppUpdateManagerFactory
import com.google.android.play.core.appupdate.AppUpdateOptions
import com.google.android.play.core.install.model.AppUpdateType
import com.google.android.play.core.install.model.UpdateAvailability
import io.flutter.plugin.common.MethodChannel

/** This source set contains no APK download or package installation code. */
class AppUpdates(private val activity: Activity, private val channel: MethodChannel) {
    private var closed = false
    init {
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "info" -> result.success(environment(activity, true))
                "checkPlay", "startPlay" -> {
                    val manager = AppUpdateManagerFactory.create(activity)
                    manager.appUpdateInfo.addOnSuccessListener { info ->
                        if (closed) return@addOnSuccessListener
                        val available = info.updateAvailability() in listOf(UpdateAvailability.UPDATE_AVAILABLE,
                            UpdateAvailability.DEVELOPER_TRIGGERED_UPDATE_IN_PROGRESS)
                        if (call.method == "checkPlay") {
                            result.success(mapOf("available" to available, "build" to info.availableVersionCode()))
                        } else {
                            try {
                                check(available && info.isUpdateTypeAllowed(AppUpdateType.IMMEDIATE))
                                check(manager.startUpdateFlowForResult(info, activity,
                                    AppUpdateOptions.newBuilder(AppUpdateType.IMMEDIATE).build(), 8230))
                                result.success(null)
                            } catch (e: Exception) { result.error("UPDATE_FAILED", e.message, null) }
                        }
                    }.addOnFailureListener { if (!closed) result.error("UPDATE_FAILED", it.message, null) }
                }
                else -> result.notImplemented()
            }
        }
    }
    fun close() { closed = true; channel.setMethodCallHandler(null) }
}
