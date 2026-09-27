package org.nslabs.ir_blaster

import android.content.Context
import org.json.JSONObject
import java.io.File
import java.security.MessageDigest

internal class MacroRequestException(val status: String) : RuntimeException(status)

internal object AutomationMacroStore {
    private const val PREFS = "automation_macros"

    private fun source(path: String): String = File(path).let { if (it.exists()) it.readText() else "[]" }
    private fun hash(text: String): String = MessageDigest.getInstance("SHA-256")
        .digest(text.toByteArray(Charsets.UTF_8)).joinToString("") { "%02x".format(it) }

    fun save(context: Context, args: Map<*, *>): Boolean {
        val snapshot = JSONObject()
        for (key in listOf("macros", "remotes")) {
            val path = args["${key}Path"] as String
            val text = args["${key}Source"] as String
            if (source(path) != text) return false
            snapshot.put("${key}Path", path).put("${key}Hash", hash(text))
        }
        snapshot.put("mappings", JSONObject(args["mappings"] as Map<*, *>))
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
            .putString("snapshot", snapshot.toString()).commit()
    }

    fun load(context: Context, id: String): IrButtonWidgetMapping {
        try {
            val text = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString("snapshot", null) ?: throw MacroRequestException("MACROS_NOT_READY")
            val snapshot = JSONObject(text)
            for (key in listOf("macros", "remotes")) {
                if (hash(source(snapshot.getString("${key}Path"))) != snapshot.getString("${key}Hash")) {
                    throw MacroRequestException("MACROS_NOT_READY")
                }
            }
            val mappings = snapshot.getJSONObject("mappings")
            if (!mappings.has(id)) throw MacroRequestException("MACRO_NOT_FOUND")
            val mapping = mappings.optJSONObject(id)?.let { IrButtonWidgetMapping.fromJson(it) }
                ?: throw MacroRequestException("UNSUPPORTED_MACRO")
            if (mapping.manual) throw MacroRequestException("MANUAL_STEPS_UNSUPPORTED")
            return mapping
        } catch (e: MacroRequestException) {
            throw e
        } catch (_: Exception) {
            throw MacroRequestException("MACROS_NOT_READY")
        }
    }
}
