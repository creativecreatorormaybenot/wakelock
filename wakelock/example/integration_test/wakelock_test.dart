import 'package:flutter_test/flutter_test.dart';

// See https://github.com/flutter/flutter/issues/71379.
// ignore: import_of_legacy_library_into_null_safe
import 'package:integration_test/integration_test.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('enabling and disabling wakelock', (WidgetTester tester) async {
    final wakelockEnabled = await Wakelock.enabled;

    // The wakelock should initially be disabled.
    expect(wakelockEnabled, isFalse);

    await Wakelock.enable();
    expect(await Wakelock.enabled, isTrue);
    await Wakelock.disable();
    expect(await Wakelock.enabled, isFalse);
  });

  testWidgets('toggling wakelock', (WidgetTester tester) async {
    await Wakelock.toggle(enable: true);
    expect(await Wakelock.enabled, isTrue);
    await Wakelock.toggle(enable: false);
    expect(await Wakelock.enabled, isFalse);
  });
}
