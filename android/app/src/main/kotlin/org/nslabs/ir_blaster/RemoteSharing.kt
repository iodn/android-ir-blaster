package org.nslabs.ir_blaster

import android.app.Activity
import android.content.Intent
import android.graphics.Bitmap
import android.os.Handler
import android.os.Looper
import androidx.core.content.FileProvider
import com.google.zxing.BarcodeFormat
import com.google.zxing.EncodeHintType
import com.google.zxing.qrcode.QRCodeWriter
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.io.File
import java.util.UUID
import java.util.concurrent.Executors

class RemoteSharing(private val activity: Activity, private val channel: MethodChannel) {
    companion object {
        const val MIME = "application/vnd.org.nslabs.irblaster.share+json"
        const val MAX_BYTES = 8 * 1024 * 1024
        const val SCAN_REQUEST = 8219
    }
    private val worker = Executors.newSingleThreadExecutor()
    private val main = Handler(Looper.getMainLooper())
    private var scanResult: MethodChannel.Result? = null
    private var pending: String? = null
    private var pendingError = false
    private var ready = false
    private var closed = false

    init {
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "ready" -> {
                    ready = true
                    deliver()
                    result.success(null)
                }
                "scan" -> {
                    if (scanResult != null) {
                        result.error("BUSY", "Scanner already open", null)
                    } else {
                        scanResult = result
                        try {
                            activity.startActivityForResult(Intent(activity, RemoteQrScannerActivity::class.java).apply {
                                putExtra("prompt", call.argument<String>("prompt"))
                                putExtra("cancel", call.argument<String>("cancel"))
                            }, SCAN_REQUEST)
                        } catch (e: Exception) {
                            scanResult = null
                            result.error("SCAN_FAILED", e.message, null)
                        }
                    }
                }
                "qr" -> work(result) {
                    val text = call.argument<String>("text") ?: error("Missing text")
                    require(text.length <= 1200)
                    qrPng(text)
                }
                "share" -> work(result) {
                    val text = call.argument<String>("text") ?: error("Missing transfer")
                    val bytes = text.toByteArray(Charsets.UTF_8)
                    require(bytes.size <= MAX_BYTES)
                    val dir = File(activity.cacheDir, "remote_shares").apply { mkdirs() }
                    // Keep recent attachments available while another app reads them.
                    dir.listFiles()?.filter { it.lastModified() < System.currentTimeMillis() - 86400000L }
                        ?.forEach { it.delete() }
                    val file = File(dir, "irblaster-${UUID.randomUUID()}.json")
                    file.writeBytes(bytes)
                    val uri = FileProvider.getUriForFile(activity, "${activity.packageName}.remote_shares", file)
                    val send = Intent(Intent.ACTION_SEND).apply {
                        type = MIME
                        putExtra(Intent.EXTRA_STREAM, uri)
                        putExtra(Intent.EXTRA_SUBJECT, call.argument<String>("title"))
                        clipData = android.content.ClipData.newRawUri("", uri)
                        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    }
                    main.post {
                        if (!closed) {
                            try {
                                activity.startActivity(Intent.createChooser(send, call.argument<String>("title")))
                            } catch (e: Exception) {
                                result.error("SHARE_FAILED", e.message, null)
                                return@post
                            }
                            result.success(null)
                        }
                    }
                    DeferredResult
                }
                else -> result.notImplemented()
            }
        }
    }

    private object DeferredResult
    private fun work(result: MethodChannel.Result, operation: () -> Any?) {
        worker.execute {
            try {
                val value = operation()
                if (value !== DeferredResult) main.post { if (!closed) result.success(value) }
            } catch (e: Exception) {
                main.post { if (!closed) result.error("SHARING_FAILED", e.message, null) }
            }
        }
    }

    fun receive(intent: Intent?) {
        if (intent?.action != Intent.ACTION_VIEW && intent?.action != Intent.ACTION_SEND) return
        @Suppress("DEPRECATION")
        val uri = if (intent.action == Intent.ACTION_SEND)
            intent.getParcelableExtra<android.net.Uri>(Intent.EXTRA_STREAM) else intent.data
        if (uri?.scheme != "content") return
        // Read granted content URIs only; never filesystem paths or network URLs.
        worker.execute {
            val text = try {
                activity.contentResolver.openInputStream(uri)?.use { input ->
                    val output = ByteArrayOutputStream()
                    val buffer = ByteArray(8192)
                    while (true) {
                        val n = input.read(buffer)
                        if (n < 0) break
                        require(output.size() + n <= MAX_BYTES)
                        output.write(buffer, 0, n)
                    }
                    Charsets.UTF_8.newDecoder().decode(java.nio.ByteBuffer.wrap(output.toByteArray())).toString()
                } ?: error("Missing attachment")
            } catch (_: Exception) { null }
            main.post {
                if (!closed) {
                    pending = text
                    pendingError = text == null
                    deliver()
                }
            }
        }
    }

    private fun deliver() {
        if (!ready) return
        if (pending != null || pendingError) {
            channel.invokeMethod("received", pending)
            pending = null
            pendingError = false
        }
    }

    fun onResult(request: Int, code: Int, data: Intent?): Boolean {
        if (request != SCAN_REQUEST) return false
        if (data?.getBooleanExtra("failed", false) == true) {
            scanResult?.error("SCAN_FAILED", "Camera unavailable", null)
        } else {
            scanResult?.success(if (code == Activity.RESULT_OK) data?.getStringExtra("text") else null)
        }
        scanResult = null
        return true
    }

    fun close() {
        closed = true
        scanResult?.success(null)
        scanResult = null
        channel.setMethodCallHandler(null)
        worker.shutdownNow()
    }
}

internal fun qrPng(text: String): ByteArray {
    val matrix = QRCodeWriter().encode(text, BarcodeFormat.QR_CODE, 768, 768,
        mapOf(EncodeHintType.ERROR_CORRECTION to ErrorCorrectionLevel.M, EncodeHintType.MARGIN to 4))
    val pixels = IntArray(matrix.width * matrix.height) { i ->
        if (matrix[i % matrix.width, i / matrix.width]) android.graphics.Color.BLACK else android.graphics.Color.WHITE
    }
    val bitmap = Bitmap.createBitmap(pixels, matrix.width, matrix.height, Bitmap.Config.ARGB_8888)
    return try {
        ByteArrayOutputStream().use { out -> bitmap.compress(Bitmap.CompressFormat.PNG, 100, out); out.toByteArray() }
    } finally { bitmap.recycle() }
}
