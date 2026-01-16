import 'ir_protocol_types.dart';
import 'stub_protocol.dart';
import 'protocols/nec.dart';
import 'protocols/raw_signal.dart';
import 'protocols/denon.dart';
import 'protocols/f12_relaxed.dart';
import 'protocols/jvc.dart';
import 'protocols/nec2.dart';
import 'protocols/necx1.dart';
import 'protocols/necx2.dart';
import 'protocols/pioneer.dart';
import 'protocols/proton.dart';
import 'protocols/rc5.dart';
import 'protocols/rc6.dart';
import 'protocols/rca_38.dart';
import 'protocols/rcc0082.dart';
import 'protocols/rcc2026.dart';
import 'protocols/rec80.dart';
import 'protocols/recs80.dart';
import 'protocols/recs80_l.dart';
import 'protocols/samsung36.dart';
import 'protocols/kaseikyo.dart';
import 'protocols/sharp.dart';
import 'protocols/sony12.dart';
import 'protocols/sony15.dart';
import 'protocols/sony20.dart';
import 'protocols/thomson7.dart';

class IrProtocolIds {
  static const String raw = 'raw';
  static const String denon = 'denon';
  static const String f12Relaxed = 'f12_relaxed';
  static const String jvc = 'jvc';
  static const String nec = 'nec';
  static const String nec2 = 'nec2';
  static const String necx1 = 'necx1';
  static const String necx2 = 'necx2';
  static const String pioneer = 'pioneer';
  static const String proton = 'proton';
  static const String rc5 = 'rc5';
  static const String rc6 = 'rc6';
  static const String rca38 = 'rca_38';
  static const String rcc0082 = 'rcc0082';
  static const String rcc2026 = 'rcc2026';
  static const String rec80 = 'rec80';
  static const String recs80 = 'recs80';
  static const String recs80L = 'recs80_l';
  static const String samsung36 = 'samsung36';
  static const String sharp = 'sharp';
  static const String sony12 = 'sony12';
  static const String sony15 = 'sony15';
  static const String sony20 = 'sony20';
  static const String thomson7 = 'thomson7';
  static const String kaseikyo = 'kaseikyo';
}

class IrProtocolRegistry {
  static final Map<String, IrProtocolDefinition> _definitions = {
    RawSignalProtocolEncoder.protocolId: const RawSignalProtocolEncoder().definition,
    NecProtocolEncoder.protocolId: const NecProtocolEncoder().definition,

    denonProtocolDefinition.id: denonProtocolDefinition,
    f12RelaxedProtocolDefinition.id: f12RelaxedProtocolDefinition,
    jvcProtocolDefinition.id: jvcProtocolDefinition,
    nec2ProtocolDefinition.id: nec2ProtocolDefinition,
    necx1ProtocolDefinition.id: necx1ProtocolDefinition,
    necx2ProtocolDefinition.id: necx2ProtocolDefinition,
    pioneerProtocolDefinition.id: pioneerProtocolDefinition,
    protonProtocolDefinition.id: protonProtocolDefinition,
    rc5ProtocolDefinition.id: rc5ProtocolDefinition,
    rc6ProtocolDefinition.id: rc6ProtocolDefinition,
    rca38ProtocolDefinition.id: rca38ProtocolDefinition,
    rcc0082ProtocolDefinition.id: rcc0082ProtocolDefinition,
    rcc2026ProtocolDefinition.id: rcc2026ProtocolDefinition,
    rec80ProtocolDefinition.id: rec80ProtocolDefinition,
    recs80ProtocolDefinition.id: recs80ProtocolDefinition,
    recs80LProtocolDefinition.id: recs80LProtocolDefinition,
    samsung36ProtocolDefinition.id: samsung36ProtocolDefinition,
    sharpProtocolDefinition.id: sharpProtocolDefinition,
    kaseikyoProtocolDefinition.id: kaseikyoProtocolDefinition,
    sony12ProtocolDefinition.id: sony12ProtocolDefinition,
    sony15ProtocolDefinition.id: sony15ProtocolDefinition,
    sony20ProtocolDefinition.id: sony20ProtocolDefinition,
    thomson7ProtocolDefinition.id: thomson7ProtocolDefinition,
  };

  static final Map<String, IrProtocolEncoder> _encoders = {
    RawSignalProtocolEncoder.protocolId: const RawSignalProtocolEncoder(),

    DenonProtocolEncoder.protocolId: const DenonProtocolEncoder(),
    F12RelaxedProtocolEncoder.protocolId: const F12RelaxedProtocolEncoder(),
    JvcProtocolEncoder.protocolId: const JvcProtocolEncoder(),

    NecProtocolEncoder.protocolId: const NecProtocolEncoder(),
    Nec2ProtocolEncoder.protocolId: const Nec2ProtocolEncoder(),
    Necx1ProtocolEncoder.protocolId: const Necx1ProtocolEncoder(),
    Necx2ProtocolEncoder.protocolId: const Necx2ProtocolEncoder(),

    PioneerProtocolEncoder.protocolId: const PioneerProtocolEncoder(),
    ProtonProtocolEncoder.protocolId: const ProtonProtocolEncoder(),
    Rc5ProtocolEncoder.protocolId: const Rc5ProtocolEncoder(),
    Rc6ProtocolEncoder.protocolId: const Rc6ProtocolEncoder(),
    Rca38ProtocolEncoder.protocolId: const Rca38ProtocolEncoder(),

    Rcc0082ProtocolEncoder.protocolId: const Rcc0082ProtocolEncoder(),
    Rcc2026ProtocolEncoder.protocolId: const Rcc2026ProtocolEncoder(),

    Rec80ProtocolEncoder.protocolId: const Rec80ProtocolEncoder(),
    Recs80ProtocolEncoder.protocolId: const Recs80ProtocolEncoder(),
    Recs80LProtocolEncoder.protocolId: const Recs80LProtocolEncoder(),

    Samsung36ProtocolEncoder.protocolId: const Samsung36ProtocolEncoder(),
    SharpProtocolEncoder.protocolId: const SharpProtocolEncoder(),

    KaseikyoProtocolEncoder.protocolId: const KaseikyoProtocolEncoder(),

    Sony12ProtocolEncoder.protocolId: const Sony12ProtocolEncoder(),
    Sony15ProtocolEncoder.protocolId: const Sony15ProtocolEncoder(),
    Sony20ProtocolEncoder.protocolId: const Sony20ProtocolEncoder(),

    Thomson7ProtocolEncoder.protocolId: const Thomson7ProtocolEncoder(),
  };


  static List<IrProtocolDefinition> allDefinitions() {
    final list = _definitions.values.toList(growable: false);
    list.sort((a, b) => a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()));
    return list;
  }

  static IrProtocolDefinition? definitionFor(String? id) {
    if (id == null) return null;
    return _definitions[id];
  }

  static IrProtocolEncoder encoderFor(String id) {
    final enc = _encoders[id];
    if (enc != null) return enc;

    final def = _definitions[id];
    if (def == null) {
      throw ArgumentError('Unknown protocol "$id"');
    }
    return StubIrProtocolEncoder(def);
  }

  static String displayName(String? id) {
    final def = definitionFor(id);
    return def?.displayName ?? (id ?? '');
  }

  static bool isImplemented(String? id) {
    final def = definitionFor(id);
    return def?.implemented ?? false;
  }
}
