package org.nslabs.ir_blaster

import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.drawable.Icon
import android.hardware.ConsumerIrManager
import android.os.Handler
import android.os.Looper
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import android.widget.Toast
import org.json.JSONObject

abstract class BaseQuickTileService : TileService() {
    abstract val tileKey: String
    abstract val defaultLabel: String
    abstract val iconRes: Int

    override fun onStartListening() {
        super.onStartListening()
        updateTileState()
    }

    override fun onClick() {
        super.onClick()
        val mapping = loadMapping(this, tileKey)
        if (mapping != null && mapping.buttonId.isNotBlank() && mapping.pattern.isNotEmpty() && mapping.frequencyHz > 0) {
            sendMapping(mapping)
            return
        }
        openChooser()
    }

    private fun openChooser() {
        val intent = Intent(this, MainActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            putExtra(EXTRA_TILE_KEY, tileKey)
        }
        val pending = PendingIntent.getActivity(
            this,
            tileKey.hashCode(),
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        try {
            startActivityAndCollapse(pending)
        } catch (_: Throwable) {
            try {
                startActivity(intent)
            } catch (_: Throwable) {
            }
        }
    }

    private fun sendMapping(mapping: Mapping) {
        val freq = mapping.frequencyHz
        val pattern = mapping.pattern
        if (freq <= 0 || pattern.isEmpty()) {
            showToast("Quick tile not configured.")
            return
        }
        Thread {
            val mgr = getSystemService(ConsumerIrManager::class.java)
            val ok = InternalIrTransmitter(mgr).transmitRaw(freq, pattern)
            if (!ok) {
                showToast("Internal IR transmitter unavailable.")
            }
        }.start()
    }

    private fun showToast(message: String) {
        Handler(Looper.getMainLooper()).post {
            Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
        }
    }

    private fun updateTileState() {
        val t = qsTile ?: return
        val mapping = loadMapping(this, tileKey)
        val label = if (mapping == null || mapping.title.isBlank()) {
            defaultLabel
        } else if (mapping.subtitle.isNotBlank()) {
            "${mapping.title} · ${mapping.subtitle}"
        } else {
            mapping.title
        }
        t.label = label
        t.icon = Icon.createWithResource(this, iconRes)
        t.state = if (mapping == null) Tile.STATE_INACTIVE else Tile.STATE_ACTIVE
        t.updateTile()
    }

    data class Mapping(
        val buttonId: String,
        val title: String,
        val subtitle: String,
        val frequencyHz: Int,
        val pattern: IntArray,
    )

    companion object {
        private const val PREFS_NAME = "FlutterSharedPreferences"
        private const val PREFIX = "flutter.quick_settings_tile_"
        const val EXTRA_TILE_KEY = "quick_tile_key"

        fun loadMapping(ctx: Context, key: String): Mapping? {
            val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val raw = prefs.getString(PREFIX + key, null) ?: return null
            return try {
                val obj = JSONObject(raw)
                val id = obj.optString("buttonId", "")
                if (id.isBlank()) return null
                val freq = obj.optInt("frequencyHz", 0)
                val arr = obj.optJSONArray("pattern")
                val pattern = if (arr != null) {
                    val out = IntArray(arr.length())
                    for (i in 0 until arr.length()) {
                        out[i] = arr.optInt(i, 0)
                    }
                    out
                } else {
                    IntArray(0)
                }
                Mapping(
                    buttonId = id,
                    title = obj.optString("title", ""),
                    subtitle = obj.optString("subtitle", ""),
                    frequencyHz = freq,
                    pattern = pattern,
                )
            } catch (_: Throwable) {
                null
            }
        }
    }
}

class PowerTileService : BaseQuickTileService() {
    override val tileKey = "power"
    override val defaultLabel = "Power"
    override val iconRes = R.drawable.ic_qs_power
}

class MuteTileService : BaseQuickTileService() {
    override val tileKey = "mute"
    override val defaultLabel = "Mute"
    override val iconRes = R.drawable.ic_qs_mute
}

class VolumeUpTileService : BaseQuickTileService() {
    override val tileKey = "volumeUp"
    override val defaultLabel = "Vol +"
    override val iconRes = R.drawable.ic_qs_vol_up
}

class VolumeDownTileService : BaseQuickTileService() {
    override val tileKey = "volumeDown"
    override val defaultLabel = "Vol -"
    override val iconRes = R.drawable.ic_qs_vol_down
}
