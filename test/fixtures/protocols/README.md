# Protocol wire-format audit

The regression suite covers all 29 implemented encoders, the 23 protocols in
the bundled database, and every bit declared meaningful by the smart finder.
This is a software wire-format check, **not a guarantee of hardware compatibility**.

## Reference vectors

27 vectors were rendered independently with
[IrpTransmogrifier 1.2.14](https://github.com/bengtmartensson/IrpTransmogrifier/releases/tag/Version-1.2.14)
and its bundled `IrpProtocols.xml` (SHA-256
`9f3903e2111b1e8f56740fd656aa26beda8e7771de35a761a7377f999e8f0221`).
Each JSON entry records the reference protocol, parameters and repeat count.
Reproduce its numeric pattern with:

```sh
java -jar IrpTransmogrifier-1.2.14-jar-with-dependencies.jar render \
  -R --number-repeats <referenceRepeats> -n <referenceParameters> <reference>
```

RCC2026's main-frame vector is constructed independently from the
[Flipper NEC42 field layout](https://github.com/flipperdevices/flipperzero-firmware/blob/dev/lib/infrared/encoder_decoder/nec/infrared_encoder_nec.c):
13-bit address, its inverse, 8-bit command, its inverse, each LSB-first.
RAW is tested as a passthrough contract, not as a decoded protocol.

| App encoder | Reference |
| --- | --- |
| Denon, Sharp | Corresponding IRP, including normal/inverted/normal frames |
| F12_relaxed, JVC | Corresponding IRP |
| Marantz | RC5x: D=address, S=command, F=extension; four boundary/reference cases in `marantz_vectors.json` |
| NEC, NEC2, NECx1, NECx2 | NEC1, NEC2, NECx1, NECx2 respectively |
| NRC17 | NRC17 sync, command and terminator |
| Pioneer, Proton | Corresponding IRP |
| RC5, RC6 | Corresponding IRP, including extended RC5 command and RC6 double-width toggle |
| RCA_38 | RCA-38 |
| RCC0082 | Blaupunkt sync, command and terminator |
| RCC2026 | NEC42 main frame only; legacy repeat tail is not certified |
| REC80 | Panasonic 48-bit example with checksum |
| RECS80, RECS80_L | RECS80, RECS80-0068 |
| Samsung32 | NECx2 with repeated address, as used by Flipper Samsung32; not the unrelated IRP alias Samsung32 |
| Samsung36 | Samsung36 including inter-field separator and inverse command |
| Kaseikyo | Panasonic-compatible vendor example; field packing also checked against [Flipper's encoder](https://github.com/flipperdevices/flipperzero-firmware/blob/dev/lib/infrared/encoder_decoder/kaseikyo/infrared_encoder_kaseikyo.c) |
| SONY12, SONY15, SONY20 | Corresponding IRP; three frames |
| Thomson7 | Thomson7 with internal toggle |
| XSAT | Proton-family capture: separate field delimiter and stop mark |
| RAW | Exact durations/carrier; odd trailing mark receives a space |

## Confirmed corrections

Marantz was implemented independently of PR #61 using the RC5x IRP definition
and [Arduino-IRremote's protocol documentation](https://github.com/Arduino-IRremote/Arduino-IRremote/blob/master/src/ir_RC5_RC6.hpp).
It is distinct from the 7-bit-command RC5 variant also called RC5X by Flipper;
that existing import mapping is unchanged. No Marantz hardware was available
for end-to-end appliance verification.

- Denon: take the 13th wire bit, not a trailing padding bit.
- JVC: do not reverse the already wire-ordered database bytes a second time.
- Sharp: retain the first 13 wire bits rather than treating the low 13 as numeric fields.
- Thomson7: retain the first four address bits and last seven command bits around the toggle.
- XSAT: separate delimiter/stop marks prevent the last data bit being absorbed into a gap.
- RCC2026: discard two trailing padding bits, not two leading address bits.
- Smart finder: align meaningful-bit masks with those corrected formats.

JVC, Sharp, Thomson and XSAT were also checked against independent captures in
[lirc-remotes](https://github.com/probonopd/lirc-remotes/tree/e4a758048908b7e1a571dc2a89c409a33398f2f6):
`jvc/RM-S9.xml`, `sharp/1781.xml`, `thomson/RCT100.xml`,
and `xsat/XSAT_CDTV410.xml`. Focused tests identify their decoded fields.

## Scope and compatibility

- Header/data timings are compared within 10%, or 12% for Samsung36 and 15%
  for Pioneer, to accommodate existing nominal timing choices. Carrier tolerance
  is 3%. Exact bit counts and mark/space structure must match.
- Lead-out gaps are excluded from timing comparison. Repeat cadence is not
  certified; notably RC6 retains its existing short signal-free interval, and
  RCC2026 retains its existing repeat tail. No speculative timing changes were made.
- Legacy database NEC omits the final silent gap. Its stop mark and all 32 bits
  are still compared. NEC compatibility/byte-swap/true-LSB modes remain unchanged
  and retain their separate regression tests.
- The five learned-transport definitions are not ordinary protocol encoders.
  Their existing replay tests remain in the full suite; this audit does not
  validate their firmware, optical output, USB timing, or captured data quality.
- There is no automatic migration of user codes. Existing codes with manual
  workarounds for the corrected encoders may need their workarounds removed or
  buttons re-imported from the original source.
- Passing example vectors and walking every meaningful bit do not prove every
  possible payload, imported file, receiver, or malformed input works.

Run `flutter test --no-pub` for the full regression suite.
