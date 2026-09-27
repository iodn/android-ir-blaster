package org.nslabs.ir_blaster

import android.app.Application
import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Process
import android.os.SystemClock
import android.util.AtomicFile
import org.json.JSONObject
import java.io.File
import java.io.PrintWriter
import java.io.StringWriter
import java.util.Date
import java.util.UUID

internal fun crashReportEmailIntent(address: String, subject: String, text: String): Intent =
    Intent(Intent.ACTION_SENDTO, Uri.parse(
        "mailto:${Uri.encode(address)}?subject=${Uri.encode(subject)}&body=${Uri.encode(text)}"
    ))

/** One bounded report in private storage; never uploaded automatically. */
class CrashReports(private val context: Context) {
    private val startedAt = SystemClock.elapsedRealtime()
    private val file = AtomicFile(File(context.noBackupFilesDir, "crash_report.json"))
    private var previous: Map<String, String>? = read()

    @Synchronized
    fun startSession() {
        // An Activity can reopen after a Flutter failure without a new process.
        previous = read()
    }

    @Synchronized
    fun takePrevious(): Map<String, String>? = previous.also { previous = null }

    @Synchronized
    fun read(): Map<String, String>? {
        return try {
            val report = JSONObject(file.readFully().toString(Charsets.UTF_8))
            mapOf("id" to report.getString("id"), "text" to report.getString("text"))
        } catch (_: Exception) {
            null
        }
    }

    @Synchronized
    fun record(source: String, trace: String) {
        @Suppress("DEPRECATION")
        val info = context.packageManager.getPackageInfo(context.packageName, 0)
        val memory = ActivityManager.MemoryInfo()
        (context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager).getMemoryInfo(memory)
        val runtime = Runtime.getRuntime()
        val emitter = context.getSharedPreferences("ir_blaster_prefs", Context.MODE_PRIVATE)
            .getString("tx_type", "default")
        val report = """
            IR Blaster crash report
            Time: ${Date()}
            App: ${info.versionName} (${androidx.core.content.pm.PackageInfoCompat.getLongVersionCode(info)})
            Device: ${Build.MANUFACTURER} ${Build.MODEL}
            Android: ${Build.VERSION.RELEASE} (API ${Build.VERSION.SDK_INT})
            Security patch: ${Build.VERSION.SECURITY_PATCH}
            OS build: ${Build.DISPLAY}
            Hardware: ${Build.HARDWARE}; device: ${Build.DEVICE}; product: ${Build.PRODUCT}
            ABIs: ${Build.SUPPORTED_ABIS.joinToString()}
            Process: ${if (Process.is64Bit()) "64-bit" else "32-bit"}
            Thread: ${Thread.currentThread().name}
            App uptime (ms): ${SystemClock.elapsedRealtime() - startedAt}
            Heap bytes (used/max): ${runtime.totalMemory() - runtime.freeMemory()}/${runtime.maxMemory()}
            System memory bytes (available/total): ${memory.availMem}/${memory.totalMem}; low: ${memory.lowMemory}
            Emitter preference: $emitter
            Source: $source

        """.trimIndent() + "\n" + trace.take(48000) +
            if (trace.length > 48000) "\n[Report truncated at 48000 characters]" else ""
        val bytes = JSONObject().put("id", UUID.randomUUID().toString())
            .put("text", report).toString().toByteArray(Charsets.UTF_8)
        val stream = file.startWrite()
        try {
            stream.write(bytes)
            file.finishWrite(stream)
        } catch (error: Exception) {
            file.failWrite(stream)
            throw error
        }
    }

    @Synchronized
    fun discard(id: String) {
        // A new failure must not be deleted by an older report's dialog.
        if (read()?.get("id") == id) {
            file.delete()
            check(read() == null)
        }
    }
}

class CrashReportingApplication : Application() {
    lateinit var crashReports: CrashReports
        private set

    override fun onCreate() {
        super.onCreate()
        crashReports = CrashReports(this)
        val previousHandler = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, error ->
            try {
                val trace = StringWriter()
                error.printStackTrace(PrintWriter(trace))
                crashReports.record("Android", trace.toString())
            } catch (_: Throwable) {
                // Reporting must never prevent Android's normal crash handling.
            } finally {
                previousHandler?.uncaughtException(thread, error)
            }
        }
    }
}
