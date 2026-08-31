# IR protocol implementation audit

Audit date: 2026-08-31

## Scope

This audit covers every selectable encoded protocol in `IrProtocolRegistry`, the
raw transport, all learned-device transports, and the paths that turn stored or
imported codes into encoder parameters:

- button create/edit and preview
- normal remote transmission
- Signal Tester
- Universal Power
- bundled IR database import
- Flipper `.ir`, LIRC, and IRPlus import

The audit does not claim hardware interoperability for devices that were not
available for physical testing. It checks protocol construction, storage and
parameter conversion against primary references and independent software
decoding where a public specification exists.

## Primary references

- [HarcToolbox IrpTransmogrifier protocol database](https://github.com/bengtmartensson/IrpTransmogrifier/blob/master/src/main/resources/IrpProtocols.xml)
- [HarcToolbox IRP/IrpTransmogrifier documentation](https://www.harctoolbox.org/IrpTransmogrifier.html)
- [Arduino-IRremote RC5/RC6 implementation](https://github.com/Arduino-IRremote/Arduino-IRremote/blob/master/src/ir_RC5_RC6.hpp)
- [Arduino-IRremote protocol implementation](https://github.com/Arduino-IRremote/Arduino-IRremote/tree/master/src)
- [Flipper Zero infrared file format](https://github.com/flipperdevices/flipperzero-firmware/blob/dev/documentation/file_formats/InfraredFileFormats.md)
- [Flipper Zero infrared protocol implementation](https://github.com/flipperdevices/flipperzero-firmware/tree/dev/lib/infrared/encoder_decoder)
- [Renesas NEC protocol application note](https://www.renesas.com/en/document/apn/rl78i1a-lighting-communications-using-rl78i1a-reception-rev300)
- [LIRC `lircd.conf` format](https://www.lirc.org/html/lircd.conf.html)
- [IRPlus format documentation](https://irplus-remote.github.io/layouting.html)
- [SB-Projects X-Sat/Mitsubishi protocol](https://www.sbprojects.net/knowledge/ir/xsat.php)

## Verification method

1. Inventory every registered definition and concrete encoder.
2. Compare carrier, framing, bit order, complements, toggle state and repeat
   behavior with the references above.
3. Generate representative app patterns and decode them with
   IrpTransmogrifier where a matching canonical protocol exists.
4. Verify every bundled database protocol imports to an encodable signal.
5. Verify every Signal Tester and Universal Power option builds valid encoder
   parameters.
6. Verify every officially supported Flipper parsed protocol and supported
   LIRC/IRPlus representation.
7. Add regressions for each confirmed mismatch before changing production code.

## Protocol matrix

| App ID | Carrier | Framing and verification | Result | Confidence |
| --- | ---: | --- | --- | --- |
| `denon` | 38 kHz | Canonical Denon 15-bit normal, inverted, normal sequence; decoded as Denon by IrpTransmogrifier. | Corrected repeat-frame inversion and covered by regression. | High |
| `f12_relaxed` | 38 kHz | 12-bit F12 biphase waveform matches canonical F12 timing; representative pattern decodes with the canonical model. | Payload width corrected to three hex digits. | High |
| `jvc` | 38 kHz | 8400/4200 header and 525/525/1575 LSB-first payload match canonical JVC. | No encoder change required. | High |
| `kaseikyo` | 37 kHz | 48-bit Kaseikyo vendor parity, genre, command, ID and XOR construction decodes as Kaseikyo. | No encoder change required; structured tester/import mapping verified. | High |
| `nec` | 38.222 kHz default | 9000/4500 header, 562/562/1687 data and stop mark match NEC. Renesas confirms LSB-first bytes and short repeat framing. | Compatibility byte-order behavior retained; explicit true per-byte LSB mode added and tested. | High for waveform; compatibility code representation is app-specific |
| `nec2` | 38.222 kHz default | Full NEC frame repeat rather than NEC short repeat; independently decodes as NEC. | No encoder change required. | High |
| `necx1` | 38.4 kHz | 4500/4500 header and full 32-bit frame match canonical NECx1. | No encoder change required. | High |
| `necx2` | 38.4 kHz | NECx1 frame repeated as the NECx2 variant; both frames independently decode. | No encoder change required. | High |
| `nrc17` | 38 kHz | Canonical synchronization frame, command frame and termination frame. | Missing synchronization/termination framing corrected and tested. | High |
| `pioneer` | 40 kHz | 8500/4225 header, complemented address/command bytes, optional second command frame; decoded as Pioneer. | Two-part database, Signal Tester and Universal Power payloads preserved. | High |
| `proton` | 38.5 kHz | Canonical two-byte Proton frame with required 4 ms separator. | Separator timing corrected and tested. | High |
| `rc5` | 36 kHz | Manchester coding, start/field/toggle/address/command layout and 7th command bit agree with Arduino-IRremote and canonical RC5. | Field-bit handling, Signal Tester, database, LIRC, IRPlus and Universal Power mappings corrected. | High |
| `rc6` | 36 kHz | Mode 0 start, mode, double-width toggle, 8-bit address and 8-bit command agree with Arduino-IRremote. | Editor/tester width and split/full LIRC/IRPlus mappings corrected. Non-mode-0 RC6 is deliberately not coerced into mode 0. | High for RC6 mode 0 |
| `rca_38` | 38.7 kHz | 24-bit RCA address, command and complements match canonical RCA-38. | Carrier, timing and payload order corrected and tested. | High |
| `rcc0082` | 30.3 kHz | Implementation matches the legacy application behavior and bundled database representation. No authoritative public protocol definition was found. | No speculative change. Database, preview, tester and transmission construction pass. | Evidence gap |
| `rcc2026` | 38.222 kHz | Implementation matches the legacy application behavior and bundled 44-bit database representation. No authoritative public protocol definition was found. | No speculative change. Database, preview, tester and transmission construction pass. | Evidence gap |
| `rec80` | 37 kHz | Implementation matches the legacy application behavior and bundled 48-bit database representation. No authoritative public protocol definition was found. | No speculative change. Database, preview, tester and transmission construction pass. | Evidence gap |
| `recs80` | 38 kHz | Canonical RECS80 pulse-position frame and toggle behavior decode against the Harc model. | Preview no longer consumes toggle state; repeat state tested. | High |
| `recs80_l` | 33.3 kHz | Matches canonical `RECS80-0068` timing and toggle behavior. | Preview no longer consumes toggle state; repeat state tested. | High |
| `samsung32` | 38 kHz | 4500/4500 header, repeated address, command and complement match official Flipper Samsung32 and canonical NEC-family representation. | Flipper and Universal Power mappings corrected. | High |
| `samsung36` | 38 kHz | 16-bit first section, separator and 20-bit second section decode as canonical Samsung36 using the database packed-code convention. | No encoder change required. | High |
| `sharp` | 38 kHz | Canonical Sharp normal, inverted, normal three-frame sequence. | Missing frame sequence corrected and tested. | High |
| `sony12` | 40 kHz | 7-bit command plus 5-bit address, LSB-first pulse-width data, sent three times; decodes as Sony12. | Three-digit packed input, field bounds, Signal Tester and Universal Power mapping corrected. | High |
| `sony15` | 40 kHz | 7-bit command plus 8-bit address, LSB-first pulse-width data, sent three times; decodes as Sony15. | Field bounds and packed Universal Power mapping corrected. | High |
| `sony20` | 40 kHz | 7-bit command plus 13-bit address, LSB-first pulse-width data, sent three times; decodes as Sony20. | Field bounds and packed Universal Power mapping corrected. | High |
| `thomson7` | 33 kHz | Canonical Thomson7 pulse-distance payload with toggle bit; generated pattern decodes against the Harc model. | Preview no longer consumes toggle state; numeric range now blocks invalid saves. | High |
| `xsat` | 38 kHz | 8000/4000 header, 526 us marks, LSB-first 8-bit address and command, and 4 ms inter-byte gap match the X-Sat reference. | No encoder change required. Some Mitsubishi hardware may require an additional repeat, but the source identifies that as device-specific rather than universal. | High for frame shape; medium for per-device repeat policy |
| `raw` | caller supplied | Positive alternating mark/space durations and bounded carrier are transported without protocol reinterpretation. | Validated in preview/transmission tests. | N/A |

## Learned transports

`audio_learned`, `elksmart_learned`, `huawei_ir_learned`,
`lge_ir_learned`, and `tiqiaa_learned` are device transport formats, not public
IR protocol encoders. They cannot be validated against an IRP definition.
Opaque transports remain device-specific; raw learned signals are validated and
sent through the stable raw transmitter. Unsupported opaque replay is rejected
before opening USB, preventing a dongle lockup.

## Import conclusions

- Flipper parsed imports are limited to protocols documented by Flipper. Unknown
  parsed names are no longer fabricated as NEC; a valid raw block still imports.
- `NECext` maps to the app's 9000/4500 NEC-compatible encoder, not `NECx1`.
- NEC42 and NEC42ext preserve all 42 bits as exact raw timings.
- LIRC `pre_data`, button data and `post_data` are joined only when they form a
  complete supported RC5 or RC6 mode-0 frame.
- IRPlus RC5 and RC6 converter pairs are reconstructed from their declared bit
  widths. Unsupported RC6 modes are not silently truncated.

## Automated coverage

- One bundled database code from every database protocol produces a valid signal.
- Every Signal Tester protocol option produces a positive timing pattern.
- Every Universal Power protocol mapping produces a positive timing pattern.
- Every official Flipper parsed protocol either imports correctly or is rejected
  explicitly when the app has no equivalent encoder.
- Protocol-specific tests cover complements, frame sequences, field widths,
  toggle state, packed-code conversion and imported split frames.

Current result: `flutter test` passes all 59 tests.

## Remaining limitations

- RCC0082, RCC2026 and REC80 need captures, manufacturer documentation or a
  second independent implementation before their legacy waveforms can be called
  externally verified. Changing them without such evidence would be riskier than
  preserving known-working compatibility.
- Hardware testing is still required across representative emitters and target
  appliances. Software decoding proves frame conformance, not electrical output
  strength, Android HAL behavior or receiver tolerance.
- RC6 support is intentionally mode 0 only. RC6A/MCE and other longer RC6 modes
  must be represented as raw timings until a dedicated encoder is implemented.
