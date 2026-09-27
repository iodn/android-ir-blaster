package org.nslabs.ir_blaster.updates

import android.app.Application
import android.content.pm.ApplicationInfo
import android.content.pm.PackageInfo
import android.content.pm.Signature
import androidx.core.content.FileProvider
import java.io.File
import java.net.URL
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [27], application = Application::class)
class UpdatePolicyTest {
    @Suppress("DEPRECATION")
    private fun app(code: Int, signer: String = "1234") = PackageInfo().apply {
        packageName = "org.nslabs.ir_blaster"; versionCode = code; versionName = "3.5.0"
        signatures = arrayOf(Signature(signer))
        applicationInfo = ApplicationInfo().apply { minSdkVersion = 24 }
    }
    @Test fun onlyNewerMatchingSignedPackagesCanReplaceTheApp() {
        requireCompatibleUpdate(app(45), app(46), "3.5.0", 27)
        for (candidate in listOf(app(45), app(44), app(46, "5678"),
            app(46).apply { packageName = "other.app" },
            app(46).apply { versionName = "3.6.0" },
            app(46).apply { applicationInfo!!.minSdkVersion = 30 },
            app(46).apply { signatures = emptyArray() })) {
            assertThrows(IllegalArgumentException::class.java) {
                requireCompatibleUpdate(app(45), candidate, "3.5.0", 27)
            }
        }
    }
    @Test fun redirectsCannotEscapeGithubOrDowngradeToHttp() {
        assertTrue(validAssetUrl(URL("https://github.com/iodn/android-ir-blaster/releases/download/v3.5.0/app.apk")))
        assertTrue(validAssetUrl(URL("https://release-assets.githubusercontent.com/test"), true))
        assertFalse(validAssetUrl(URL("https://release-assets.githubusercontent.com/test")))
        for (url in listOf("http://github.com/iodn/android-ir-blaster/releases/download/x", "https://evil.example/x",
            "https://github.com/other/repo/releases/download/x", "https://user@github.com/iodn/android-ir-blaster/releases/download/x",
            "https://github.com:444/iodn/android-ir-blaster/releases/download/x", "file:///tmp/update.apk")) {
            assertFalse(validAssetUrl(URL(url), true))
        }
    }
    @Test fun fileProviderCannotExposeMetadataOrPrivateData() {
        val context = RuntimeEnvironment.getApplication()
        val authority = "${context.packageName}.updates"
        val provider = context.packageManager.resolveContentProvider(authority, 0)!!
        assertFalse(provider.exported)
        val apk = File(context.cacheDir, "app_updates/apks/update.apk")
        assertEquals("content", FileProvider.getUriForFile(context, authority, apk).scheme)
        assertThrows(IllegalArgumentException::class.java) {
            FileProvider.getUriForFile(context, authority, File(context.cacheDir, "app_updates/release.json"))
        }
    }
}
