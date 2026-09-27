package org.nslabs.ir_blaster

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.SystemClock
import android.os.Build
import android.util.Log

class IrAutomationReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != ACTION_TRANSMIT && intent.action != ACTION_RUN_MACRO) return
        val prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        if (!prefs.getBoolean(PREF_ENABLED, false)) {
            reply(DISABLED, "DISABLED")
            return
        }
        if (intent.action == ACTION_RUN_MACRO) {
            runMacro(context, intent)
            return
        }
        val request = try {
            @Suppress("DEPRECATION")
            AutomationIrRequest.parse(intent.extras?.get("frequency"), intent.extras?.get("pattern"), intent.extras?.get("emitter"))
        } catch (e: RuntimeException) {
            reply(BAD_REQUEST, "BAD_REQUEST")
            return
        }
        // No unbounded work queue: automation must wait before sending again.
        if (IrMacroWidgetService.automationPending.get() || !busy.compareAndSet(false, true)) {
            reply(BUSY, "BUSY")
            return
        }
        val ordered = isOrderedBroadcast
        val deadlineMs = SystemClock.uptimeMillis() + 7000L
        val pending = goAsync()
        fun complete(code: Int, message: String) {
            Log.i(TAG, message)
            if (ordered) pending.setResult(code, message, null)
        }
        try {
            Thread({
                try {
                    if (!prefs.getBoolean(PREF_ENABLED, false)) {
                        complete(DISABLED, "DISABLED")
                    } else {
                        val outcome = AutomationTransmitter(context).transmit(request, deadlineMs)
                        complete(outcome.code, outcome.name)
                    }
                } catch (e: RuntimeException) {
                    complete(FAILED, "TRANSMIT_FAILED")
                } finally {
                    busy.set(false)
                    pending.finish()
                }
            }, "ir-automation").start()
        } catch (e: RuntimeException) {
            busy.set(false)
            complete(FAILED, "TRANSMIT_FAILED")
            pending.finish()
        }
    }

    private fun runMacro(context: Context, intent: Intent) {
        val id: String
        val emitter: AutomationEmitter
        try {
            id = intent.getStringExtra("macro_id") ?: throw IllegalArgumentException()
            require(id.isNotBlank() && id.length <= 512)
            @Suppress("DEPRECATION")
            val extra = intent.extras?.get("emitter")
            emitter = if (extra == null) AutomationEmitter.INTERNAL else AutomationEmitter.valueOf(extra as String)
        } catch (_: RuntimeException) {
            reply(BAD_REQUEST, "BAD_REQUEST")
            return
        }
        if (busy.get() || !IrMacroWidgetService.automationPending.compareAndSet(false, true)) {
            reply(BUSY, "BUSY")
            return
        }
        val ordered = isOrderedBroadcast
        val pending = goAsync()
        fun finish(code: Int, message: String) {
            Log.i(TAG, message)
            if (ordered) pending.setResult(code, message, null)
        }
        try {
            Thread({
                var launched = false
                try {
                    val mapping = AutomationMacroStore.load(context, id)
                    // Reject incompatible signals before any part of the macro runs.
                    mapping.steps.filter { it.delayMs == null }.forEach {
                        AutomationIrRequest.parse(it.frequencyHz, it.pattern, emitter.name)
                    }
                    if (!context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
                            .getBoolean(PREF_ENABLED, false)) {
                        finish(DISABLED, "DISABLED")
                    } else if (busy.get()) {
                        finish(BUSY, "BUSY")
                    } else {
                        val service = Intent(context, IrMacroWidgetService::class.java)
                            .setAction(ACTION_RUN_MACRO).putExtra("macro_id", id)
                            .putExtra("emitter", emitter.name)
                        if (Build.VERSION.SDK_INT >= 26) context.startForegroundService(service)
                        else context.startService(service)
                        launched = true
                        finish(0, "START_REQUESTED")
                    }
                } catch (e: MacroRequestException) {
                    finish(MACRO_UNAVAILABLE, e.status)
                } catch (_: IllegalArgumentException) {
                    finish(BAD_REQUEST, "BAD_REQUEST")
                } catch (_: IllegalStateException) {
                    finish(BACKGROUND_RESTRICTED, "BACKGROUND_RESTRICTED")
                } catch (_: SecurityException) {
                    finish(BACKGROUND_RESTRICTED, "BACKGROUND_RESTRICTED")
                } catch (_: RuntimeException) {
                    finish(FAILED, "MACRO_START_FAILED")
                } finally {
                    if (!launched) IrMacroWidgetService.automationPending.set(false)
                    pending.finish()
                }
            }, "ir-automation-macro").start()
        } catch (_: RuntimeException) {
            IrMacroWidgetService.automationPending.set(false)
            finish(FAILED, "MACRO_START_FAILED")
            pending.finish()
        }
    }

    private fun reply(code: Int, message: String) {
        Log.i(TAG, message)
        if (isOrderedBroadcast) setResult(code, message, null)
    }

    companion object {
        const val ACTION_TRANSMIT = "org.irblaster.TRANSMIT"
        const val ACTION_RUN_MACRO = "org.irblaster.RUN_MACRO"
        const val MACRO_UNAVAILABLE = 15
        const val BACKGROUND_RESTRICTED = 16
        const val PREF_ENABLED = "flutter.automation_broadcasts_enabled_v1"
        const val DISABLED = 1
        const val BAD_REQUEST = 2
        const val BUSY = 3
        const val NO_IR = 4
        const val FAILED = 5
        private const val TAG = "IrAutomation"
        private val busy get() = IrButtonWidgetProvider.busy
    }
}
