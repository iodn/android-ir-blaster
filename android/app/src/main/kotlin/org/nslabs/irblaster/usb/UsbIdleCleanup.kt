package org.nslabs.ir_blaster

import android.os.Handler

// Runs on the activity's main thread. A busy connection is retried, never force-closed.
internal class UsbIdleCleanup(
    private val handler: Handler,
    private val releaseIfIdle: () -> Boolean,
) {
    private var stopped = false
    private var destroyed = false
    private val cleanup = object : Runnable {
        override fun run() {
            if (!destroyed && stopped && !releaseIfIdle()) schedule()
        }
    }

    fun onStart() {
        stopped = false
        handler.removeCallbacks(cleanup)
    }

    fun onStop() {
        stopped = true
        schedule()
    }

    fun connectionChanged() {
        if (stopped) schedule()
    }

    fun destroy() {
        destroyed = true
        handler.removeCallbacks(cleanup)
    }

    private fun schedule() {
        handler.removeCallbacks(cleanup)
        if (!destroyed) handler.postDelayed(cleanup, 1000L)
    }
}
