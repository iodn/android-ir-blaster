package org.nslabs.ir_blaster.updates

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import android.os.Process
import java.security.MessageDigest

internal const val GITHUB_SIGNER = "3ba2192df2219ac2d3fab07733c27176af220b15581f4c727582f9120aec7b4b"
internal const val FDROID_SIGNER = "9c05f19de390c3a7cf2dda3c5f31831e75b810481256aaf50277d3bdffe81af5"

internal fun distribution(playBuild: Boolean, installer: String?, signers: Set<String>): String = when {
    playBuild || installer == "com.android.vending" -> "play"
    FDROID_SIGNER in signers -> "fdroid"
    installer in setOf("org.fdroid.fdroid", "org.fdroid.basic", "org.fdroid.nearby",
        "com.looker.droidify", "com.machiav3lli.fdroid") -> "fdroid"
    GITHUB_SIGNER in signers -> "github"
    else -> "unknown"
}

internal fun digest(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it.toInt() and 255) }

@Suppress("DEPRECATION")
internal fun signers(info: PackageInfo): Set<String> {
    val signatures = if (Build.VERSION.SDK_INT >= 28) info.signingInfo?.apkContentsSigners else info.signatures
    return signatures.orEmpty().map { digest(it.toByteArray()) }.toSet()
}

@Suppress("DEPRECATION")
internal fun installed(context: Context): PackageInfo = context.packageManager.getPackageInfo(
    context.packageName, if (Build.VERSION.SDK_INT >= 28) PackageManager.GET_SIGNING_CERTIFICATES else PackageManager.GET_SIGNATURES)

@Suppress("DEPRECATION")
internal fun versionCode(info: PackageInfo): Long =
    if (Build.VERSION.SDK_INT >= 28) info.longVersionCode else info.versionCode.toLong()

internal fun environment(context: Context, playBuild: Boolean): Map<String, Any?> {
    val info = installed(context)
    val installer = try {
        if (Build.VERSION.SDK_INT >= 30) context.packageManager.getInstallSourceInfo(context.packageName).installingPackageName
        else @Suppress("DEPRECATION") context.packageManager.getInstallerPackageName(context.packageName)
    } catch (_: Exception) { null }
    // Stay on the installed process architecture, including 32-bit Android on ARM64 hardware.
    val abi = Build.SUPPORTED_ABIS.firstOrNull {
        it in setOf("arm64-v8a", "armeabi-v7a", "x86_64") && it.contains("64") == Process.is64Bit()
    }
    return mapOf("source" to distribution(playBuild, installer, signers(info)),
        "installer" to installer, "version" to info.versionName, "build" to versionCode(info), "abi" to abi)
}
