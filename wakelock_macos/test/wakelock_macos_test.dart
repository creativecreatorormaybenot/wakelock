import 'package:flutter_test/flutter_test.dart';

void main() {
  // There are currently no unit tests for the macOS implementation as we
  // ideally want to integrate with pigeon and write tests for that instead.
  // Testing for macOS is currently done using the integration tests in
  // wakelock/example.
  // This means that every change to the wakelock_macos package should be
  // tested using a local dependency in the wakelock example integration test
  // before being published. For that, we use dependency overrides in the
  // example app.
  // Consequently, the macOS implementation will be tested in CI via the
  // example integration test running on -d macos.
  test('stub', () {
    const acceptUnitTestingDefeat = true;
    expect(acceptUnitTestingDefeat, isTrue);
  });
}
