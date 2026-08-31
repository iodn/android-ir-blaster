
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

It also includes a GitHub Store for browsing compatible IR files directly from GitHub repositories and importing them into the app without manually downloading and moving files first. For supported USB learning dongles, Learning Mode can capture a signal from a physical remote, preview it, and save it into a new or existing remote.

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
- Import/export of remotes, including Flipper Zero `.ir`, IRPLUS `.irplus` / XML, LIRC `.conf` / `.cfg` / `.lirc` files, JSON backups, and direct GitHub browsing/import
- Learning Mode for supported USB learning dongles, with capture, preview, replay, and save flows

Tip: At least one transmit path must be available (Internal, USB, or Audio). A built‑in IR blaster is not required if you use a USB dongle or audio adapter.

## Features

- Custom Remote Commands: Create and manage remotes using protocol encoders or raw IR patterns.
- Signal Tester (IR Finder / Infrared Bruteforcer): Systematically try protocol/code variations to discover working signals.
- Transmitter Selection & Auto Switch:
  - Choose Internal, USB, Audio (1 LED), or Audio (2 LEDs) under Settings > IR Transmitter.
  - Optional Auto Switch uses USB when a supported dongle is attached, otherwise Internal (disabled if Audio is selected).
- Import/Export & Maintenance (Settings > Remotes):
  - Import JSON backups, Flipper Zero `.ir`, IRPLUS `.irplus` / XML (beta), and LIRC `.conf` / `.cfg` / `.lirc` (beta) files
  - Browse compatible files from GitHub repositories in GitHub Store and import them directly into the app
  - Export remotes to Downloads
  - Restore the built‑in demo remote
  - Delete all remotes
- Learning Mode (Settings > Learning Mode):
  - Use a supported USB learning dongle to capture a button from a physical remote
  - Preview the learned signal, replay it, and save it into a new or existing remote
- GitHub Store for browsing GitHub repositories and importing compatible IR files directly.


### User‑facing
- Transmitter selection card with live capability updates and USB permission request flow.
- Learning Mode for supported USB learning dongles, with guided capture and save flow.
- GitHub Store for browsing GitHub repositories and importing compatible IR files directly.
- Signal Tester promoted as an IR bruteforcer (IR Finder) to help discover unknown codes.
- Expanded import/export options and maintenance actions for remotes.

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
- GitHub Store: Browse GitHub repositories, preview supported files, and import them directly into your remote library.
- Export remotes: Save a JSON backup to Downloads.
- Restore Demo Remote: Reset to a built‑in demo configuration.
- Delete all remotes: Clear the entire list from this device.

## Learning Mode

- Open Settings > Learning Mode to capture a button from a physical remote with a supported USB learning dongle.
- Review the learned signal, replay it to confirm the target device reacts, then save it into a new or existing remote.
- Learning Mode is designed for compatible USB learning receivers such as supported Tiqiaa, ZaZa, or ElkSmart-style dongles.

## Supported Infrared Protocols

| Protocol | Input format | Carrier (Hz) | Frame structure / timing summary | Notes |
|---|---|---:|---|---|
| Raw Signal | pattern (µs), optional frequencyHz | 10,000–100,000 (default 38,000) | Alternating mark/space durations starting with mark; tokens can be decimal/hex; comments supported; auto-append 45ms trailing space if odd length | Max 4096 entries, positive durations only; strict parsing and bounds |
| Denon | 4 hex > 13-bit frame | 38,000 | Send the normal 13-bit frame, an inverted-command frame, then the normal frame again; mark=280, spaces 860/1720, gap=43,560µs | Strict 4 hex digits; canonical Denon repeat sequence |
| F12_relaxed | up to 3 hex > 12 bits | 38,000 | Map 0 > [422,1266], 1 > [1266,422]; adjust the final slot to make the frame total 54,000µs | Values are left-padded to 12 bits |
| JVC | 4 hex (16 bits LSB-first) | 38,000 | Preamble 8400/4200; each bit mark=525, space=525 (0) or 1575 (1); trailing 525 + 21000 gap | Strict 4 hex digits |
| NEC | up to 8 hex (left-padded) > 32 bits | 38,222 | Preamble 9000/4500; bit mark=562 + space 562 (0) or 1687 (1); trailing mark 562; pad final gap to 108,800µs | Preserves legacy MSB and byte-swap modes; True LSB sends each byte LSB-first |
| NEC2 | up to 8 hex (left-padded) > 32 bits | 38,222 | Same construction as NEC in this implementation | Accepts 1–8 hex; normalized to 8 |
| NECx1 | up to 8 hex (left-padded) > 32 bits | 38,400 | Preamble 4500/4500; bit mark=562 + space 562/1687; trailing 562; pad to 108,800µs | Optional helper for toggle frame |
| NECx2 | up to 8 hex (left-padded) > 32 bits | 38,400 | Single NECx-like frame padded to 108,800µs; then duplicate the whole frame back-to-back | Output is two identical frames |
| NRC17 | 4 hex (CCAS) | 38,000 | Synchronization frame, command frame, and termination frame; command(8) + address(4) + subcode(4) are sent LSB-first in 1ms bi-phase cells | Packed as command(2 hex) + address(1 hex) + subcode(1 hex) |
| Pioneer | address + command (1 byte each), optional secondary pair | 40,000 | Preamble 8500/4225; payload address + ~address + command + ~command, LSB-first per byte; mark=500, spaces 500/1500, gap=26,000µs | Primary frame repeats unless a secondary address and command define a two-part command |
| Proton | 4 hex (16 bits) | 38,500 | Header 8000/4000; send last 8 bits; separator 500/4000; then first 8 bits; final 500; pad to 63,000µs | Bit mark=500; 0=500; 1=1500; strict 4 hex |
| RC5 | address (5-bit) + command (7-bit) | 36,000 | RC5 bi-phase coding, unit ≈889µs; start bit, field bit, toggle, address(5), and command(6 low bits) MSB-first; rapid same-key repeats keep the toggle, new presses flip it; frame gap padded to 114,000µs | Supports commands 00–7F; legacy packed 3-hex payloads remain compatible |
| RC6 | hex (last 4 hex used > 16-bit payload) | 36,000 | Leader 2664/888; `1 = mark/space`, `0 = space/mark`; Mode 0 layout is start `1` + mode `000` + double-width toggle + 16-bit payload (addr+cmd) MSB-first using `T=444`; includes the required 6t trailing silence | Uses last 4 hex digits as payload; rapid same-key repeats keep the same toggle, new presses flip it |
| RCA_38 | address (1 hex) + command (2 hex) | 38,700 | Preamble 3680/3680; payload = address(4) + command(8) + ~address(4) + ~command(8), sent MSB-first; bit mark=460 and space=920 (0) or 1840 (1); trailer 460/7360 | 24-bit RCA frame |
| RCC0082 | 3 hex (nibbles) | 30,300 | Prefix 22 ints [BIT=528,GAP=2640,BIT×19,END=21120], then [BIT,GAP,BIT,BIT]; build 10-bit: "0" + n0(last3) + n1(all4) + n2(first2); transition-based emission; parity-based tail then suffix (same 22) | Tail even=111,408, odd=110,880 |
| RCC2026 | 11 hex > 42 bits (from 44 padded) | 38,222 | Header 8800/4400; bit mark=550 + space 550 (0) or 1650 (1); final mark 550 + 23100; then tail [8800, 4400, 550, 90750] | Strict 11 hex; takes last 42 bits |
| REC80 | 12 hex > 48 bits (32 + 16) | 37,000 | Header 3456/1728; bit1 432/1296; bit0 432/432; tail 432/74736 | Strict 12 hex |
| RECS80 | 3 hex | 38,000 | Toggle flips each encode; bit string: "1" + toggle + n0(first3) + n0(last1) + n1(all4) + n2(first1); each bit mark=158 + space 7426 (1) or 4898 (0); end 158/45000 | Internal toggle maintained |
| RECS80_L | 3 hex | 33,300 | Same bit string as RECS80; bit1 180/8460; bit0 180/5580; end is 180 then pad to 138,000µs | Low-frequency variant; fixed frame length |
| Samsung32 | address + command (1 byte each) | 38,000 | Preamble 4500/4500; each bit mark≈550 + space≈550 (0) or ≈1650 (1); 32-bit payload sent LSB-first | Payload layout is Address + Address + Command + ~Command |
| Samsung36 | 7 hex > 36 bits (A8+B8+C4+D8+~D8) | 38,000 | Start 4500/4500; first 16 bits use 500/500 or 500/1500; 500/4500 separator; last 20 bits same; final 500/59000 | Strict 7 hex; includes ~D |
| Sharp | 4 hex packed as address(5) + command(8) | 38,000 | Send normal, inverted-command, then normal 13-bit frames, LSB-first; timing uses 280/860 for 0 and 280/1720 for 1 with protocol tail blocks between frames | Strict 4 hex; packed 13-bit payload |
| SONY12 | address (5-bit) + command (7-bit) | 40,000 | Header 2400/600; payload command(7) + address(5), LSB-first; 0=600/600, 1=1200/600; pad to 45,000µs | 12-bit frame sent three times; packed imports use 3 hex digits |
| SONY15 | address (8-bit) + command (7-bit) | 40,000 | Same timings and bit order as SONY12 with a 15-bit payload; pad to 45,000µs | Frame sent three times; packed imports use 4 hex digits |
| SONY20 | address (13-bit) + command (7-bit) | 40,000 | Same timings and bit order as SONY12 with a 20-bit payload; pad to 45,000µs | Frame sent three times; packed imports use 5 hex digits |
| Thomson7 | 3 hex (int) | 33,000 | Mask 0xF7F; 12 bits = last4 + toggle + first7; 0=[460,2000]; 1=[460,4600]; append 460; pad to 80,000µs; duplicate frame | Toggle maintained; hex int input with min/max |
| XSAT (Mitsubishi) | address + command (1 byte each) | 38,000 | Header 8000/4000; address(8) then command(8), both LSB-first; each bit mark=526 + space=474 (0) or 1474 (1); inserts 4000µs separator between address and command; trailing gap sized for ~60ms repeat cadence | Packed imports are split into address and command fields |
| Kaseikyo (Panasonic) | address (4 bytes) + command (4 bytes) | 37,000 | Header 3456/1728; 48-bit frame sent LSB-first per byte; includes vendor parity, genre, 10-bit command, ID, and XOR; bit mark=432, spaces 432/1296 | Each field accepts 8 compact hex digits or four space-separated bytes |


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
2. Create a remote and add buttons using protocol encoders, raw patterns, GitHub Store imports, or buttons imported from existing remotes and the database.
3. Save and test your buttons from the Remote view.

### Using the GitHub Store
1. Open Settings > GitHub Store.
2. Enter a GitHub repository or folder URL, then load the repository when you want to browse it.
3. Open a supported file to preview how it will be parsed.
4. Import it into a new remote or add compatible buttons to an existing remote.

### Using the Signal Tester (IR Finder)
1. Open the "Signal Tester" tab.
2. Provide protocol parameters and optional hex prefix constraints.
3. Start testing; the bruteforcer will try variations to identify working signals via your selected transmitter.

### Using Learning Mode
1. Connect a supported USB learning dongle and grant USB permission if Android asks.
2. Open Settings > Learning Mode.
3. Capture one button from the original remote, replay it if needed, then save it into your library.

### USB Notes
- When a supported USB dongle is attached, use "Request USB permission" if prompted.
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

<br><br><br>
  <img src="fastlane/metadata/android/en-US/images/featureGraphic.png" alt="TapDucky Banner App" style="display:block; height:260px; width:auto;">

## Contributing

Contributions are welcome! If you'd like to help improve IR Blaster:
Please do not submit pull requests that only modify translation or localization files in `lib/l10n/*.arb`. Translation contributions are not being accepted through PRs.
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
| **[HIDWiggle](https://github.com/iodn/hid-wiggle)**                | A mouse jiggler built with USB gadget functionalities.           
| **[AKTune (Android Kernel Tweaker)](https://github.com/iodn/android-kernel-tweaker)**                | Adaptive Android kernel auto-tuner for CPU/GPU/scheduler/memory/I-O. (Magisk Module).|      
