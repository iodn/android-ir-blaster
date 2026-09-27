package org.nslabs.ir_blaster

import android.app.Application
import java.io.File
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class)
class CrashReportsTest {
    private val context get() = RuntimeEnvironment.getApplication()

    @Before fun reset() {
        File(context.noBackupFilesDir, "crash_report.json").delete()
    }

    @Test fun emailIntentEncodesReportWithoutSendingIt() {
        val intent = crashReportEmailIntent("contact@neroteam.com", "Error & details", "line1\nline2?&")
        assertEquals(android.content.Intent.ACTION_SENDTO, intent.action)
        assertEquals("mailto:contact%40neroteam.com?subject=Error%20%26%20details&body=line1%0Aline2%3F%26",
            intent.data.toString())
    }

    @Test fun reportIsAvailableOnlyOnNextLaunchAndOnlyOncePerLaunch() {
        val current = CrashReports(context)
        current.record("Flutter", "StateError: sample\n#0 example.dart:4")
        assertNull(current.takePrevious())
        val next = CrashReports(context)
        val report = next.takePrevious()!!
        assertTrue(report["text"]!!.contains("example.dart:4"))
        assertTrue(report["text"]!!.contains("App:"))
        assertTrue(report["text"]!!.contains("Android:"))
        assertTrue(report["text"]!!.contains("Device:"))
        assertTrue(report["text"]!!.contains("Emitter preference:"))
        assertNull(next.takePrevious())
        // Not now / sharing does not remove the on-disk report.
        assertEquals(report, CrashReports(context).takePrevious())
        current.startSession()
        assertEquals(report, current.takePrevious())
        assertNull(current.takePrevious())
    }

    @Test fun discardDeletesReportButNotANewerFailure() {
        val store = CrashReports(context)
        store.record("Android", "old")
        val old = store.read()!!["id"]!!
        store.record("Android", "new")
        store.discard(old)
        assertNotNull(store.read())
        store.discard(store.read()!!["id"]!!)
        assertNull(CrashReports(context).takePrevious())
    }

    @Test fun reportIsBoundedAndExcludedFromBackup() {
        val store = CrashReports(context)
        store.record("Flutter", "x".repeat(100000))
        val text = store.read()!!["text"]!!
        assertTrue(text.length < 51000)
        assertTrue(text.contains("truncated"))
        assertTrue(File(context.noBackupFilesDir, "crash_report.json").exists())
    }

    @Test fun corruptReportDoesNotBlockStartup() {
        File(context.noBackupFilesDir, "crash_report.json").writeText("not json")
        assertNull(CrashReports(context).takePrevious())
        val store = CrashReports(context)
        store.record("Android", "recovered")
        assertNotNull(store.read())
    }

    @Test
    @Config(application = CrashReportingApplication::class)
    fun uncaughtHandlerStoresNestedCauseAndDelegates() {
        val original = Thread.getDefaultUncaughtExceptionHandler()
        var delegated: Throwable? = null
        try {
            Thread.setDefaultUncaughtExceptionHandler { _, error -> delegated = error }
            val app = context as CrashReportingApplication
            app.onCreate()
            val failure = IllegalStateException("outer", IllegalArgumentException("inner"))
            Thread.getDefaultUncaughtExceptionHandler()!!.uncaughtException(Thread.currentThread(), failure)
            assertSame(failure, delegated)
            val text = app.crashReports.read()!!["text"]!!
            assertTrue(text.contains("IllegalStateException: outer"))
            assertTrue(text.contains("Caused by: java.lang.IllegalArgumentException: inner"))
        } finally {
            Thread.setDefaultUncaughtExceptionHandler(original)
        }
    }
}
