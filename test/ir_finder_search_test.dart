import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_prefs.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_search.dart';

void main() {
  const List<String> finderProtocolIds = <String>[
    'nec',
    'nec2',
    'necx1',
    'necx2',
    'nrc17',
    'denon',
    'f12_relaxed',
    'jvc',
    'kaseikyo',
    'pioneer',
    'proton',
    'rc5',
    'rc6',
    'rca_38',
    'rcc0082',
    'rcc2026',
    'rec80',
    'recs80',
    'recs80_l',
    'samsung32',
    'samsung36',
    'sharp',
    'sony12',
    'sony15',
    'sony20',
    'thomson7',
    'xsat',
  ];

  test('smart search profiles cover every selectable finder protocol', () {
    expect(
      IrFinderSearchProfiles.protocolIds.toSet(),
      finderProtocolIds.toSet(),
    );

    for (final IrFinderProtocolSearchProfile profile
        in IrFinderSearchProfiles.all) {
      final Set<int> positions = <int>{};
      for (final IrFinderSearchBitGroup group in profile.smartGroups) {
        for (final int bit in group.rawBitPositions) {
          expect(bit, inInclusiveRange(0, profile.rawBitCount - 1),
              reason: profile.protocolId);
          expect(positions.add(bit), isTrue, reason: profile.protocolId);
        }
      }
      expect(positions, isNotEmpty, reason: profile.protocolId);
    }
  });

  test('mask supports interior wildcards and legacy short prefixes', () {
    final IrCodeMaskParseResult interior =
        IrCodeMask.parse('FF XX FF', totalHexDigits: 6);
    expect(interior.ok, isTrue);
    expect(interior.mask!.normalized, 'FFXXFF');

    final IrCodeMaskParseResult legacy =
        IrCodeMask.parse('0xAA 0xBB', totalHexDigits: 8);
    expect(legacy.ok, isTrue);
    expect(legacy.mask!.normalized, 'AABBXXXX');

    final IrCodeMaskParseResult wildcardPrefix =
        IrCodeMask.parse('0xXXXX', totalHexDigits: 4);
    expect(wildcardPrefix.ok, isTrue);
    expect(wildcardPrefix.mask!.normalized, 'XXXX');

    expect(
      IrCodeMask.parse('GG', totalHexDigits: 4).error,
      IrCodeMaskError.invalidCharacters,
    );
    expect(
      IrCodeMask.parse('12345', totalHexDigits: 4).error,
      IrCodeMaskError.tooLong,
    );
  });

  test('sequential mask implements suffix and interior constrained scanning',
      () {
    final IrFinderProtocolSearchProfile profile =
        IrFinderSearchProfiles.forProtocol('kaseikyo')!;
    final IrFinderSearchPlan plan = IrFinderSearchPlan(
      profile: profile,
      mask: IrCodeMask.parse('FFXXFF', totalHexDigits: 6).mask!,
      strategy: IrFinderSearchStrategy.sequential,
    );

    expect(plan.space, BigInt.from(256));
    expect(plan.codeAt(BigInt.zero), 'FF00FF');
    expect(plan.codeAt(BigInt.one), 'FF01FF');
    expect(plan.codeAt(BigInt.from(255)), 'FFFFFF');
  });

  test('smart RC5 starts with semantic command and address combinations', () {
    final IrFinderProtocolSearchProfile profile =
        IrFinderSearchProfiles.forProtocol('rc5')!;
    final IrFinderSearchPlan plan = IrFinderSearchPlan(
      profile: profile,
      mask: IrCodeMask.parse('', totalHexDigits: 3).mask!,
      strategy: IrFinderSearchStrategy.smart,
    );

    expect(plan.codeAt(BigInt.zero), '800');
    expect(plan.codeAt(BigInt.one), '801');
    expect(plan.codeAt(BigInt.two), '840');
    expect(plan.codeAt(BigInt.from(3)), '841');
  });

  test('smart search removes encoder-ignored duplicate payload bits', () {
    const Map<String, int> meaningfulBits = <String, int>{
      'denon': 13,
      'kaseikyo': 18,
      'rcc0082': 9,
      'rcc2026': 42,
      'recs80': 9,
      'recs80_l': 9,
      'sharp': 13,
      'sony15': 15,
      'thomson7': 10,
    };

    for (final MapEntry<String, int> entry in meaningfulBits.entries) {
      final IrFinderProtocolSearchProfile profile =
          IrFinderSearchProfiles.forProtocol(entry.key)!;
      final IrCodeMask mask =
          IrCodeMask.parse('', totalHexDigits: profile.totalHexDigits).mask!;
      final IrFinderSearchPlan smart = IrFinderSearchPlan(
        profile: profile,
        mask: mask,
        strategy: IrFinderSearchStrategy.smart,
      );
      final IrFinderSearchPlan sequential = IrFinderSearchPlan(
        profile: profile,
        mask: mask,
        strategy: IrFinderSearchStrategy.sequential,
      );

      expect(smart.meaningfulVariableBits, entry.value, reason: entry.key);
      expect(smart.space, BigInt.one << entry.value, reason: entry.key);
      expect(smart.space <= sequential.space, isTrue, reason: entry.key);
    }
  });

  test('smart search is deterministic and duplicate-free in early samples', () {
    for (final IrFinderProtocolSearchProfile profile
        in IrFinderSearchProfiles.all) {
      final IrFinderSearchPlan plan = IrFinderSearchPlan(
        profile: profile,
        mask:
            IrCodeMask.parse('', totalHexDigits: profile.totalHexDigits).mask!,
        strategy: IrFinderSearchStrategy.smart,
      );
      final int sampleCount =
          plan.space < BigInt.from(256) ? plan.space.toInt() : 256;
      final List<String> first = <String>[
        for (int i = 0; i < sampleCount; i++) plan.codeAt(BigInt.from(i)),
      ];
      final List<String> second = <String>[
        for (int i = 0; i < sampleCount; i++) plan.codeAt(BigInt.from(i)),
      ];

      expect(first.toSet().length, sampleCount, reason: profile.protocolId);
      expect(second, first, reason: profile.protocolId);
    }
  });

  test('smart masks keep every fixed digit unchanged', () {
    final IrFinderProtocolSearchProfile profile =
        IrFinderSearchProfiles.forProtocol('nec')!;
    final IrFinderSearchPlan plan = IrFinderSearchPlan(
      profile: profile,
      mask: IrCodeMask.parse('00XXA5XX', totalHexDigits: 8).mask!,
      strategy: IrFinderSearchStrategy.smart,
    );

    for (int i = 0; i < 512; i++) {
      final String code = plan.codeAt(BigInt.from(i));
      expect(code.substring(0, 2), '00');
      expect(code.substring(4, 6), 'A5');
    }
  });

  test('old sessions retain sequential cursor meaning', () {
    final IrFinderSessionSnapshot old = IrFinderSessionSnapshot.fromJson(
      <String, dynamic>{
        'v': 1,
        'mode': 'bruteforce',
        'protocolId': 'nec',
        'bruteCursorHex': 'ff',
      },
    );
    expect(old.bruteStrategy, IrFinderSearchStrategy.sequential);

    final IrFinderSessionSnapshot current = IrFinderSessionSnapshot.fromJson(
      <String, dynamic>{
        ...old.toJson(),
        'v': 2,
        'bruteStrategy': 'smart',
      },
    );
    expect(current.bruteStrategy, IrFinderSearchStrategy.smart);
    expect(current.toJson()['bruteStrategy'], 'smart');
  });

  test('sampled smart candidates encode for all finder protocols', () {
    for (final IrFinderProtocolSearchProfile profile
        in IrFinderSearchProfiles.all) {
      final IrFinderSearchPlan plan = IrFinderSearchPlan(
        profile: profile,
        mask:
            IrCodeMask.parse('', totalHexDigits: profile.totalHexDigits).mask!,
        strategy: IrFinderSearchStrategy.smart,
      );
      final List<BigInt> cursors = <BigInt>{
        BigInt.zero,
        if (plan.space > BigInt.one) BigInt.one,
        if (plan.space > BigInt.from(17)) BigInt.from(17),
        plan.space - BigInt.one,
      }.toList();

      for (final BigInt cursor in cursors) {
        final String code = plan.codeAt(cursor);
        final Map<String, dynamic> params =
            IrFinderParams.buildParamsForProtocol(
          profile.protocolId,
          code,
          kaseikyoVendor: '2002',
        );
        final result = IrProtocolRegistry.encoderFor(profile.protocolId).encode(
          <String, dynamic>{...params, '_preview': true},
        );
        expect(result.pattern, isNotEmpty,
            reason: '${profile.protocolId}:$code');
        expect(result.pattern.every((int duration) => duration > 0), isTrue,
            reason: '${profile.protocolId}:$code');
      }
    }
  });

  test('smart candidates produce distinct waveforms for all protocols', () {
    for (final IrFinderProtocolSearchProfile profile
        in IrFinderSearchProfiles.all) {
      final IrFinderSearchPlan plan = IrFinderSearchPlan(
        profile: profile,
        mask:
            IrCodeMask.parse('', totalHexDigits: profile.totalHexDigits).mask!,
        strategy: IrFinderSearchStrategy.smart,
      );
      final int sampleCount =
          plan.space < BigInt.from(64) ? plan.space.toInt() : 64;
      final Set<String> waveforms = <String>{};

      for (int i = 0; i < sampleCount; i++) {
        final Map<String, dynamic> params =
            IrFinderParams.buildParamsForProtocol(
          profile.protocolId,
          plan.codeAt(BigInt.from(i)),
          kaseikyoVendor: '2002',
        );
        final result = IrProtocolRegistry.encoderFor(profile.protocolId).encode(
          <String, dynamic>{...params, '_preview': true},
        );
        waveforms.add('${result.frequencyHz}:${result.pattern.join(',')}');
      }

      expect(waveforms.length, sampleCount, reason: profile.protocolId);
    }
  });
}
