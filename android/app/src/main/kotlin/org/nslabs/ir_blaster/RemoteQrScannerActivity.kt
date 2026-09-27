package org.nslabs.ir_blaster

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.view.ViewGroup
import android.widget.Button
import android.widget.LinearLayout
import androidx.core.content.ContextCompat
import androidx.core.view.ViewCompat
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import com.google.zxing.BarcodeFormat
import com.journeyapps.barcodescanner.DecoratedBarcodeView
import com.journeyapps.barcodescanner.DefaultDecoderFactory
import com.journeyapps.barcodescanner.BarcodeCallback
import com.journeyapps.barcodescanner.BarcodeResult
import com.journeyapps.barcodescanner.CameraPreview

class RemoteQrScannerActivity : Activity() {
    private var scanner: DecoratedBarcodeView? = null
    override fun onCreate(state: Bundle?) {
        super.onCreate(state)
        WindowCompat.enableEdgeToEdge(window)
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
            fail(); return
        }
        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(android.graphics.Color.BLACK)
        }
        ViewCompat.setOnApplyWindowInsetsListener(root) { view, insets ->
            val bars = insets.getInsets(WindowInsetsCompat.Type.systemBars() or WindowInsetsCompat.Type.displayCutout())
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom)
            insets
        }
        val view = DecoratedBarcodeView(this)
        scanner = view
        view.setStatusText(intent.getStringExtra("prompt").orEmpty())
        view.barcodeView.decoderFactory = DefaultDecoderFactory(listOf(BarcodeFormat.QR_CODE))
        view.barcodeView.addStateListener(object : CameraPreview.StateListener {
            override fun previewSized() {}
            override fun previewStarted() {}
            override fun previewStopped() {}
            override fun cameraClosed() {}
            override fun cameraError(error: Exception) { fail() }
        })
        root.addView(view, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f))
        root.addView(Button(this).apply {
            text = intent.getStringExtra("cancel")
            setOnClickListener { finish() }
        })
        setContentView(root)
        view.decodeSingle(object : BarcodeCallback {
            override fun barcodeResult(result: BarcodeResult) {
                setResult(RESULT_OK, Intent().putExtra("text", result.text))
                finish()
            }
        })
    }
    private fun fail() {
        setResult(RESULT_CANCELED, Intent().putExtra("failed", true))
        finish()
    }
    override fun onResume() { super.onResume(); scanner?.resume() }
    override fun onPause() { scanner?.pause(); super.onPause() }
}
