package org.nslabs.ir_blaster

import android.app.Application
import android.os.Handler
import android.os.Looper
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import java.time.Duration

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class)
class UsbIdleCleanupTest {
    private fun advance() = shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1))

    @Test fun foregroundConnectionIsKeptAndStoppedConnectionReleasedOnce() {
        var calls = 0
        val cleanup = UsbIdleCleanup(Handler(Looper.getMainLooper())) { calls++; true }
        cleanup.onStart()
        cleanup.connectionChanged()
        advance()
        assertEquals(0, calls)
        cleanup.onStop()
        advance()
        advance()
        assertEquals(1, calls)
    }

    @Test fun busyConnectionIsRetriedUntilIdle() {
        var calls = 0
        var idle = false
        val cleanup = UsbIdleCleanup(Handler(Looper.getMainLooper())) { calls++; idle }
        cleanup.onStop()
        advance()
        assertEquals(1, calls)
        idle = true
        advance()
        advance()
        assertEquals(2, calls)
    }

    @Test fun returningToForegroundOrDestroyingCancelsCleanup() {
        var calls = 0
        val cleanup = UsbIdleCleanup(Handler(Looper.getMainLooper())) { calls++; false }
        cleanup.onStop()
        cleanup.onStart()
        advance()
        assertEquals(0, calls)
        cleanup.onStop()
        advance()
        cleanup.destroy()
        cleanup.connectionChanged()
        advance()
        assertEquals(1, calls)
    }

    @Test fun connectionOpenedWhileStoppedIsAlsoReleased() {
        var calls = 0
        val cleanup = UsbIdleCleanup(Handler(Looper.getMainLooper())) { calls++; true }
        cleanup.onStop()
        advance()
        cleanup.connectionChanged()
        advance()
        assertEquals(2, calls)
    }
}
