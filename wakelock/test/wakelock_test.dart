import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:wakelock/wakelock.dart';
import 'package:wakelock_platform_interface/messages.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('$Wakelock', () {
    late FakeWakelockApi fakeWakelock;

    setUpAll(() {
      if (Platform.isMacOS) {
        // See the member documentation for the reason behind this.
        // todo(creativecreatorormaybenot): remove this once macOS is migrated
        // todo| to pigeon.
        wakelockPlatformInstance = WakelockPlatformInterface.instance;
      }
      fakeWakelock = FakeWakelockApi();
    });

    test('enable', () async {
      await Wakelock.enable();

      expect(fakeWakelock.calls.last, 'toggle');
      expect(fakeWakelock.toggleMessage.enable, isTrue);
    });

    test('disable', () async {
      await Wakelock.disable();

      expect(fakeWakelock.calls.last, 'toggle');
      expect(fakeWakelock.toggleMessage.enable, isFalse);
    });

    test('toggle', () async {
      await Wakelock.toggle(enable: false);

      expect(fakeWakelock.calls.last, 'toggle');
      expect(fakeWakelock.toggleMessage.enable, isFalse);

      await Wakelock.toggle(enable: true);

      expect(fakeWakelock.calls.last, 'toggle');
      expect(fakeWakelock.toggleMessage.enable, isTrue);
    });

    test('enabled', () async {
      expect(Wakelock.enabled, completion(isTrue));
      expect(fakeWakelock.calls.last, 'isEnabled');
    });
  });
}

class FakeWakelockApi extends TestWakelockApi {
  FakeWakelockApi() {
    TestWakelockApi.setup(this);
  }

  final calls = <String>[];
  late ToggleMessage toggleMessage;

  @override
  IsEnabledMessage isEnabled() {
    calls.add('isEnabled');
    return IsEnabledMessage()..enabled = true;
  }

  @override
  void toggle(ToggleMessage message) {
    calls.add('toggle');
    toggleMessage = message;
    ;
  }
}
