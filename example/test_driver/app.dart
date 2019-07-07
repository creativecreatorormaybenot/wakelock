import 'dart:async';

import 'package:flutter_driver/driver_extension.dart';
import 'package:test/test.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  final Completer<String> completer = Completer();
  enableFlutterDriverExtension(handler: (_) => completer.future);
  tearDownAll(() => completer.complete(null));

  group('wakelock', () {
    test('is disabled on start', () async {
      expect(await Wakelock.isEnabled, false);
    });

    test('enable', () async {
      await Wakelock.enable();

      expect(await Wakelock.isEnabled, true);
    });

    test('disable', () async {
      await Wakelock.disable();

      expect(await Wakelock.isEnabled, false);
    });

    test('enable with toggle', () async {
      await Wakelock.toggle(on: true);

      expect(await Wakelock.isEnabled, true);
    });

    test('disable with toggle', () async {
      await Wakelock.toggle(on: false);

      expect(await Wakelock.isEnabled, false);
    });
  });
}
