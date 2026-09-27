import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/ir_protocol_registry.dart';
import 'package:irblaster_controller/ir/protocols/marantz.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_search.dart';
import 'package:irblaster_controller/universal_power/power_params.dart'
    as power;
import 'package:irblaster_controller/utils/db_button_import.dart';
import 'package:irblaster_controller/utils/ir.dart';
import 'package:irblaster_controller/utils/remote.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const encoder = MarantzProtocolEncoder();
  const fields = {'address': '11', 'command': '76', 'extension': '09'};

  test(
      'normal send and repeat use the shared raw transport with correct toggle',
      () async {
    final calls = <MethodCall>[];
    const channel = MethodChannel('org.nslabs/irtransmitter');
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      return null;
    });
    addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
    const button = IRButton(
        id: 'm',
        image: 'Test',
        isImage: false,
        protocol: 'marantz',
        protocolParams: fields);
    encoder.encode({...fields, 'toggle': false});
    final expected = previewIRButton(button);
    await sendIR(button);
    await sendIR(button, repeat: true);
    await sendIR(button);
    expect(calls.map((c) => c.method),
        ['transmitRaw', 'transmitRaw', 'transmitRaw']);
    expect(calls.first.arguments['frequency'], 36000);
    expect(calls.first.arguments['list'], expected.pattern);
    expect(calls[1].arguments['list'], expected.pattern);
    expect(calls[2].arguments['list'], isNot(expected.pattern));
  });

  final vectors = jsonDecode(
      File('test/fixtures/protocols/marantz_vectors.json')
          .readAsStringSync()) as List;
  for (final v in vectors) {
    test('independent RC5x waveform: ${v['referenceParameters']}', () {
      final result = encoder.encode(
          {...Map<String, dynamic>.from(v['params']), '_preview': true});
      expect(result.frequencyHz, 36000);
      expect(result.pattern, v['pattern']);
      expect(result.pattern.every((n) => n > 0), isTrue);
      expect(result.pattern.length.isEven, isTrue);
      expect(result.pattern.reduce((a, b) => a + b), 114000);
    });
  }

  test('preview is inert, new presses toggle, explicit repeats keep the toggle',
      () {
    encoder.encode({...fields, 'toggle': false});
    final preview = encoder.encode({...fields, '_preview': true});
    expect(
        encoder.encode({...fields, '_preview': true}).pattern, preview.pattern);
    final press = encoder.encode(fields);
    expect(press.pattern, preview.pattern);
    expect(encoder.encode({...fields, '_repeat': true}).pattern, press.pattern);
    expect(encoder.encode(fields).pattern, isNot(press.pattern));
    final newPayload =
        encoder.encode({...fields, 'extension': '0A', '_repeat': true});
    expect(
        newPayload.pattern,
        encoder.encode({
          ...fields,
          'extension': '0A',
          'toggle': true,
          '_preview': true
        }).pattern);
  });

  test('rejects missing, malformed and out-of-range fields', () {
    for (final entry
        in {'address': '20', 'command': '80', 'extension': '40'}.entries) {
      expect(() => encoder.encode({...fields, entry.key: entry.value}),
          throwsArgumentError);
      expect(() => encoder.encode({...fields}..remove(entry.key)),
          throwsArgumentError);
      expect(() => encoder.encode({...fields, entry.key: -1}),
          throwsArgumentError);
      expect(() => encoder.encode({...fields, entry.key: 'GG'}),
          throwsArgumentError);
    }
    expect(() => encoder.encode({...fields, 'toggle': 'maybe'}),
        throwsArgumentError);
    expect(() => marantzParamsFromHex('123456'), throwsArgumentError);
  });

  test(
      'finder, imports, universal power and saved JSON preserve all three fields',
      () {
    expect(marantzParamsFromHex('23D89'), fields);
    expect(IrFinderParams.buildParamsForProtocol('marantz', '23D89'), fields);
    expect(power.totalHexDigitsForProtocol('marantz'), 5);
    expect(
        power.buildParamsForProtocol(protocolId: 'marantz', codeHex: '23D89'),
        fields);
    final imported = buildButtonFromDbRow(
        IrDbKeyCandidate(id: 1, protocol: 'Marantz', hexcode: '23D89'))!;
    expect(imported.protocol, 'marantz');
    expect(imported.protocolParams,
        {'address': 17, 'command': 118, 'extension': 9});
    final restored =
        IRButton.fromJson(jsonDecode(jsonEncode(imported.toJson())));
    expect(restored.protocolParams, imported.protocolParams);
    final preview = previewIRButton(restored);
    expect(preview.frequencyHz, 36000);
    expect(
        preview.pattern, encoder.encode({...fields, '_preview': true}).pattern);
  });

  test(
      'smart finder covers exactly 18 payload bits and prioritizes the extension',
      () {
    final profile = IrFinderSearchProfiles.forProtocol('marantz')!;
    expect(profile.totalHexDigits, 5);
    expect(profile.meaningfulBitCount, 18);
    expect(profile.smartGroups.first.rawBitPositions, [0, 1, 2, 3, 4, 5]);
    expect(profile.smartGroups.expand((g) => g.rawBitPositions).toSet(),
        Set.from(List.generate(18, (i) => i)));
    expect(marantzParamsFromHex('FFFFF'), marantzParamsFromHex('3FFFF'));
  });

  test('registry and finder selectors are alphabetical', () {
    final names = IrProtocolRegistry.allDefinitions()
        .map((d) => d.displayName.toLowerCase())
        .toList();
    expect(names, [...names]..sort());
    final finderNames = IrFinderSearchProfiles.protocolIds
        .map((id) => IrProtocolRegistry.displayName(id).toLowerCase())
        .toList();
    expect(finderNames, [...finderNames]..sort());
    expect(IrProtocolRegistry.isImplemented('marantz'), isTrue);
  });
}
