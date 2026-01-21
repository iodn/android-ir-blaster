# Android IR Blaster

<a href="https://play.google.com/store/apps/details?id=org.nslabs.ir_blaster">
<img src="fastlane/metadata/android/en-US/images/icon.png" width="160" alt="Android Infrared Blaster icon" align="left" style="border: solid 1px #ddd;"/>
</a>
<div>
<h3 style="font-size: 2.2rem; letter-spacing: 1px;">IR Blaster Remote</h3>
<p style="font-size: 1.15rem; font-weight: 500;">
    <strong>Universal IR Remote for Android</strong><br>
    <strong>IR Blaster</strong> is an Android application for creating, managing, and transmitting infrared (IR) signals through multiple output methods, including a device’s built-in IR emitter, supported USB IR dongles, and audio-to-IR LED adapters.

The app enables users to build fully custom remotes, discover unknown IR codes through guided brute-force tools, and seamlessly manage IR configurations. It also supports importing IR signals from Flipper Zero `.ir` files, **IRPLUS `.irplus` / XML files**, and **LIRC `.conf` / `.cfg` / `.lirc` files**, making it easy to reuse and adapt existing IR libraries across devices.

IR Blaster is designed to be flexible, hardware-agnostic, and user-friendly, while remaining powerful enough for advanced users who need precise control over IR protocols and signal timing.

  </p>

<div align="center">

  [![GitHub License](https://img.shields.io/github/license/iodn/android-ir-blaster)](LICENSE)
  [![Issues](https://img.shields.io/github/issues/iodn/android-ir-blaster.svg)](https://github.com/iodn/android-ir-blaster/issues)
  [![Pull Requests](https://img.shields.io/github/issues-pr/iodn/android-ir-blaster.svg)](https://github.com/iodn/android-ir-blaster/pulls)
  [![Android Version](https://img.shields.io/badge/Android-11.0%2B-green.svg)](https://www.android.com)
  
<div style="display:flex; align-items:center; gap:12px; flex-wrap:wrap;">
  <a href="https://f-droid.org/en/packages/org.nslabs.ir_blaster/" style="display:inline-flex; align-items:center;">
    <img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
         alt="Get it on F-Droid"
         style="display:block; height:90px; width:auto;">
  </a>

  <a href="https://play.google.com/store/apps/details?id=org.nslabs.ir_blaster" style="display:inline-flex; align-items:center;">
    <img src="https://raw.githubusercontent.com/pioug/google-play-badges/06ccd9252af1501613da2ca28eaffe31307a4e6d/svg/English.svg"
         alt="Get it on Google Play"
         style="display:block; height:70px; width:auto;">
  </a>
</div>



</div>


## Overview

- Multiple transmit paths (no built‑in IR required):
  - Internal (ConsumerIrManager) when the device has a hardware IR emitter
  - USB IR dongle (with discovery, permission, and bulk transfers)
  - Audio IR (mono 1‑LED or stereo anti‑phase 2‑LED adapters)
- Rich protocol support and a raw‑signal mode for precise mark/space patterns
- Import/export of remotes, including Flipper Zero `.ir`, IRPLUS `.irplus` / XML, LIRC `.conf` / `.cfg` / `.lirc` files, and JSON backups
- Material 3 UI with dynamic color, dark mode, and a tabbed layout (Remotes, Signal Tester, Settings)

Tip: At least one transmit path must be available (Internal, USB, or Audio). A built‑in IR blaster is not required if you use a USB dongle or audio adapter.

## Features

- Custom Remote Commands: Create and manage remotes using protocol encoders or raw IR patterns.
- Signal Tester (IR Finder / Infrared Bruteforcer): Systematically try protocol/code variations to discover working signals.
- Transmitter Selection & Auto Switch:
  - Choose Internal, USB, Audio (1 LED), or Audio (2 LEDs) under Settings > IR Transmitter.
  - Optional Auto Switch uses USB when a supported dongle is attached, otherwise Internal (disabled if Audio is selected).
- Import/Export & Maintenance (Settings > Remotes):
  - Import JSON backups, Flipper Zero `.ir`, IRPLUS `.irplus` / XML (beta), and LIRC `.conf` / `.cfg` / `.lirc` (beta) files
  - Export remotes to Downloads
  - Restore the built‑in demo remote
  - Delete all remotes
- Modern UI: Material 3 styling, dynamic color, and responsive layouts.


### User‑facing
- Transmitter selection card with live capability updates and USB permission request flow.
- Signal Tester promoted as an IR bruteforcer (IR Finder) to help discover unknown codes.
- Expanded import/export options and maintenance actions for remotes.
- Material 3 theming with dynamic light/dark color schemes.

### Technical/architectural
- Multi‑transmitter architecture:
  - Internal: Android ConsumerIrManager
  - USB: Discovery, permission, endpoint selection, and framed/bulk protocol with RLE payloads
  - Audio: AudioTrack at 48 kHz with mono or stereo anti‑phase synthesis
- Platform channels:
  - Method channel: `org.nslabs/irtransmitter`
  - Event channel: `org.nslabs/irtransmitter_events`
  - Methods: `transmit`, `transmitRaw`, `hasIrEmitter`, `getTransmitterCapabilities`, `setTransmitterType`, `getTransmitterType`,
    `getPreferredTransmitterType`, `setPreferredTransmitterType`, `getAutoSwitchEnabled`, `setAutoSwitchEnabled`,
    `usbScanAndRequest`, `usbDescribe`, `getSupportedFrequencies`
- Protocol framework: `IrProtocolDefinition` + `IrFieldDef` drive UI/validation; encoders return frequency + microsecond patterns.
- Raw signal encoder: Strict parsing, bounds checking, and safe trailing‑gap handling.
- Persistent settings via SharedPreferences: active type, preferred UI type, auto‑switch flag.

## Transmitters and Hardware Support

Configure under Settings > IR Transmitter.

- Internal IR (built‑in)
  - Uses ConsumerIrManager when available, with optional carrier frequency range reporting.
- USB IR Dongle
  - Supported device filter: Vendor IDs `0x10C4` or `0x045E`, Product ID `0x8468`; requires one interface with bulk IN/OUT endpoints.
  - Permission & discovery: Scans supported devices, requests permission via a mutable PendingIntent (Android 12+), reacts to attach/detach.
  - Framing & transfer: Handshake on open, RLE‑encoded mark/space payloads fragmented into 56‑byte chunks over bulk OUT; background reader drains bulk IN briefly.
  - Tail safety: Adjusts the last gap for even‑length patterns to accommodate device expectations.
- Audio IR
  - Modes: Audio (1 LED, mono) and Audio (2 LEDs, stereo anti‑phase).
  - Implementation: 48 kHz PCM (16‑bit). Marks are synthesized tone windows; spaces are silence.
  - Usage: Requires a compatible audio‑to‑IR LED adapter and maximum media volume.

### Auto Switch
- When enabled and if the device has Internal IR, the app prefers USB when a permitted dongle is attached, otherwise Internal.
- Selecting either Audio mode or changing type manually disables Auto Switch.

## Signal Tester (IR Finder / Infrared Bruteforcer)

The Signal Tester is designed to help discover unknown working IR commands.

### What it does
- Iterates over valid protocol/code combinations to discover a working signal for your target device.
- Sends test patterns using the currently selected transmitter path (Internal, USB, or Audio).
- Surfaces parsing errors and invalid inputs early to avoid spurious transmissions.

### Inputs & constraints
- Protocol selection and parameter fields are derived from `IrProtocolDefinition` and `IrFieldDef`.
- Hex prefix constraints are parsed and normalized via `lib/ir_finder/ir_prefix.dart`:
  - Accepts inputs like `AA`, `AA BB`, `0xAABB`, `AA:BB:CC` (spaces/colons allowed; case‑insensitive).
  - Enforces even number of hex digits; clamps to a maximum byte count; returns normalized uppercase hex.
  - Provides structured error messages when parsing fails.

### How it works (high‑level)
- Builds candidate payloads within protocol‑specific bounds, honoring any prefix constraint.
- Encodes each candidate using the selected protocol encoder into a (frequency, mark/space) pattern.
- Transmits the pattern through the active transmitter (Internal, USB, or Audio).
- Provides progress/run status in the UI and allows the session to be stopped. 
- Input validation: Every protocol encoder checks hex length/format and throws on invalid values.
- Raw signal guardrails (when testing raw):
  - Limits entries (4096), enforces positive durations, clamps frequency (10–100 kHz),
  - Auto‑pads a trailing space if the pattern ends with a mark (odd length) to complete the frame.
- USB path normalizes the final tail gap for even‑length patterns to improve dongle compatibility.

### Practical tips
- Start with the correct protocol family if known (e.g., NEC/Sony) and add a narrow hex prefix to reduce the search space.
- Prefer Internal or USB for consistent timing; use Audio with max media volume and a known‑good adapter.
- Stop the run as soon as your device reacts and save that code into a remote button.

> Implementation references: `lib/widgets/ir_finder_screen.dart`, `lib/ir_finder/ir_prefix.dart`, `lib/ir_finder/irblaster_db.dart`, `lib/ir_finder/ir_finder_models.dart`.

## Remotes Management

- Import remotes: JSON backups and Flipper Zero `.ir` files (Settings > Remotes > Import remotes).
- Export remotes: Save a JSON backup to Downloads.
- Restore Demo Remote: Reset to a built‑in demo configuration.
- Delete all remotes: Clear the entire list from this device.

## Supported Infrared Protocols

## Supported Infrared Protocols

| Protocol | Input format | Carrier (Hz) | Frame structure / timing summary | Notes |
|---|---|---:|---|---|
| Raw Signal | pattern (µs), optional frequencyHz | 10,000–100,000 (default 38,000) | Alternating mark/space durations starting with mark; tokens can be decimal/hex; comments supported; auto-append 45ms trailing space if odd length | Max 4096 entries, positive durations only; strict parsing and bounds |
| Denon | 4 hex | 38,000 | Build 13 bits = nib0(4)+nib1(4)+nib2(4)+nib3(1); duplicate to 26; encode bits with mark=280, space 860/1720; sequence = first13 + pre (c+b+[280, 43560]) + second13 + post (b+c+[280, 43560]) | Strict 4 hex digits |
| F12_relaxed | hex → first 12 bits | 38,000 | Map 0 → [422,1266], 1 → [1266,422]; adjust last slot to make total 54,000µs | Uses full hex string but only first 12 bits |
| JVC | 4 hex (16 bits MSB-first) | 38,000 | Preamble 8400/4200; each bit mark=525, space=525 (0) or 1575 (1); trailing 525 + 21000 gap; the 16-bit sequence is built twice after preamble | Strict 4 hex digits |
| NEC | up to 8 hex (left-padded) → 32 bits | 38,222 | Preamble 9000/4500; bit mark=562 + space 562 (0) or 1687 (1); trailing mark 562; pad final gap to 108,800µs | Accepts 1–8 hex; normalized to 8 |
| NEC2 | up to 8 hex (left-padded) → 32 bits | 38,222 | Same construction as NEC in this implementation | Accepts 1–8 hex; normalized to 8 |
| NECx1 | up to 8 hex (left-padded) → 32 bits | 38,400 | Preamble 4500/4500; bit mark=562 + space 562/1687; trailing 562; pad to 108,800µs | Optional helper for toggle frame |
| NECx2 | up to 8 hex (left-padded) → 32 bits | 38,400 | Single NECx-like frame padded to 108,800µs; then duplicate the whole frame back-to-back | Output is two identical frames |
| Pioneer | 8 hex → 32 bits (4 bytes MSB-first) | 40,000 | Preamble ~8500/4225; each bit mark≈500 + space≈500 (0) or ≈1500 (1); stop bit is implicit; trailing silence ≈26000; full frame sent twice | Typical 4-byte payload layout is Address + ~Address + Command + ~Command |
| Proton | 4 hex (16 bits) | 38,500 | Header 8000/4000; send last 8 bits; separator 500/8000; then first 8 bits; final 500; pad to 63,000µs | Bit mark=500; 0=500; 1=1500; strict 4 hex |
| RC5 | up to 3 hex | 36,000 | Manchester coding, unit ≈889µs; start bits + toggle bit (flips each encode); 11-bit payload MSB-first; frame padded/replaced to 114,000µs | Toggle bit maintained internally (repeat detection depends on toggle changes) |
| RC6 | hex (last 4 hex used → 16-bit payload) | 36,000 | Leader 2664/888; Manchester-like with mode bits + toggle field (toggle is double-time); payload uses T=444 timing pairs; overall layout is start+mode+toggle+addr+cmd | Uses last 4 hex digits as payload; internal toggle flips each encode |
| RCA_38 | 3 hex → 12 bits (high nibble + low byte) | 38,700 | Preamble 3840/3840; 0=[480,960], 1=[480,1920]; trailer [480,7680]; sequence duplicated | Strict 3 hex digits |
| RCC0082 | 3 hex (nibbles) | 30,300 | Prefix 22 ints [BIT=528,GAP=2640,BIT×19,END=21120], then [BIT,GAP,BIT,BIT]; build 10-bit: “0” + n0(last3) + n1(all4) + n2(first2); transition-based emission; parity-based tail then suffix (same 22) | Tail even=111,408, odd=110,880 |
| RCC2026 | 11 hex → 42 bits (from 44 padded) | 38,222 | Header 8800/4400; bit mark=550 + space 550 (0) or 1650 (1); final mark 550 + 23100; then tail [8800, 4400, 550, 90750] | Strict 11 hex; takes last 42 bits |
| REC80 | 12 hex → 48 bits (32 + 16) | 37,000 | Header 3456/1728; bit1 432/1296; bit0 432/432; tail 432/74736 | Strict 12 hex |
| RECS80 | 3 hex | 38,000 | Toggle flips each encode; bit string: “1” + toggle + n0(first3) + n0(last1) + n1(all4) + n2(first1); each bit mark=158 + space 7426 (1) or 4898 (0); end 158/45000 | Internal toggle maintained |
| RECS80_L | 3 hex | 33,300 | Same bit string as RECS80; bit1 180/8460; bit0 180/5580; end is 180 then pad to 138,000µs | Low-frequency variant; fixed frame length |
| Samsung32 | 4 hex (AA CC) → 32 bits | 38,000 | Preamble 4500/4500; each bit mark≈550 + space≈550 (0) or ≈1650 (1); standard 32-bit layout with checksum byte | Payload layout is Address + Address + Command + ~Command |
| Samsung36 | 7 hex → 36 bits (A8+B8+C4+D8+~D8) | 38,000 | Start 4500/4500; first 16 bits (500/500|1500); 500/4500 separator; last 20 bits same; final 500/59000 | Strict 7 hex; includes ~D |
| Sharp | 4 hex → 26 bits (13 doubled) | 38,000 | Build 13 bits = nib0(4)+nib1(4)+nib2(4)+nib3(first1); encode with b=[280,860]/c=[280,1720]; add d=c+b+[280,43560]; then second 13 + e=b+c+[280,43560] | Strict 4 hex; two-block structure |
| SONY12 | 3 hex → 12 bits | 40,000 | Header 2400/600; 0=600/600; 1=1200/600; remove last duration; pad to 45,000µs; duplicate frame | Strict 3 hex |
| SONY15 | 4 hex → 15 bits (from 16 padded) | 40,000 | Same timings as SONY12; remove last duration; pad to 45,000µs; duplicate frame | Strict 4 hex |
| SONY20 | 5 hex → 20 bits | 40,000 | Same timings as SONY12; remove last duration; pad to 45,000µs; duplicate frame | Strict 5 hex |
| Thomson7 | 3 hex (int) | 33,000 | Mask 0xF7F; 12 bits = last4 + toggle + first7; 0=[460,2000]; 1=[460,4600]; append 460; pad to 80,000µs; duplicate frame | Toggle maintained; hex int input with min/max |
| Kaseikyo (Panasonic) | 6 hex → 24 bits (Address12 + Command8 + VendorParity/ignored) | 37,000 | Header 3456/1728; bit mark 432, space 432 (0) or 1296 (1); this finder uses a 24-bit payload (address:12 + command:8 + low vendor nibble) to search; production encoder computes full 48-bit frame with vendor parity and 8-bit XOR parity | Use vendor defaults or provide vendor/address/command when creating a button in remotes |


Notes:
- Protocol identifiers and display names are maintained in `lib/ir/ir_protocol_registry.dart`.
- Encoders validate inputs and produce an explicit frequency (Hz) and alternating mark/space durations (µs).

## Developer Notes

### Platform channels
- Method Channel: `org.nslabs/irtransmitter`
  - `transmit`: Send encoder‑generated patterns at the encoder’s frequency.
  - `transmitRaw`: Send a raw microsecond pattern at a specified frequency.
  - `hasIrEmitter`: True if any path is available (internal, USB present, or audio available).
  - `getTransmitterCapabilities`: Returns `hasInternal`, `hasUsb`, `usbOpened`, `hasAudio`, `currentType`, `usbDevices[]`, `autoSwitchEnabled`.
  - `setTransmitterType` / `getTransmitterType`
  - `getPreferredTransmitterType` / `setPreferredTransmitterType`
  - `getAutoSwitchEnabled` / `setAutoSwitchEnabled`
  - `usbScanAndRequest`
  - `getSupportedFrequencies`
  - `usbDescribe`
- Event Channel: `org.nslabs/irtransmitter_events`
  - Emits capability snapshots on attach/detach, permission responses, and type changes.

### Audio path
- `AudioIrTransmitter` + `AudioPcmBuilder` synthesize PCM from mark/space patterns (mono or stereo anti‑phase).

### USB path
- `UsbDiscoveryManager` filters, opens, and claims interfaces; `UsbProtocolFormatter` handles handshake, RLE body, fragmentation, and tail adjustments; `UsbIrTransmitter` performs bulk I/O and runs a short‑lived background reader.

### Persistence
- `tx_type`, `ui_tx_type`, `auto_switch` in `SharedPreferences` persist user choices and auto behavior.

## Requirements

- One of the following transmit paths:
  - Built‑in IR blaster (Internal)
  - Supported USB IR dongle (VID `0x10C4` or `0x045E`, PID `0x8468`)
  - Audio‑to‑IR LED adapter (Audio modes)
- Android 11+

## Installation

1. Download the APK:

[<img src="https://raw.githubusercontent.com/pioug/google-play-badges/06ccd9252af1501613da2ca28eaffe31307a4e6d/svg/English.svg"
     alt="Get it on Google Play"
     height="80">](https://play.google.com/store/apps/details?id=org.nslabs.ir_blaster)

[<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
     alt="Get it on F-Droid"
     height="113">](https://f-droid.org/en/packages/org.nslabs.ir_blaster/)
     
Or download the latest APK from the Releases Section.

2. Install the Application:
   - Enable installation from unknown sources if needed.
   - Follow the on‑screen instructions.

3. Launch and Configure:
   - Open IR Blaster.
   - Choose your transmitter (Settings > IR Transmitter).
   - Create remotes or import a Flipper Zero `.ir` file.

## Usage

### Creating Custom Remotes
1. Open the Remotes tab.
2. Create a remote and add buttons using protocol encoders or raw patterns.
3. Save and test your buttons from the Remote view.

### Using the Signal Tester (IR Finder)
1. Open the “Signal Tester” tab.
2. Provide protocol parameters and optional hex prefix constraints.
3. Start testing; the bruteforcer will try variations to identify working signals via your selected transmitter.

### USB Notes
- When a supported USB dongle is attached, use “Request USB permission” if prompted.
- Auto Switch prefers USB when available; disable it for manual selection or Audio use.

### Audio Notes
- Use maximum media volume when transmitting via audio.
- Requires a compatible audio‑to‑IR LED adapter (mono or stereo anti‑phase).

## ScreenShots
<img width="180" height="400" alt="1" src="https://github.com/user-attachments/assets/d552259e-b1b1-4dbd-857d-a3ab38e0cf61" />
<img width="180" height="400" alt="2" src="https://github.com/user-attachments/assets/ab913545-6858-4c0e-a654-5ec524060e56" />
<img width="180" height="400" alt="4" src="https://github.com/user-attachments/assets/4a4b757c-5b95-4a99-bad5-a7331c43d58b" />
<img width="180" height="400" alt="5" src="https://github.com/user-attachments/assets/abdded4c-ed28-4ca9-8a0a-1e7466464aee" />
<img width="180" height="400" alt="6" src="https://github.com/user-attachments/assets/47f974cf-ed08-4392-aad8-0e9c7765b405" />


## Contributing

Contributions are welcome! If you'd like to help improve IR Blaster:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with your proposed changes.

## License

This project is licensed under the GNU GPLv3 License.

## Support

If you encounter any issues or have questions, please open an issue on the GitHub repository or contact the maintainer.

## Acknowledgments

IR Blaster is originally a fork of [osram-remote](https://github.com/TalkingPanda0/osram-remote). Special thanks to [TalkingPanda0](https://github.com/TalkingPanda0) for his foundational work.

## More Apps by KaijinLab!

| App                                                               | What it does                                                                   |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| **[IR Blaster](https://github.com/iodn/android-ir-blaster)**      | Control and test infrared functionality for compatible devices.                |
| **[USBDevInfo](https://github.com/iodn/android-usb-device-info)** | Inspect USB device details and behavior to understand what's really connected. |
| **[GadgetFS](https://github.com/iodn/gadgetfs)**          | Experiment with USB gadget functionality (hardware-adjacent, low-level).       |
| **[TapDucky](https://github.com/iodn/tap-ducky)**                  | A security/testing tool for controlled keystroke injection workflows.          |
| **[HIDWiggle](https://github.com/iodn/hid-wiggle)**                | A mouse jiggler built with reliability and clean UX in mind.                   |
