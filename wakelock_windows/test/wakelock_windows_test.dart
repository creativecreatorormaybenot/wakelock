import 'package:flutter_test/flutter_test.dart';

void main() {
  // There are currently no unit tests for the Windows implementation as
  // testing for Windows is currently done using the integration tests in
  // wakelock/example.
  // This means that every change to the wakelock_windows package should be
  // tested using a local dependency in the wakelock example integration test
  // before being published. For that, we use dependency overrides in the
  // example app.
  test('stub', () {
    const acceptUnitTestingDefeat = true;
    expect(acceptUnitTestingDefeat, isTrue);
  });
}
