import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    driver?.close();
  });

  group('wakelock', () {
    test('is disabled at start', () async {
      await driver._expectEnabled(isFalse);
    });

    test('enable', () async {
      // Use the button in the example app instead of a direct plugin call.
      await driver.tap(find.text('enable wakelock'));

      await driver._expectEnabled(isTrue);
    });

    test('disable', () async {
      // Use the button in the example app instead of a direct plugin call.
      await driver.tap(find.text('disable wakelock'));

      await driver._expectEnabled(isFalse);
    });

    test('enable with toggle', () async {
      // There is no button in the example app for the toggle call.
      await Wakelock.toggle(on: true);
      // Thus, the widget needs to be refreshed manually here to
      // make the following expect succeed.
      await driver.tap(find.text('refresh wakelock status'));

      await driver._expectEnabled(isTrue);
    });

    test('disable with toggle', () async {
      // There is no button in the example app for the toggle call.
      await Wakelock.toggle(on: false);
      // Thus, the widget needs to be refreshed manually here to
      // make the following expect succeed.
      await driver.tap(find.text('refresh wakelock status'));

      await driver._expectEnabled(isFalse);
    });
  });
}

extension on FlutterDriver {
  Future<bool> _finds(SerializableFinder finder) async {
    try {
      waitFor(finder, timeout: const Duration(milliseconds: 420));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _expectEnabled(Matcher matcher) async {
    expect(await Wakelock.isEnabled, matcher);

    // Also check the widget in the example app.
    expect(await _finds(find.text('wakelock is currently ${matcher == isTrue ? 'enabled' : 'disabled'}')), isTrue);
  }
}
