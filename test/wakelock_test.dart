import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  const MethodChannel channel = MethodChannel('wakelock');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    var enabled = false;

    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'toggle':
          enabled = methodCall.arguments['enable'];
          break;
        case 'enable':
          enabled = true;
          break;
        case 'disable':
          enabled = false;
          break;
        case 'isEnabled':
          return enabled;
        default:
          throw ArgumentError.value(methodCall.method);
      }

      return null;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isEnabled', () async {
    expect(await Wakelock.isEnabled, isFalse);
  });

  group('toggle', () {
    test('on', () async {
      await Wakelock.toggle(on: true);
      expect(await Wakelock.isEnabled, isTrue);
    });

    test('off', () async {
      await Wakelock.toggle(on: false);
      expect(await Wakelock.isEnabled, isFalse);
    });

    test('non-null assertion', () async {
      expect(() async => await Wakelock.toggle(on: null), throwsAssertionError);
    });
  });

  test('enable', () async {
    await Wakelock.enable();
    expect(await Wakelock.isEnabled, isTrue);
  });

  test('disable', () async {
    await Wakelock.disable();
    expect(await Wakelock.isEnabled, isFalse);
  });
}
