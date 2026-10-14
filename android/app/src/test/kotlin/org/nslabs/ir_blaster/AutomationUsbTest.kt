package org.nslabs.ir_blaster

import android.app.Application
import android.hardware.usb.*
import android.os.SystemClock
import org.junit.After
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.annotation.Implementation
import org.robolectric.annotation.Implements
import org.robolectric.shadow.api.Shadow
import org.robolectric.util.ReflectionHelpers.setField
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicInteger

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28], application = Application::class, shadows = [RecordingUsbConnection::class])
class AutomationUsbTest {
    private val context get() = RuntimeEnvironment.getApplication()
    private val manager get() = context.getSystemService(UsbManager::class.java)
    private val discovery get() = UsbDiscoveryManager(context, manager)
    private val request = AutomationIrRequest.parse(38000, "9000,4500,560", "USB")
    private val toClose = mutableListOf<() -> Unit>()

    @Before fun reset() {
        RecordingUsbConnection.opens.set(0)
        RecordingUsbConnection.closes.set(0)
        RecordingUsbConnection.writes.clear()
        RecordingUsbConnection.failWrites = false
        RecordingUsbConnection.shortWrites = false
        RecordingUsbConnection.elkReply = true
        RecordingUsbConnection.continuousInput = false
        RecordingUsbConnection.started = CountDownLatch(1)
        RecordingUsbConnection.release = CountDownLatch(0)
    }

    @After fun cleanup() {
        RecordingUsbConnection.release.countDown()
        toClose.reversed().forEach { it() }
    }

    private fun attach(permission: Boolean = true, elk: Boolean = false, name: String = "/dev/bus/usb/001/002"): UsbDevice {
        return usbDevice(name, if (elk) 0x045c else 0x10c4, if (elk) 0x0134 else 0x8468).also {
            shadowOf(manager).addOrUpdateUsbDevice(it, permission)
        }
    }

    private fun send() = AutomationTransmitter(context).transmit(request, SystemClock.uptimeMillis() + 7000)

    @Test fun requiresAnAttachedPermittedUnambiguousDevice() {
        assertEquals(AutomationResult.NO_USB_DEVICE, send())
        val device = attach(permission = false)
        assertEquals(AutomationResult.USB_PERMISSION_REQUIRED, send())
        assertEquals(0, RecordingUsbConnection.opens.get())
        shadowOf(manager).addOrUpdateUsbDevice(device, true)
        attach(name = "/dev/bus/usb/001/003")
        assertEquals(AutomationResult.AMBIGUOUS_DEVICE, send())
        assertEquals(0, RecordingUsbConnection.opens.get())
        assertNull(shadowOf(context).nextStartedActivity)
    }

    @Test fun coldSendClosesConnectionAndCanSendAgain() {
        val device = attach()
        assertEquals(AutomationResult.SENT, send())
        assertEquals(1, RecordingUsbConnection.opens.get())
        assertEquals(1, RecordingUsbConnection.closes.get())
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
        assertEquals(AutomationResult.SENT, send())
        assertEquals(2, RecordingUsbConnection.closes.get())
    }

    @Test fun borrowsActivityConnectionWithoutHandshakingOrClosingIt() {
        val device = attach()
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        val handshakes = RecordingUsbConnection.writes.size
        assertEquals(AutomationResult.SENT, send())
        assertEquals(1, RecordingUsbConnection.opens.get())
        assertEquals(0, RecordingUsbConnection.closes.get())
        assertEquals(handshakes + 1, RecordingUsbConnection.writes.size)
        val automated = RecordingUsbConnection.writes.last().copyOf()
        assertTrue(tx.transmitRaw(request.frequency, request.pattern))
        val manual = RecordingUsbConnection.writes.last().copyOf()
        // Only the existing transport sequence counters should differ.
        automated[2] = 0; automated[7] = 0
        manual[2] = 0; manual[7] = 0
        assertArrayEquals(manual, automated)
    }

    @Test fun closingOwnerDoesNotInterruptBorrowedTransmission() {
        val device = attach()
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        val borrowed = requireNotNull(UsbDeviceAccess.borrow(device.deviceName))
        toClose += { borrowed.close() }
        tx.close()
        assertEquals(0, RecordingUsbConnection.closes.get())
        assertNull(TiqiaaUsbLearner.open(manager, device))
        assertEquals(true, borrowed.transmit(38000, request.pattern, SystemClock.uptimeMillis() + 7000))
        borrowed.close()
        assertEquals(1, RecordingUsbConnection.closes.get())
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
    }

    @Test fun idleCleanupPreservesWidgetLeaseThenAllowsColdSend() {
        val device = attach(elk = true)
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        val borrowed = requireNotNull(UsbDeviceAccess.borrow(device.deviceName))
        toClose += { borrowed.close() }
        assertFalse(tx.closeIfIdle())
        assertEquals(0, RecordingUsbConnection.closes.get())
        assertEquals(true, borrowed.transmit(38000, request.pattern, SystemClock.uptimeMillis() + 7000))
        borrowed.close()
        assertTrue(tx.closeIfIdle())
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
        assertTrue(manager.hasPermission(device))
        assertEquals(AutomationResult.SENT, send())
    }

    @Test fun idleCleanupCannotInterruptManualTransmission() {
        val device = attach(elk = true)
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        RecordingUsbConnection.release = CountDownLatch(1)
        RecordingUsbConnection.started = CountDownLatch(1)
        var sent = false
        val thread = Thread { sent = tx.transmitRaw(38000, request.pattern) }.also { it.start() }
        try {
            assertTrue(RecordingUsbConnection.started.await(3, TimeUnit.SECONDS))
            assertFalse(tx.closeIfIdle())
            assertEquals(0, RecordingUsbConnection.closes.get())
        } finally {
            RecordingUsbConnection.release.countDown()
            thread.join(3000)
        }
        assertTrue(sent)
        assertTrue(tx.closeIfIdle())
    }

    @Test fun recentCommandsKeepConnectionUntilQuietPeriodExpires() {
        val device = attach(elk = true)
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        assertTrue(tx.transmitRaw(38000, request.pattern))
        assertFalse(tx.closeIfIdle(minIdleMs = 1000L))
        SystemClock.sleep(1000L)
        assertTrue(tx.transmitRaw(38000, request.pattern))
        assertFalse(tx.closeIfIdle(minIdleMs = 1000L))
        SystemClock.sleep(1000L)
        assertTrue(tx.closeIfIdle(minIdleMs = 1000L))
    }

    @Test fun idleCleanupWaitsForResponseReader() {
        val device = attach(elk = true)
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        val reader = kotlinx.coroutines.Job()
        setField(tx, "readerJob", reader)
        assertFalse(tx.closeIfIdle())
        assertEquals(0, RecordingUsbConnection.closes.get())
        reader.cancel()
        assertTrue(tx.closeIfIdle())
    }

    @Test fun neitherLearnerCanBeDisruptedByAutomation() {
        for (elk in listOf(false, true)) {
            val device = attach(elk = elk)
            val learner = requireNotNull(if (elk) ElkSmartUsbLearner.open(manager, device) else TiqiaaUsbLearner.open(manager, device))
            toClose += { learner.close() }
            val opens = RecordingUsbConnection.opens.get()
            assertEquals(AutomationResult.BUSY, send())
            assertEquals(opens, RecordingUsbConnection.opens.get())
            assertTrue(RecordingUsbConnection.writes.isEmpty())
            learner.close()
            shadowOf(manager).removeUsbDevice(device)
        }
    }

    @Test fun failedSendReleasesOwnershipForNextAttempt() {
        val device = attach()
        RecordingUsbConnection.failWrites = true
        assertEquals(AutomationResult.TRANSMIT_FAILED, send())
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
        RecordingUsbConnection.failWrites = false
        assertEquals(AutomationResult.SENT, send())
    }

    @Test fun elkSmartHandshakeAndReplayUseTheExistingFormatter() {
        val device = attach(elk = true)
        assertEquals(AutomationResult.SENT, send())
        assertTrue(RecordingUsbConnection.writes.first().all { it == 0xfc.toByte() })
        assertTrue(RecordingUsbConnection.writes[1].take(4).all { it == 0xff.toByte() })
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
        RecordingUsbConnection.elkReply = false
        assertEquals(AutomationResult.USB_OPEN_FAILED, send())
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
    }

    @Test fun shortPayloadWriteFailsWithoutRetrying() {
        val device = attach()
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        val before = RecordingUsbConnection.writes.size
        RecordingUsbConnection.shortWrites = true
        assertEquals(AutomationResult.TRANSMIT_FAILED, send())
        assertEquals(before + 1, RecordingUsbConnection.writes.size)
    }

    @Test fun manualReplayRejectsShortWritesAndCanSendAgain() {
        for (elk in listOf(false, true)) {
            val device = attach(elk = elk)
            val tx = requireNotNull(discovery.openTransmitter(device))
            toClose += { tx.close() }
            val before = RecordingUsbConnection.writes.size
            RecordingUsbConnection.shortWrites = true
            assertFalse(tx.transmitRaw(38000, request.pattern))
            assertEquals(before + 1, RecordingUsbConnection.writes.size)
            RecordingUsbConnection.shortWrites = false
            assertTrue(tx.transmitRaw(38000, request.pattern))
            tx.close()
            shadowOf(manager).removeUsbDevice(device)
        }
    }

    @Test fun noisyHandshakeCannotKeepBroadcastAliveIndefinitely() {
        val device = attach()
        RecordingUsbConnection.continuousInput = true
        assertEquals(AutomationResult.USB_OPEN_FAILED, send())
        assertTrue(RecordingUsbConnection.writes.isEmpty())
        assertFalse(UsbDeviceAccess.isOwned(device.deviceName))
        RecordingUsbConnection.continuousInput = false
        assertEquals(AutomationResult.SENT, send())
    }

    @Test fun oversizedUsbWorkIsRejectedBeforeSendingPayload() {
        val device = attach()
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        val before = RecordingUsbConnection.writes.size
        val huge = AutomationIrRequest.parse(38000, IntArray(4096) { 100 }, "USB")
        assertEquals(AutomationResult.TRANSMIT_FAILED,
            AutomationTransmitter(context).transmit(huge, SystemClock.uptimeMillis() + 7000))
        assertEquals(before, RecordingUsbConnection.writes.size)
    }

    @Test fun concurrentManualSendDoesNotWaitOrInterleavePackets() {
        val device = attach()
        val tx = requireNotNull(discovery.openTransmitter(device))
        toClose += { tx.close() }
        RecordingUsbConnection.release = CountDownLatch(1)
        RecordingUsbConnection.started = CountDownLatch(1)
        val outcome = arrayOfNulls<AutomationResult>(1)
        val thread = Thread { outcome[0] = send() }.also { it.start() }
        try {
            assertTrue(RecordingUsbConnection.started.await(3, TimeUnit.SECONDS))
            assertFalse(tx.transmitRaw(38000, request.pattern))
        } finally {
            RecordingUsbConnection.release.countDown()
            thread.join(3000)
        }
        assertEquals(AutomationResult.SENT, outcome[0])
    }
}

internal fun usbDevice(name: String, vid: Int, pid: Int): UsbDevice {
    fun endpoint(address: Int) = Shadow.newInstanceOf(UsbEndpoint::class.java).also {
        setField(it, "mAddress", address)
        setField(it, "mAttributes", UsbConstants.USB_ENDPOINT_XFER_BULK)
        setField(it, "mMaxPacketSize", 64)
    }
    val intf = Shadow.newInstanceOf(UsbInterface::class.java).also {
        setField(it, "mEndpoints", arrayOf(endpoint(2), endpoint(0x82)))
    }
    return Shadow.newInstanceOf(UsbDevice::class.java).also {
        setField(it, "mName", name)
        setField(it, "mVendorId", vid)
        setField(it, "mProductId", pid)
        setField(it, "mInterfaces", arrayOf(intf))
    }
}

@Implements(UsbDeviceConnection::class)
class RecordingUsbConnection {
    private var pendingIdentify = false
    @Implementation fun __constructor__(device: UsbDevice) { opens.incrementAndGet() }
    @Implementation fun claimInterface(intf: UsbInterface, force: Boolean) = true
    @Implementation fun releaseInterface(intf: UsbInterface) = true
    @Implementation fun close() { closes.incrementAndGet() }
    @Implementation fun bulkTransfer(endpoint: UsbEndpoint, buffer: ByteArray, length: Int, timeout: Int): Int {
        if (endpoint.direction == UsbConstants.USB_DIR_IN) {
            if (continuousInput) { SystemClock.sleep(10); return 1 }
            if (pendingIdentify && elkReply) {
                byteArrayOf(0xfc.toByte(), 0xfc.toByte(), 0xfc.toByte(), 0xfc.toByte(), 0x70, 1).copyInto(buffer)
                pendingIdentify = false
                return 6
            }
            // Advance the test clock as a timed-out native read would.
            SystemClock.sleep(timeout.toLong())
            return -1
        }
        started.countDown()
        check(release.await(5, TimeUnit.SECONDS))
        if (failWrites) return -1
        writes.add(buffer.copyOf(length))
        pendingIdentify = length == 4 && buffer.take(4).all { it == 0xfc.toByte() }
        return if (shortWrites) length - 1 else length
    }
    companion object {
        val opens = AtomicInteger()
        val closes = AtomicInteger()
        val writes = java.util.Collections.synchronizedList(mutableListOf<ByteArray>())
        @Volatile var failWrites = false
        @Volatile var shortWrites = false
        @Volatile var elkReply = true
        @Volatile var continuousInput = false
        var started = CountDownLatch(1)
        var release = CountDownLatch(0)
    }
}
