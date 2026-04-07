package org.nslabs.ir_blaster.audio

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.media.AudioDeviceInfo
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioRecord
import android.media.MediaRecorder
import android.os.Build
import android.os.SystemClock
import android.util.Base64
import android.util.Log
import androidx.core.content.ContextCompat

internal data class AudioLearnDiagnostics(
    val permissionGranted: Boolean,
    val usbInputAvailable: Boolean,
    val inputName: String?,
)

internal data class AudioLearnResult(
    val family: String,
    val rawPatternUs: List<Int>,
    val opaqueFrameBase64: String,
    val opaqueMeta: Int,
    val quality: Int,
    val frequencyHz: Int,
    val displayPreview: String,
) {
    fun toWireMap(): Map<String, Any?> {
        return mapOf(
            "family" to family,
            "rawPatternUs" to rawPatternUs,
            "opaqueFrameBase64" to opaqueFrameBase64,
            "opaqueMeta" to opaqueMeta,
            "quality" to quality,
            "frequencyHz" to frequencyHz,
            "displayPreview" to displayPreview,
        )
    }
}

internal class AudioIrLearner(private val context: Context, private val mode: Short) {
    companion object {
        private const val TAG = "AudioIrLearner"
        private const val SAMPLE_RATE = 44_100
        private const val WINDOW_SAMPLES = 24 // ~0.54 ms
        private const val PRE_ROLL_SAMPLES = SAMPLE_RATE / 20
        private const val START_WINDOWS = 3
        private const val TAIL_WINDOWS = 18
        private const val MIN_ACTIVE_WINDOWS = 10
        private const val MIN_TRANSITIONS = 6
        private const val MAX_CAPTURE_MS = 8000
        private const val MIN_CAPTURE_MS = 20
        private const val DEFAULT_AUDIO_IR_FREQUENCY = 38_000

        fun diagnostics(context: Context): AudioLearnDiagnostics {
            val permissionGranted = ContextCompat.checkSelfPermission(
                context,
                Manifest.permission.RECORD_AUDIO,
            ) == PackageManager.PERMISSION_GRANTED
            val input = findUsbInputDevice(context)
            return AudioLearnDiagnostics(
                permissionGranted = permissionGranted,
                usbInputAvailable = input != null,
                inputName = input?.productName?.toString(),
            )
        }

        fun findUsbInputDevice(context: Context): AudioDeviceInfo? {
            val mgr = context.getSystemService(Context.AUDIO_SERVICE) as? AudioManager ?: return null
            val inputs = if (Build.VERSION.SDK_INT >= 23) {
                mgr.getDevices(AudioManager.GET_DEVICES_INPUTS)
            } else {
                emptyArray()
            }
            return inputs.firstOrNull {
                it.type == AudioDeviceInfo.TYPE_USB_DEVICE ||
                    it.type == AudioDeviceInfo.TYPE_USB_HEADSET
            }
        }
    }

    @Volatile
    private var cancelled = false

    fun cancel() {
        cancelled = true
    }

    fun learn(timeoutMs: Int): AudioLearnResult? {
        val input = findUsbInputDevice(context) ?: return null
        val minBuffer = AudioRecord.getMinBufferSize(
            SAMPLE_RATE,
            AudioFormat.CHANNEL_IN_MONO,
            AudioFormat.ENCODING_PCM_16BIT,
        )
        if (minBuffer <= 0) return null

        for (source in captureSources()) {
            if (cancelled) return null
            val record = createRecord(minBuffer, input, source) ?: continue
            try {
                val learned = learnWithRecord(record, timeoutMs, source, input)
                if (learned != null) return learned
            } finally {
                try {
                    record.stop()
                } catch (_: Throwable) {
                }
                try {
                    record.release()
                } catch (_: Throwable) {
                }
            }
        }
        return null
    }

    private fun captureSources(): List<Int> {
        val out = ArrayList<Int>(4)
        out.add(MediaRecorder.AudioSource.MIC)
        if (Build.VERSION.SDK_INT >= 24) {
            out.add(MediaRecorder.AudioSource.UNPROCESSED)
        }
        out.add(MediaRecorder.AudioSource.VOICE_RECOGNITION)
        out.add(MediaRecorder.AudioSource.DEFAULT)
        return out.distinct()
    }

    private fun createRecord(
        minBuffer: Int,
        input: AudioDeviceInfo,
        source: Int,
    ): AudioRecord? {
        return try {
            val record = if (Build.VERSION.SDK_INT >= 23) {
                AudioRecord.Builder()
                    .setAudioSource(source)
                    .setAudioFormat(
                        AudioFormat.Builder()
                            .setSampleRate(SAMPLE_RATE)
                            .setChannelMask(AudioFormat.CHANNEL_IN_MONO)
                            .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                            .build(),
                    )
                    .setBufferSizeInBytes(minBuffer * 4)
                    .build()
            } else {
                @Suppress("DEPRECATION")
                AudioRecord(
                    source,
                    SAMPLE_RATE,
                    AudioFormat.CHANNEL_IN_MONO,
                    AudioFormat.ENCODING_PCM_16BIT,
                    minBuffer * 4,
                )
            }
            if (record.state != AudioRecord.STATE_INITIALIZED) {
                try {
                    record.release()
                } catch (_: Throwable) {
                }
                null
            } else {
                if (Build.VERSION.SDK_INT >= 23) {
                    try {
                        record.preferredDevice = input
                    } catch (_: Throwable) {
                    }
                }
                record
            }
        } catch (t: Throwable) {
            Log.w(TAG, "createRecord source=$source failed: ${t.message}")
            null
        }
    }

    private fun learnWithRecord(
        record: AudioRecord,
        timeoutMs: Int,
        source: Int,
        preferredInput: AudioDeviceInfo,
    ): AudioLearnResult? {
        val readBuffer = ShortArray(
            (AudioRecord.getMinBufferSize(
                SAMPLE_RATE,
                AudioFormat.CHANNEL_IN_MONO,
                AudioFormat.ENCODING_PCM_16BIT,
            ) / 2).coerceAtLeast(WINDOW_SAMPLES),
        )
        val work = ArrayList<Short>(SAMPLE_RATE * 4)
        val preRoll = ArrayDeque<Short>(PRE_ROLL_SAMPLES)
        val durationsUs = ArrayList<Int>(128)

        var noiseFloor = 0.0
        var active = false
        var currentLevel = false
        var activeWindows = 0
        var silentWindows = 0
        var currentLevelWindows = 0
        var pendingWindows = 0
        var transitions = 0
        val startedAt = SystemClock.uptimeMillis()

        fun windowsToUs(count: Int): Int {
            return ((count * WINDOW_SAMPLES).toDouble() * 1_000_000.0 / SAMPLE_RATE)
                .toInt()
                .coerceAtLeast(1)
        }

        fun pushDuration(level: Boolean, count: Int) {
            if (count <= 0 || durationsUs.size >= 512) return
            val durationUs = windowsToUs(count)
            if (level && durationUs < 120) return
            if (!level && durationUs < 120 && durationsUs.isNotEmpty()) return
            durationsUs.add(durationUs)
        }

        fun isValidPattern(pattern: List<Int>): Boolean {
            if (pattern.size < 6) return false
            val totalUs = pattern.fold(0L) { sum, v -> sum + v.toLong() }
            if (totalUs < 8_000L || totalUs > 350_000L) return false

            var marks = 0
            var spaces = 0
            var tiny = 0
            for (i in pattern.indices) {
                val d = pattern[i]
                if (d < 120) tiny += 1
                if (i % 2 == 0) {
                    marks += 1
                    if (d > 20_000) return false
                } else {
                    spaces += 1
                    if (d > 40_000) return false
                }
            }
            if (marks < 3 || spaces < 2) return false
            if (tiny > 1) return false
            return true
        }

        fun routedToUsb(): Boolean {
            if (Build.VERSION.SDK_INT < 23) return true
            val routed = try {
                record.routedDevice
            } catch (_: Throwable) {
                null
            }
            if (routed == null) return false
            return routed.id == preferredInput.id ||
                routed.type == AudioDeviceInfo.TYPE_USB_DEVICE ||
                routed.type == AudioDeviceInfo.TYPE_USB_HEADSET
        }

        try {
            record.startRecording()
            if (record.recordingState != AudioRecord.RECORDSTATE_RECORDING) {
                Log.w(TAG, "AudioRecord failed to enter recording state for source=$source")
                return null
            }

            if (Build.VERSION.SDK_INT >= 23) {
                SystemClock.sleep(120)
                if (!routedToUsb()) {
                    Log.w(TAG, "AudioRecord source=$source not routed to USB input")
                    return null
                }
            }

            Log.i(TAG, "Audio learning started source=$source routed=${if (Build.VERSION.SDK_INT >= 23) record.routedDevice?.productName else "legacy"}")

            while (!cancelled && SystemClock.uptimeMillis() - startedAt < timeoutMs) {
                val read = record.read(readBuffer, 0, readBuffer.size)
                if (read <= 0) continue

                var offset = 0
                while (offset + WINDOW_SAMPLES <= read) {
                    var sumAbs = 0.0
                    var peakAbs = 0.0
                    for (i in 0 until WINDOW_SAMPLES) {
                        val abs = kotlin.math.abs(readBuffer[offset + i].toInt()).toDouble()
                        sumAbs += abs
                        if (abs > peakAbs) peakAbs = abs
                    }
                    val avgAbs = sumAbs / WINDOW_SAMPLES.toDouble()
                    if (!active) {
                        noiseFloor = if (noiseFloor <= 0.0) avgAbs else ((noiseFloor * 0.98) + (avgAbs * 0.02))
                    }
                    val high = maxOf(noiseFloor * 5.0, 900.0)
                    val low = maxOf(noiseFloor * 2.3, 350.0)
                    val windowActive = if (active && currentLevel) {
                        !(avgAbs <= low && peakAbs <= low * 1.25)
                    } else {
                        avgAbs >= high || peakAbs >= high * 1.35
                    }

                    for (i in 0 until WINDOW_SAMPLES) {
                        val sample = readBuffer[offset + i]
                        if (!active) {
                            if (preRoll.size >= PRE_ROLL_SAMPLES) preRoll.removeFirst()
                            preRoll.addLast(sample)
                        } else {
                            work.add(sample)
                        }
                    }

                    if (!active) {
                        if (!windowActive) {
                            pendingWindows = 0
                        } else {
                            pendingWindows += 1
                        }

                        if (pendingWindows >= START_WINDOWS) {
                            active = true
                            activeWindows = pendingWindows
                            silentWindows = 0
                            currentLevel = true
                            currentLevelWindows = pendingWindows
                            transitions = 0
                            while (preRoll.isNotEmpty()) {
                                work.add(preRoll.removeFirst())
                            }
                        }
                    } else if (active) {
                        if (windowActive) {
                            activeWindows += 1
                            silentWindows = 0
                        } else {
                            silentWindows += 1
                        }

                        if (windowActive == currentLevel) {
                            currentLevelWindows += 1
                        } else {
                            pushDuration(currentLevel, currentLevelWindows)
                            transitions += 1
                            currentLevel = windowActive
                            currentLevelWindows = 1
                        }

                        if (silentWindows >= TAIL_WINDOWS ||
                            (SystemClock.uptimeMillis() - startedAt) >= MAX_CAPTURE_MS
                        ) {
                            val finalCount = if (!currentLevel) {
                                (currentLevelWindows - TAIL_WINDOWS).coerceAtLeast(0)
                            } else {
                                currentLevelWindows
                            }
                            pushDuration(currentLevel, finalCount)
                            if (activeWindows >= MIN_ACTIVE_WINDOWS && work.isNotEmpty()) {
                                val captureMs = ((work.size.toDouble() / SAMPLE_RATE) * 1000.0).toInt()
                                if (captureMs < MIN_CAPTURE_MS) {
                                    Log.i(TAG, "Discarding short audio capture ${captureMs}ms source=$source")
                                    return null
                                }
                                if (transitions < MIN_TRANSITIONS || !isValidPattern(durationsUs)) {
                                    Log.i(
                                        TAG,
                                        "Discarding weak audio capture source=$source transitions=$transitions activeWindows=$activeWindows pattern=${durationsUs.joinToString(" ")}"
                                    )
                                    return null
                                }
                                val pcmBytes = shortListToBytes(work)
                                val quality = (20 + transitions * 6).coerceIn(1, 100)
                                val previewText =
                                    "Audio learned capture\nEstimated raw timings\n$captureMs ms"
                                Log.i(TAG, "Audio capture accepted source=$source ms=$captureMs quality=$quality windows=$activeWindows")
                                return AudioLearnResult(
                                    family = "audio",
                                    rawPatternUs = durationsUs.toList(),
                                    opaqueFrameBase64 = Base64.encodeToString(pcmBytes, Base64.NO_WRAP),
                                    opaqueMeta = mode.toInt(),
                                    quality = quality,
                                    frequencyHz = DEFAULT_AUDIO_IR_FREQUENCY,
                                    displayPreview = previewText,
                                )
                            }
                            break
                        }
                    }

                    offset += WINDOW_SAMPLES
                }
            }
        } catch (t: Throwable) {
            Log.w(TAG, "learnWithRecord source=$source failed: ${t.message}", t)
        }
        return null
    }

    private fun shortListToBytes(samples: List<Short>): ByteArray {
        val out = ByteArray(samples.size * 2)
        var index = 0
        for (sample in samples) {
            out[index] = (sample.toInt() and 0xFF).toByte()
            out[index + 1] = ((sample.toInt() shr 8) and 0xFF).toByte()
            index += 2
        }
        return out
    }
}
