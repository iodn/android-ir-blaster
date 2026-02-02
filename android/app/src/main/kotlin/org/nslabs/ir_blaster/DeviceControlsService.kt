package org.nslabs.ir_blaster

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.drawable.Icon
import android.os.Build
import android.service.controls.Control
import android.service.controls.ControlsProviderService
import android.service.controls.actions.ControlAction
import android.service.controls.templates.ControlTemplate
import android.service.controls.templates.StatelessTemplate
import androidx.annotation.RequiresApi
import org.json.JSONArray
import org.json.JSONObject
import java.util.concurrent.Flow

@RequiresApi(Build.VERSION_CODES.R)
class DeviceControlsService : ControlsProviderService() {
    override fun createPublisherForAllAvailable(): Flow.Publisher<Control> {
        val items = loadFavorites(this)
        val controls = if (items.isEmpty()) {
            listOf(buildAppControl())
        } else {
            items.map { buildControl(it) }
        }
        return SimplePublisher(controls)
    }

    override fun createPublisherFor(controlIds: MutableList<String>): Flow.Publisher<Control> {
        val items = loadFavorites(this)
        val byId = items.associateBy { controlIdFor(it.buttonId) }
        val controls = ArrayList<Control>()
        controlIds.forEach { id ->
            if (id == CONTROL_APP_ID) {
                controls.add(buildAppControl())
            } else {
                val item = byId[id]
                if (item != null) controls.add(buildControl(item))
            }
        }
        return SimplePublisher(controls)
    }

    override fun performControlAction(controlId: String, action: ControlAction, consumer: java.util.function.Consumer<Int>) {
        if (controlId == CONTROL_APP_ID) {
            val intent = Intent(this, MainActivity::class.java).apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            }
            startActivity(intent)
            consumer.accept(ControlAction.RESPONSE_OK)
            return
        }
        val buttonId = parseButtonId(controlId) ?: run {
            consumer.accept(ControlAction.RESPONSE_FAIL)
            return
        }
        val intent = Intent(this, MainActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            putExtra(EXTRA_CONTROL_BUTTON_ID, buttonId)
        }
        startActivity(intent)
        consumer.accept(ControlAction.RESPONSE_OK)
    }

    private fun buildControl(item: ControlFavorite): Control {
        val pendingIntent = PendingIntent.getActivity(
            this,
            item.buttonId.hashCode(),
            Intent(this, MainActivity::class.java).apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
                putExtra(EXTRA_CONTROL_BUTTON_ID, item.buttonId)
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val iconRes = iconForTitle(item.title)
        return Control.StatelessBuilder(controlIdFor(item.buttonId), pendingIntent)
            .setTitle(item.title.ifEmpty { "IR Button" })
            .setSubtitle(item.subtitle)
            .setDeviceType(0)
            .setCustomIcon(Icon.createWithResource(this, iconRes))
            .build()
    }

    private fun buildAppControl(): Control {
        val pendingIntent = PendingIntent.getActivity(
            this,
            CONTROL_APP_ID.hashCode(),
            Intent(this, MainActivity::class.java).apply {
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        return Control.StatelessBuilder(CONTROL_APP_ID, pendingIntent)
            .setTitle("IR Blaster")
            .setSubtitle("Open app to add favorites")
            .setDeviceType(0)
            .setCustomIcon(Icon.createWithResource(this, R.drawable.ic_dc_generic))
            .build()
    }

    companion object {
        private const val PREFS_NAME = "FlutterSharedPreferences"
        private const val PREFS_KEY = "flutter.device_controls_favorites_v1"
        private const val CONTROL_PREFIX = "irbtn:"
        private const val CONTROL_APP_ID = "irblaster_app"
        const val EXTRA_CONTROL_BUTTON_ID = "control_button_id"

        fun controlIdFor(buttonId: String): String = "$CONTROL_PREFIX$buttonId"

        fun parseButtonId(controlId: String): String? {
            if (!controlId.startsWith(CONTROL_PREFIX)) return null
            return controlId.removePrefix(CONTROL_PREFIX).takeIf { it.isNotBlank() }
        }

        fun loadFavorites(ctx: Context): List<ControlFavorite> {
            val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val raw = prefs.getString(PREFS_KEY, null) ?: return emptyList()
            val out = ArrayList<ControlFavorite>()
            try {
                val arr = JSONArray(raw)
                for (i in 0 until arr.length()) {
                    val obj = arr.optJSONObject(i) ?: continue
                    val buttonId = obj.optString("buttonId", "")
                    if (buttonId.isBlank()) continue
                    out.add(
                        ControlFavorite(
                            buttonId = buttonId,
                            title = obj.optString("title", ""),
                            subtitle = obj.optString("subtitle", "")
                        )
                    )
                }
            } catch (_: Throwable) {
            }
            return out
        }
    }

    private fun iconForTitle(title: String): Int {
        val s = normalize(title)
        return when {
            s.contains("POWER") || s == "PWR" || s == "ONOFF" || s == "OFFON" -> R.drawable.ic_dc_power
            s.contains("MUTE") || s == "MUT" -> R.drawable.ic_dc_mute
            s.contains("VOLUP") || s.contains("VOLUMEUP") || s.contains("VOL+") || s.contains("VOLUME+") -> R.drawable.ic_dc_volume_up
            s.contains("VOLDOWN") || s.contains("VOLUMEDOWN") || s.contains("VOL-") || s.contains("VOLUME-") -> R.drawable.ic_dc_volume_down
            else -> R.drawable.ic_dc_generic
        }
    }

    private fun normalize(raw: String): String {
        if (raw.isBlank()) return ""
        val sb = StringBuilder()
        for (c in raw) {
            if (c.isLetterOrDigit()) sb.append(c.uppercaseChar())
        }
        return sb.toString()
    }
}

data class ControlFavorite(
    val buttonId: String,
    val title: String,
    val subtitle: String,
)

private class SimplePublisher(private val items: List<Control>) : Flow.Publisher<Control> {
    override fun subscribe(subscriber: Flow.Subscriber<in Control>) {
        val sub = object : Flow.Subscription {
            private var cancelled = false
            private var sent = false

            override fun request(n: Long) {
                if (cancelled || sent) return
                sent = true
                if (n <= 0) {
                    subscriber.onError(IllegalArgumentException("n must be > 0"))
                    return
                }
                for (c in items) {
                    if (cancelled) return
                    subscriber.onNext(c)
                }
                if (!cancelled) subscriber.onComplete()
            }

            override fun cancel() {
                cancelled = true
            }
        }
        subscriber.onSubscribe(sub)
    }
}
