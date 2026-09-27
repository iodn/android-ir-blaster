package org.nslabs.ir_blaster

import android.app.Application
import android.graphics.BitmapFactory
import androidx.core.content.FileProvider
import com.google.zxing.BinaryBitmap
import com.google.zxing.MultiFormatReader
import com.google.zxing.RGBLuminanceSource
import com.google.zxing.common.HybridBinarizer
import java.io.File
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.annotation.GraphicsMode

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class)
class RemoteSharingTest {
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    fun qrImageCanBeDecodedAtTheMaximumAllowedLength() {
        val text = "IRBLASTER:1:" + "abc012_-".repeat(149).take(1188)
        assertEquals(1200, text.length)
        val png = qrPng(text)
        val bitmap = BitmapFactory.decodeByteArray(png, 0, png.size)
        val pixels = IntArray(bitmap.width * bitmap.height)
        bitmap.getPixels(pixels, 0, bitmap.width, 0, 0, bitmap.width, bitmap.height)
        val source = RGBLuminanceSource(bitmap.width, bitmap.height, pixels)
        assertEquals(text, MultiFormatReader().decode(BinaryBitmap(HybridBinarizer(source))).text)
        bitmap.recycle()
    }

    @Test fun providerExposesOnlySharingCacheAndIsNotExported() {
        val context = RuntimeEnvironment.getApplication()
        val authority = "${context.packageName}.remote_shares"
        val provider = context.packageManager.resolveContentProvider(authority, 0)!!
        assertFalse(provider.exported)
        assertTrue(provider.grantUriPermissions)
        val shared = File(context.cacheDir, "remote_shares/test.json")
        shared.parentFile!!.mkdirs()
        shared.writeText("{}")
        val uri = FileProvider.getUriForFile(context, authority, shared)
        assertEquals("content", uri.scheme)
        assertThrows(IllegalArgumentException::class.java) {
            FileProvider.getUriForFile(context, authority, File(context.filesDir, "remotes.json"))
        }
    }

    @Test fun scannerWithoutCameraPermissionReturnsAnErrorInsteadOfCrashing() {
        val controller = Robolectric.buildActivity(RemoteQrScannerActivity::class.java).create()
        val activity = controller.get()
        assertTrue(activity.isFinishing)
        assertTrue(shadowOf(activity).resultIntent.getBooleanExtra("failed", false))
        controller.destroy()
    }
}
