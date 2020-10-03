import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() async {
  FlutterDriver driver;
  String bareTestingResult;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    bareTestingResult =
        await driver.requestData('', timeout: const Duration(minutes: 1));
  });

  tearDownAll(() => driver?.close());

  group('example app', () {
    test('wakelock is disabled at start', () async {
      await driver._expectEnabled(isFalse);
    });

    test('enable wakelock', () async {
      // Use the button in the example app instead of a direct plugin call.
      await driver.tap(find.text('enable wakelock'));

      await driver._expectEnabled(isTrue);
    });

    test('disable wakelock', () async {
      // Use the button in the example app instead of a direct plugin call.
      await driver.tap(find.text('disable wakelock'));

      await driver._expectEnabled(isFalse);
    });
  });

  test('wakelock bare platform testing', () async {
    expect(bareTestingResult, equals('success'));
  });
}

extension on FlutterDriver {
  Future<bool> _finds(SerializableFinder finder) async {
    try {
      await waitFor(finder, timeout: const Duration(milliseconds: 420));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _expectEnabled(Matcher matcher) async {
    // Check the widget in the example app.
    final result = await _finds(find.text(
        'wakelock is currently ${matcher == isTrue ? 'enabled' : 'disabled'}'));

    expect(result, isTrue);
  }
}
