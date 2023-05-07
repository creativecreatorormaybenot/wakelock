@TestOn('browser')

import 'package:flutter_test/flutter_test.dart';
import 'package:wakelock/wakelock.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';
import 'package:wakelock_web/wakelock_web.dart';

void main() {
  group('$WakelockWeb', () {
    setUpAll(() async {
      // todo: the web tests do not work as the JS library import does not work.
      WakelockPlatformInterface.instance = WakelockWeb();
    });

    test('$WakelockWeb set as default instance', () {
      expect(WakelockPlatformInterface.instance, isA<WakelockWeb>());
    });

    test('initially disabled', () async {
      expect(Wakelock.enabled, completion(isFalse));
    });

    test('enable', () async {
      await Wakelock.enable();
      expect(Wakelock.enabled, completion(isTrue));
    });

    test('disable', () async {
      await Wakelock.disable();
      expect(Wakelock.enabled, completion(isFalse));
    });

    test('toggle', () async {
      await Wakelock.toggle(enable: true);
      expect(Wakelock.enabled, completion(isTrue));

      await Wakelock.toggle(enable: false);
      expect(Wakelock.enabled, completion(isFalse));
    });
  });
}
