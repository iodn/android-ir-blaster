package org.nslabs.ir_blaster.updates

import android.app.Activity
import android.content.ClipData
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import androidx.core.content.FileProvider
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject
import java.io.File
import java.net.URL
import java.security.MessageDigest
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicBoolean
import java.util.zip.ZipFile
import javax.net.ssl.HttpsURLConnection

class UpdateFileProvider : FileProvider()

internal const val MAX_APK_BYTES = 150L * 1024 * 1024
internal fun validAssetUrl(url: URL, redirect: Boolean = false): Boolean =
    url.protocol == "https" && url.userInfo == null && url.port in listOf(-1, 443) &&
        ((url.host == "github.com" && url.path.startsWith("/iodn/android-ir-blaster/releases/download/")) ||
            (redirect && url.host == "release-assets.githubusercontent.com"))

internal fun requireCompatibleUpdate(current: android.content.pm.PackageInfo,
    candidate: android.content.pm.PackageInfo, expectedVersion: String, sdk: Int) {
    require(candidate.packageName == current.packageName)
    require(versionCode(candidate) > versionCode(current))
    require(candidate.versionName?.substringBefore('+') == expectedVersion.substringBefore('+'))
    require((candidate.applicationInfo?.minSdkVersion ?: Int.MAX_VALUE) <= sdk)
    require(signers(current).isNotEmpty() && signers(candidate) == signers(current))
}

class AppUpdates(private val activity: Activity, private val channel: MethodChannel) {
    private val worker = Executors.newSingleThreadExecutor()
    private val main = Handler(Looper.getMainLooper())
    private val busy = AtomicBoolean(false)
    private val cancelled = AtomicBoolean(false)
    @Volatile private var connection: HttpsURLConnection? = null
    @Volatile private var closed = false
    private val root = File(activity.cacheDir, "app_updates")
    private val apk = File(root, "apks/update.apk")
    private val metadata = File(root, "release.json")

    private fun allowed() = environment(activity, false)["source"] in listOf("github", "unknown")
    private fun permission() = Build.VERSION.SDK_INT < 26 || activity.packageManager.canRequestPackageInstalls()
    private fun ready(): Boolean = try {
        allowed() && apk.exists() && metadata.exists() &&
            JSONObject(metadata.readText()).getLong("versionCode") > versionCode(installed(activity))
    } catch (_: Exception) { false }

    init {
        channel.setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "info" -> result.success(environment(activity, false) + mapOf(
                        "canInstall" to permission(), "ready" to ready()))
                    "cancel" -> { cancelled.set(true); connection?.disconnect(); result.success(null) }
                    "permission" -> {
                        check(allowed())
                        if (Build.VERSION.SDK_INT >= 26) activity.startActivity(Intent(
                            Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:${activity.packageName}")))
                        result.success(null)
                    }
                    "download" -> work(result) {
                        check(allowed())
                        val data = JSONObject().apply {
                            put("url", call.argument<String>("url")); put("sha256", call.argument<String>("sha256"))
                            put("size", call.argument<Number>("size")?.toLong()); put("version", call.argument<String>("version"))
                            put("abi", call.argument<String>("abi"))
                        }
                        download(data)
                        main.post { if (!closed) result.success(null) }
                    }
                    "install" -> work(result) {
                        check(allowed())
                        check(permission())
                        validate(apk, JSONObject(metadata.readText()))
                        main.post {
                            if (!closed) try {
                                val uri = FileProvider.getUriForFile(activity, "${activity.packageName}.updates", apk)
                                activity.startActivity(Intent(Intent.ACTION_VIEW).apply {
                                    setDataAndType(uri, "application/vnd.android.package-archive")
                                    addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                                    clipData = ClipData.newRawUri("update", uri)
                                })
                                result.success(null)
                            } catch (e: Exception) { result.error("UPDATE_FAILED", e.message, null) }
                        }
                    }
                    else -> result.notImplemented()
                }
            } catch (e: Exception) { result.error("UPDATE_FAILED", e.message, null) }
        }
    }

    private fun work(result: MethodChannel.Result, operation: () -> Unit) {
        if (!busy.compareAndSet(false, true)) { result.error("BUSY", null, null); return }
        cancelled.set(false)
        worker.execute {
            try { operation() }
            catch (e: Exception) { main.post { if (!closed) result.error(
                if (cancelled.get()) "CANCELLED" else "UPDATE_FAILED", e.message, null) } }
            finally { busy.set(false) }
        }
    }

    private fun download(data: JSONObject) {
        val size = data.getLong("size")
        require(size in 1..MAX_APK_BYTES)
        require(data.getString("sha256").matches(Regex("[0-9a-f]{64}")))
        var url = URL(data.getString("url"))
        require(validAssetUrl(url))
        apk.parentFile!!.mkdirs()
        metadata.delete()
        apk.delete()
        val partial = File(apk.parentFile, "update.part")
        try {
            for (redirect in 0..5) {
                check(!cancelled.get())
                require(validAssetUrl(url, redirect > 0))
                val conn = url.openConnection() as HttpsURLConnection
                connection = conn
                conn.instanceFollowRedirects = false
                conn.connectTimeout = 15000
                conn.readTimeout = 30000
                conn.setRequestProperty("User-Agent", "IRBlaster-Updater")
                try {
                    val status = conn.responseCode
                    if (status in listOf(301, 302, 303, 307, 308)) {
                        url = URL(url, conn.getHeaderField("Location") ?: error("Missing redirect"))
                        continue
                    }
                    check(status == 200)
                    var received = 0L
                    var lastProgress = 0L
                    conn.inputStream.use { input -> partial.outputStream().use { out ->
                        val buffer = ByteArray(65536)
                        while (true) {
                            check(!cancelled.get())
                            val n = input.read(buffer)
                            if (n < 0) break
                            received += n
                            require(received <= size)
                            out.write(buffer, 0, n)
                            val now = android.os.SystemClock.elapsedRealtime()
                            if (now - lastProgress >= 200) {
                                lastProgress = now
                                val progress = received.toDouble() / size
                                main.post { if (!closed) channel.invokeMethod("progress", progress) }
                            }
                        }
                    } }
                    require(received == size)
                    validate(partial, data)
                    check(!cancelled.get())
                    check(partial.renameTo(apk))
                    metadata.writeText(data.toString())
                    return
                } finally { conn.disconnect(); connection = null }
            }
            error("Too many redirects")
        } finally { partial.delete() }
    }

    @Suppress("DEPRECATION")
    private fun validate(file: File, data: JSONObject) {
        require(file.length() == data.getLong("size") && file.length() <= MAX_APK_BYTES)
        val hash = MessageDigest.getInstance("SHA-256")
        file.inputStream().use { input ->
            val buffer = ByteArray(65536)
            while (true) { val n = input.read(buffer); if (n < 0) break; hash.update(buffer, 0, n) }
        }
        require(hash.digest().joinToString("") { "%02x".format(it.toInt() and 255) } == data.getString("sha256"))
        val flags = if (Build.VERSION.SDK_INT >= 28) PackageManager.GET_SIGNING_CERTIFICATES else PackageManager.GET_SIGNATURES
        val candidate = activity.packageManager.getPackageArchiveInfo(file.path, flags) ?: error("Invalid APK")
        val current = installed(activity)
        requireCompatibleUpdate(current, candidate, data.getString("version"), Build.VERSION.SDK_INT)
        data.put("versionCode", versionCode(candidate))
        val abi = data.getString("abi")
        require(abi == environment(activity, false)["abi"])
        ZipFile(file).use { zip ->
            val engine = zip.getEntry("lib/$abi/libflutter.so") ?: error("Missing engine ABI")
            require(zip.getEntry("lib/$abi/libapp.so") != null)
            zip.getInputStream(engine).use { input ->
                val header = ByteArray(5)
                java.io.DataInputStream(input).readFully(header)
                require(header.take(4) == listOf<Byte>(0x7f, 0x45, 0x4c, 0x46))
                require(header[4].toInt() == if (abi.contains("64")) 2 else 1)
            }
        }
        // Android's package installer performs the final cryptographic APK verification.
    }

    fun close() { closed = true; cancelled.set(true); connection?.disconnect(); worker.shutdownNow(); channel.setMethodCallHandler(null) }
}
