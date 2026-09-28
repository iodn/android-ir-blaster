package org.nslabs.ir_blaster

import android.content.Context
import org.json.JSONArray
import org.json.JSONObject

object IrButtonWidgetStore {
    private const val PREFS_NAME = "ir_button_widgets"
    private const val KEY_MAPPINGS = "mappings_v1"
    private const val KEY_PENDING = "pending_v1"

    fun saveMapping(context: Context, appWidgetId: Int, mapping: IrButtonWidgetMapping) {
        if (appWidgetId <= 0) return
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val root = readObject(prefs.getString(KEY_MAPPINGS, null))
        root.put(appWidgetId.toString(), mapping.toJson())
        prefs.edit().putString(KEY_MAPPINGS, root.toString()).apply()
    }

    fun loadMapping(context: Context, appWidgetId: Int): IrButtonWidgetMapping? {
        if (appWidgetId <= 0) return null
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val root = readObject(prefs.getString(KEY_MAPPINGS, null))
        return root.optJSONObject(appWidgetId.toString())?.let { IrButtonWidgetMapping.fromJson(it) }
    }

    fun deleteMapping(context: Context, appWidgetId: Int) {
        if (appWidgetId <= 0) return
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val root = readObject(prefs.getString(KEY_MAPPINGS, null))
        root.remove(appWidgetId.toString())
        prefs.edit().putString(KEY_MAPPINGS, root.toString()).apply()
    }

    fun savePending(context: Context, token: String, mapping: IrButtonWidgetMapping) {
        if (token.isBlank()) return
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val root = readObject(prefs.getString(KEY_PENDING, null))
        root.put(token, mapping.toJson())
        prefs.edit().putString(KEY_PENDING, root.toString()).apply()
    }

    fun popPending(context: Context, token: String): IrButtonWidgetMapping? {
        if (token.isBlank()) return null
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val root = readObject(prefs.getString(KEY_PENDING, null))
        val mapping = root.optJSONObject(token)?.let { IrButtonWidgetMapping.fromJson(it) }
        root.remove(token)
        prefs.edit().putString(KEY_PENDING, root.toString()).apply()
        return mapping
    }

    private fun readObject(raw: String?): JSONObject {
        if (raw.isNullOrBlank()) return JSONObject()
        return try {
            JSONObject(raw)
        } catch (_: Throwable) {
            JSONObject()
        }
    }
}

data class IrButtonWidgetMapping(
    val buttonId: String,
    val title: String,
    val subtitle: String,
    val frequencyHz: Int,
    val pattern: IntArray,
) {
    fun toJson(): JSONObject {
        val arr = JSONArray()
        pattern.forEach { arr.put(it) }
        return JSONObject()
            .put("buttonId", buttonId)
            .put("title", title)
            .put("subtitle", subtitle)
            .put("frequencyHz", frequencyHz)
            .put("pattern", arr)
    }

    companion object {
        fun fromJson(obj: JSONObject): IrButtonWidgetMapping? {
            val buttonId = obj.optString("buttonId", "").trim()
            val frequency = obj.optInt("frequencyHz", 0)
            val arr = obj.optJSONArray("pattern") ?: return null
            if (buttonId.isBlank() || frequency <= 0 || arr.length() == 0) return null
            val pattern = IntArray(arr.length()) { idx -> arr.optInt(idx, 0) }
            if (pattern.any { it <= 0 }) return null
            return IrButtonWidgetMapping(
                buttonId = buttonId,
                title = obj.optString("title", "IR Button"),
                subtitle = obj.optString("subtitle", ""),
                frequencyHz = frequency,
                pattern = pattern,
            )
        }

        fun fromMap(map: Map<*, *>?): IrButtonWidgetMapping? {
            if (map == null) return null
            val buttonId = (map["buttonId"] as? String)?.trim().orEmpty()
            val title = (map["title"] as? String)?.trim().orEmpty()
            val subtitle = (map["subtitle"] as? String)?.trim().orEmpty()
            val frequency = (map["frequencyHz"] as? Number)?.toInt()
                ?: map["frequencyHz"]?.toString()?.toIntOrNull()
                ?: 0
            val rawPattern = map["pattern"] as? List<*> ?: return null
            val pattern = rawPattern.mapNotNull {
                when (it) {
                    is Number -> it.toInt()
                    is String -> it.toIntOrNull()
                    else -> null
                }
            }.filter { it > 0 }.toIntArray()
            if (buttonId.isBlank() || frequency <= 0 || pattern.isEmpty()) return null
            return IrButtonWidgetMapping(
                buttonId = buttonId,
                title = title.ifBlank { "IR Button" },
                subtitle = subtitle,
                frequencyHz = frequency,
                pattern = pattern,
            )
        }
    }
}
