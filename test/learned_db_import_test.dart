import 'package:flutter_test/flutter_test.dart';
import 'package:irblaster_controller/ir_finder/ir_finder_models.dart';
import 'package:irblaster_controller/ir_finder/ir_signal_matcher.dart';
import 'package:irblaster_controller/utils/learned_db_import.dart';
import 'package:irblaster_controller/utils/remote.dart';

IRButton _learned(String name) => IRButton(
      id: name,
      code: null,
      rawData: '9000 4500 560 560',
      frequency: 38000,
      image: name,
      isImage: false,
    );

IrDbKeyCandidate _key(String label, String hexcode) => IrDbKeyCandidate(
      id: 7,
      protocol: 'RC5',
      hexcode: hexcode,
      remoteId: 7,
      label: label,
    );

void main() {
  final remote = <IrDbKeyCandidate>[
    _key('POWER', '84C'),
    _key('VOL+', '850'),
    _key('VOL-', '851'),
  ];

  test('importing a suggested remote keeps every learned button', () {
    final power = _learned('My power');
    final mystery = _learned('Unknown signal');
    final buttons = mergeLearnedWithDbRemote(
      learned: <LearnedButton>[
        LearnedButton(
          power,
          const DecodedIrSignal(protocol: 'RC5', hexcode: '84C'),
        ),
        // The app could not identify this one; it must not be dropped.
        LearnedButton(mystery, null),
      ],
      remoteKeys: remote,
    );

    expect(buttons.take(2).toList(), <IRButton>[power, mystery]);
    // The learned POWER code is not added a second time from the database.
    expect(buttons.skip(2).map((b) => b.image).toList(), <String>['VOL+', 'VOL-']);
  });

  test('only an exact code match replaces a database key', () {
    final buttons = mergeLearnedWithDbRemote(
      learned: <LearnedButton>[
        LearnedButton(
          _learned('Learned'),
          // Same address and low command bits as 84C but another command.
          const DecodedIrSignal(protocol: 'RC5', hexcode: '04C'),
        ),
      ],
      remoteKeys: remote,
    );
    expect(buttons.map((b) => b.image).toList(),
        <String>['Learned', 'POWER', 'VOL+', 'VOL-']);
  });

  test('without learned buttons the whole remote is imported', () {
    final buttons = mergeLearnedWithDbRemote(
      learned: const <LearnedButton>[],
      remoteKeys: remote,
    );
    expect(buttons.map((b) => b.image).toList(), <String>['POWER', 'VOL+', 'VOL-']);
  });
}
