import 'dart:async';

import 'package:flutter_driver/driver_extension.dart';
import 'package:test/test.dart';
import 'package:wakelock/wakelock.dart';
import 'package:wakelock_example/main.dart' as example;

void main() {
  final completer = Completer<String>();
  enableFlutterDriverExtension(handler: (message) => completer.future);
  // The example app tests need this.
  example.main();

  var result = 'success';

  final _expect = (dynamic value, Matcher matcher) {
    if (!matcher.matches(value, null)) {
      result = 'failure';
    }
    expect(value, matcher);
  };

  group('wakelock bare platform testing', () {
    tearDownAll(() => completer.complete(result));

    test('toggle on', () async {
      await Wakelock.toggle(on: true);

      _expect(await Wakelock.isEnabled, isTrue);
    });

    test('toggle off', () async {
      await Wakelock.toggle(on: false);

      _expect(await Wakelock.isEnabled, isFalse);
    });
  });
}
