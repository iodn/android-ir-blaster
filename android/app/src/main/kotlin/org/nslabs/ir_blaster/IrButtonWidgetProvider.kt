package org.nslabs.ir_blaster

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.hardware.ConsumerIrManager
import android.hardware.usb.UsbManager
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.widget.RemoteViews
import android.widget.Toast
import java.util.concurrent.atomic.AtomicBoolean

class IrButtonWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(context: Context, manager: AppWidgetManager, appWidgetIds: IntArray) {
        appWidgetIds.forEach { updateWidget(context, manager, it) }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        if (intent.action == Intent.ACTION_MY_PACKAGE_REPLACED) {
            // Replace stale macro service intents with the normal button chooser.
            val manager = AppWidgetManager.getInstance(context)
            onUpdate(context, manager, manager.getAppWidgetIds(
                android.content.ComponentName(context, IrButtonWidgetProvider::class.java)))
            return
        }
        if (intent.action != ACTION_SEND) return
        val appWidgetId = intent.getIntExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, AppWidgetManager.INVALID_APPWIDGET_ID)
        val mapping = IrButtonWidgetStore.loadMapping(context, appWidgetId)
        if (mapping == null) {
            showToast(context, "Widget is not configured.")
            updateWidget(context, AppWidgetManager.getInstance(context), appWidgetId)
            return
        }
        if (!busy.compareAndSet(false, true)) {
            showToast(context, "${mapping.title}: ${AutomationResult.BUSY.name}")
            if (isOrderedBroadcast) setResultCode(AutomationResult.BUSY.code)
            return
        }
        val appContext = context.applicationContext
        val ordered = isOrderedBroadcast
        val deadlineMs = SystemClock.uptimeMillis() + 7000L
        val pending = goAsync()
        fun report(outcome: AutomationResult) {
            if (ordered) pending.setResultCode(outcome.code)
            showToast(appContext, if (outcome == AutomationResult.SENT) "Sent ${mapping.title}"
                else "${mapping.title}: ${outcome.name}")
        }
        try {
            Thread({
                try {
                    val request = AutomationIrRequest.parse(
                        mapping.frequencyHz, mapping.pattern, selectedEmitter(appContext).name,
                    )
                    report(AutomationTransmitter(appContext).transmit(request, deadlineMs))
                } catch (_: RuntimeException) {
                    report(AutomationResult.TRANSMIT_FAILED)
                } finally {
                    busy.set(false)
                    pending.finish()
                }
            }, "ir-home-widget").start()
        } catch (_: RuntimeException) {
            busy.set(false)
            report(AutomationResult.TRANSMIT_FAILED)
            pending.finish()
        }
    }

    override fun onDeleted(context: Context, appWidgetIds: IntArray) {
        appWidgetIds.forEach { IrButtonWidgetStore.deleteMapping(context, it) }
    }

    companion object {
        const val ACTION_SEND = "org.nslabs.irblaster.widget.SEND_BUTTON"
        const val EXTRA_CONFIGURE_WIDGET_ID = "home_widget_configure_id"
        private val busy = AtomicBoolean(false)

        private fun selectedEmitter(context: Context): AutomationEmitter {
            val prefs = context.getSharedPreferences("ir_blaster_prefs", Context.MODE_PRIVATE)
            val selected = AutomationEmitter.valueOf(prefs.getString("tx_type", "INTERNAL") ?: "INTERNAL")
            if (selected == AutomationEmitter.AUDIO_1_LED || selected == AutomationEmitter.AUDIO_2_LED) return selected
            val internalAvailable = context.getSystemService(ConsumerIrManager::class.java)?.hasIrEmitter() == true
            if (!prefs.getBoolean("auto_switch", internalAvailable)) return selected
            val usb = context.getSystemService(UsbManager::class.java)
            val permittedUsb = usb != null && UsbDiscoveryManager(context, usb).scanSupported().any { usb.hasPermission(it) }
            return if (permittedUsb) AutomationEmitter.USB else AutomationEmitter.INTERNAL
        }

        fun updateWidget(context: Context, manager: AppWidgetManager, appWidgetId: Int) {
            if (appWidgetId == AppWidgetManager.INVALID_APPWIDGET_ID) return
            val mapping = IrButtonWidgetStore.loadMapping(context, appWidgetId)
            val views = RemoteViews(context.packageName, R.layout.ir_button_widget)
            if (mapping == null) {
                views.setTextViewText(R.id.ir_button_widget_title, "IR Button")
                views.setTextViewText(R.id.ir_button_widget_subtitle, "Tap to choose")
                views.setImageViewResource(R.id.ir_button_widget_icon, R.drawable.ic_dc_generic)
                views.setOnClickPendingIntent(
                    R.id.ir_button_widget_root,
                    PendingIntent.getActivity(
                        context,
                        appWidgetId,
                        Intent(context, MainActivity::class.java).apply {
                            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
                            putExtra(EXTRA_CONFIGURE_WIDGET_ID, appWidgetId)
                        },
                        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
                    ),
                )
            } else {
                views.setTextViewText(R.id.ir_button_widget_title, mapping.title.ifBlank { "IR Button" })
                views.setTextViewText(R.id.ir_button_widget_subtitle, mapping.subtitle.ifBlank { "Tap to send" })
                views.setImageViewResource(R.id.ir_button_widget_icon, iconForTitle(mapping.title))
                views.setOnClickPendingIntent(
                    R.id.ir_button_widget_root,
                    PendingIntent.getBroadcast(
                        context,
                        appWidgetId,
                        Intent(context, IrButtonWidgetProvider::class.java).apply {
                            action = ACTION_SEND
                            putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
                        },
                        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
                    ),
                )
            }
            manager.updateAppWidget(appWidgetId, views)
        }

        private fun iconForTitle(title: String): Int {
            val s = buildString {
                title.forEach { c -> if (c.isLetterOrDigit()) append(c.uppercaseChar()) }
            }
            return when {
                s.contains("POWER") || s == "PWR" || s == "ONOFF" || s == "OFFON" -> R.drawable.ic_dc_power
                s.contains("MUTE") || s == "MUT" -> R.drawable.ic_dc_mute
                s.contains("VOLUP") || s.contains("VOLUMEUP") || s.contains("VOL+") || s.contains("VOLUME+") -> R.drawable.ic_dc_volume_up
                s.contains("VOLDOWN") || s.contains("VOLUMEDOWN") || s.contains("VOL-") || s.contains("VOLUME-") -> R.drawable.ic_dc_volume_down
                else -> R.drawable.ic_dc_generic
            }
        }

        private fun showToast(context: Context, message: String) {
            Handler(Looper.getMainLooper()).post {
                Toast.makeText(context.applicationContext, message, Toast.LENGTH_SHORT).show()
            }
        }
    }
}
