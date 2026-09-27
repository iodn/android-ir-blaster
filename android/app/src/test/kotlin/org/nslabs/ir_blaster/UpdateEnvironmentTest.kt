package org.nslabs.ir_blaster

import org.junit.Assert.*
import org.junit.Test
import org.nslabs.ir_blaster.updates.*

class UpdateEnvironmentTest {
    @Test fun playBuildAndPlayInstallerNeverFallBackToGithub() {
        assertEquals("play", distribution(true, null, setOf(GITHUB_SIGNER)))
        assertEquals("play", distribution(false, "com.android.vending", setOf(GITHUB_SIGNER)))
    }
    @Test fun signaturesIdentifySideloadedReleases() {
        assertEquals("github", distribution(false, null, setOf(GITHUB_SIGNER)))
        assertEquals("fdroid", distribution(false, "com.android.packageinstaller", setOf(FDROID_SIGNER)))
    }
    @Test fun unknownAndAlternativeClientsAreNotGuessedAsGithub() {
        assertEquals("unknown", distribution(false, null, emptySet()))
        assertEquals("unknown", distribution(false, "com.android.packageinstaller", setOf("other")))
        assertEquals("fdroid", distribution(false, "com.looker.droidify", setOf(GITHUB_SIGNER)))
    }
    @Test fun certificateHashUsesFixedWidthHex() {
        assertEquals("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", digest(byteArrayOf()))
    }
}
