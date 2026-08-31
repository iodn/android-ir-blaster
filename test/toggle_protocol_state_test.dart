import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir/ir_protocol_types.dart';
import 'package:irblaster_controller/ir/protocols/rc5.dart';
import 'package:irblaster_controller/ir/protocols/rc6.dart';
import 'package:irblaster_controller/ir/protocols/recs80.dart';
import 'package:irblaster_controller/ir/protocols/recs80_l.dart';
import 'package:irblaster_controller/ir/protocols/thomson7.dart';

void main() {
  test('RC5 preview does not consume the next command toggle', () {
    const encoder = Rc5ProtocolEncoder();
    encoder.encode(<String, dynamic>{
      'address': '01',
      'command': '01',
      'toggle': false,
    });

    final previewParams = <String, dynamic>{
      'address': '02',
      'command': '02',
      '_preview': true,
    };
    final sentParams = <String, dynamic>{
      'address': '03',
      'command': '03',
    };
    final preview = encoder.encode(previewParams);
    final sent = encoder.encode(sentParams);

    expect(
      _matchesExplicitToggle(encoder, previewParams, preview),
      _matchesExplicitToggle(encoder, sentParams, sent),
    );
  });

  test('RC6 preview does not consume the next command toggle', () {
    const encoder = Rc6ProtocolEncoder();
    encoder.encode(<String, dynamic>{'hex': '0101', 'toggle': false});

    final previewParams = <String, dynamic>{'hex': '0202', '_preview': true};
    final sentParams = <String, dynamic>{'hex': '0303'};
    final preview = encoder.encode(previewParams);
    final sent = encoder.encode(sentParams);

    expect(
      _matchesExplicitToggle(encoder, previewParams, preview),
      _matchesExplicitToggle(encoder, sentParams, sent),
    );
  });

  test('RECS80 preview does not consume the next command toggle', () {
    const encoder = Recs80ProtocolEncoder();
    final preview = encoder.encode(<String, dynamic>{
      'hex': '155',
      '_preview': true,
    });
    final sent = encoder.encode(<String, dynamic>{'hex': '255'});

    expect(_recs80Toggle(preview), _recs80Toggle(sent));
    expect(
      _recs80Toggle(encoder.encode(<String, dynamic>{
        'hex': '255',
        '_repeat': true,
      })),
      _recs80Toggle(sent),
    );
  });

  test('RECS80-L preview does not consume the next command toggle', () {
    const encoder = Recs80LProtocolEncoder();
    final preview = encoder.encode(<String, dynamic>{
      'hex': '355',
      '_preview': true,
    });
    final sent = encoder.encode(<String, dynamic>{'hex': '455'});

    expect(_recs80Toggle(preview), _recs80Toggle(sent));
    expect(
      _recs80Toggle(encoder.encode(<String, dynamic>{
        'hex': '455',
        '_repeat': true,
      })),
      _recs80Toggle(sent),
    );
  });

  test('Thomson7 preview does not consume the next command toggle', () {
    const encoder = Thomson7ProtocolEncoder();
    final preview = encoder.encode(<String, dynamic>{
      'code': 0x155,
      '_preview': true,
    });
    final sent = encoder.encode(<String, dynamic>{'code': 0x255});

    expect(_thomsonToggle(preview), _thomsonToggle(sent));
    expect(
      _thomsonToggle(encoder.encode(<String, dynamic>{
        'code': 0x255,
        '_repeat': true,
      })),
      _thomsonToggle(sent),
    );
  });
}

bool _matchesExplicitToggle(
  IrProtocolEncoder encoder,
  Map<String, dynamic> params,
  IrEncodeResult result,
) {
  final withoutPreview = <String, dynamic>{...params}..remove('_preview');
  final falsePattern = encoder
      .encode(<String, dynamic>{...withoutPreview, 'toggle': false})
      .pattern;
  final truePattern = encoder
      .encode(<String, dynamic>{...withoutPreview, 'toggle': true})
      .pattern;
  if (_patternsEqual(result.pattern, falsePattern)) return false;
  if (_patternsEqual(result.pattern, truePattern)) return true;
  throw StateError('Pattern does not match either toggle state');
}

bool _recs80Toggle(IrEncodeResult result) => result.pattern[3] > 6000;

bool _thomsonToggle(IrEncodeResult result) => result.pattern[9] < 3000;

bool _patternsEqual(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
