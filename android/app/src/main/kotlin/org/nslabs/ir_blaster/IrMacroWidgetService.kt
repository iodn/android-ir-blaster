package org.nslabs.ir_blaster

import android.app.*
import android.appwidget.AppWidgetManager
import android.content.Intent
import android.content.Context
import android.content.pm.ServiceInfo
import android.os.*
import android.widget.Toast
import androidx.core.app.NotificationCompat
import java.util.concurrent.atomic.AtomicBoolean

/** A null result means cancelled. Validate every send before executing any step. */
internal fun executeWidgetMacro(
    steps: List<WidgetMacroStep>, emitter: AutomationEmitter,
    cancelled: () -> Boolean,
    send: (AutomationIrRequest) -> AutomationResult,
    pause: (Long) -> Unit = { Thread.sleep(it) },
): AutomationResult? {
    val requests = steps.map {
        if (it.delayMs != null) null else AutomationIrRequest.parse(it.frequencyHz, it.pattern, emitter.name)
    }
    for ((index, step) in steps.withIndex()) {
        if (cancelled()) return null
        if (step.delayMs != null) pause(step.delayMs)
        else {
            val result = send(requests[index]!!)
            if (result != AutomationResult.SENT) return result
        }
    }
    return if (cancelled()) null else AutomationResult.SENT
}

class IrMacroWidgetService : Service() {
    private var worker: Thread? = null
    private var widgetId = AppWidgetManager.INVALID_APPWIDGET_ID
    private val cancelled = AtomicBoolean(false)
    private val main = Handler(Looper.getMainLooper())

    override fun onBind(intent: Intent?) = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val automation = intent?.action == IrAutomationReceiver.ACTION_RUN_MACRO
        if (automation) automationPending.set(false)
        if (intent?.action == ACTION_STOP) {
            cancelled.set(true)
            worker?.interrupt()
            if (worker == null) stopSelf()
            return START_NOT_STICKY
        }
        val id = intent?.getIntExtra(AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID) ?: AppWidgetManager.INVALID_APPWIDGET_ID
        if (worker != null) {
            if (!automation && id == widgetId) {
                cancelled.set(true)
                worker?.interrupt()
            }
            return START_NOT_STICKY
        }
        val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        val mapping = if (automation) {
            try {
                if (!prefs.getBoolean(IrAutomationReceiver.PREF_ENABLED, false)) {
                    stopSelf()
                    return START_NOT_STICKY
                }
                AutomationMacroStore.load(this, intent!!.getStringExtra("macro_id") ?: "")
            } catch (_: MacroRequestException) {
                stopSelf()
                return START_NOT_STICKY
            }
        } else IrButtonWidgetStore.loadMapping(this, id)
        if (mapping?.macroId == null || mapping.manual) {
            stopSelf()
            return START_NOT_STICKY
        }
        try {
            val manager = getSystemService(NotificationManager::class.java)
            if (Build.VERSION.SDK_INT >= 26) manager.createNotificationChannel(
                NotificationChannel(CHANNEL, mapping.labels.getValue("running"), NotificationManager.IMPORTANCE_LOW))
            val stop = PendingIntent.getService(this, id,
                Intent(this, IrMacroWidgetService::class.java).setAction(ACTION_STOP),
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
            val notification = NotificationCompat.Builder(this, CHANNEL)
                .setSmallIcon(R.drawable.ic_dc_generic)
                .setContentTitle(mapping.title)
                .setContentText(mapping.labels.getValue("running"))
                .setOngoing(true).setOnlyAlertOnce(true)
                .addAction(0, mapping.labels.getValue("stop"), stop).build()
            if (Build.VERSION.SDK_INT >= 29) startForeground(NOTIFICATION_ID, notification,
                ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE)
            else startForeground(NOTIFICATION_ID, notification)
        } catch (_: RuntimeException) {
            Toast.makeText(this, mapping.labels.getValue("failed"), Toast.LENGTH_LONG).show()
            stopSelf()
            return START_NOT_STICKY
        }
        if (!IrButtonWidgetProvider.busy.compareAndSet(false, true)) {
            Toast.makeText(this, mapping.labels.getValue("running"), Toast.LENGTH_SHORT).show()
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
            return START_NOT_STICKY
        }
        widgetId = id
        cancelled.set(false)
        worker = Thread({
            var wake: PowerManager.WakeLock? = null
            var result: AutomationResult? = AutomationResult.TRANSMIT_FAILED
            try {
                wake = getSystemService(PowerManager::class.java)
                    .newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "$packageName:macro-widget")
                wake.acquire(mapping.steps.sumOf { it.delayMs ?: 7000L } + 10000L)
                val emitter = if (automation) AutomationEmitter.valueOf(intent!!.getStringExtra("emitter") ?: "INTERNAL")
                    else IrButtonWidgetProvider.selectedEmitter(this)
                val transmitter = AutomationTransmitter(applicationContext)
                fun shouldStop(): Boolean = cancelled.get() || (automation &&
                    !prefs.getBoolean(IrAutomationReceiver.PREF_ENABLED, false))
                result = executeWidgetMacro(mapping.steps, emitter, { shouldStop() },
                    { transmitter.transmit(it, SystemClock.uptimeMillis() + 7000L) },
                    { delay ->
                        val until = SystemClock.elapsedRealtime() + delay
                        do {
                            if (shouldStop()) throw InterruptedException()
                            val remaining = until - SystemClock.elapsedRealtime()
                            if (remaining <= 0) break
                            Thread.sleep(minOf(remaining, 100L))
                        } while (true)
                    })
            } catch (_: InterruptedException) {
                result = null
            } catch (_: RuntimeException) {
                result = AutomationResult.TRANSMIT_FAILED
            } finally {
                try { if (wake?.isHeld == true) wake.release() } catch (_: RuntimeException) { }
                IrButtonWidgetProvider.busy.set(false)
                val text = mapping.labels.getValue(if (cancelled.get() || result == null) "cancelled"
                    else if (result == AutomationResult.SENT) "completed" else "failed")
                main.post {
                    Toast.makeText(applicationContext, "${mapping.title}: $text", Toast.LENGTH_LONG).show()
                    worker = null
                    stopForeground(STOP_FOREGROUND_REMOVE)
                    stopSelf()
                }
            }
        }, "ir-macro-widget")
        try { worker!!.start() } catch (_: RuntimeException) {
            worker = null
            IrButtonWidgetProvider.busy.set(false)
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
        }
        return START_NOT_STICKY
    }

    override fun onDestroy() {
        cancelled.set(true)
        worker?.interrupt()
        super.onDestroy()
    }

    companion object {
        internal val automationPending = AtomicBoolean(false)
        private const val CHANNEL = "ir_macro_widgets"
        private const val NOTIFICATION_ID = 7301
        private const val ACTION_STOP = "org.nslabs.irblaster.widget.STOP_MACRO"
        const val EXTRA_MACRO_WIDGET_ID = "macro_widget_id"
    }
}
