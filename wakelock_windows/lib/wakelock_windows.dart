import 'dart:async';

import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';
import 'package:win32/win32.dart';

const _ES_CONTINUOUS = 0x80000000;
const _ES_DISPLAY_REQUIRED = 0x00000002;


/// The windows implementation of the [WakelockPlatformInterface].
///
/// This class implements the `wakelock` plugin functionality for windows.
///
class WakelockWindows extends WakelockPlatformInterface {
  bool _isEnabled = false;

  @override
  Future<void> toggle({required bool enable}) async {
    if (enable) {
      SetThreadExecutionState(_ES_CONTINUOUS | _ES_DISPLAY_REQUIRED);
    } else {
      SetThreadExecutionState(_ES_CONTINUOUS);
    }
    _isEnabled = enable;
  }

  @override
  Future<bool> get enabled async => _isEnabled;

  @override
  bool get isMock => false;
}
