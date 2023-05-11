import 'dart:async';

import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';
import 'package:win32/win32.dart';

/// The Windows implementation of the [WakelockPlatformInterface].
///
/// This class implements the `wakelock` plugin functionality for Windows using
/// the `SetThreadExecutionState` win32 API (see https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-setthreadexecutionstate).
class WakelockWindows extends WakelockPlatformInterface {
  var _enabled = false;

  @override
  Future<void> toggle({required bool enable}) async {
    final int response;
    if (enable) {
      response = SetThreadExecutionState(ES_CONTINUOUS | ES_DISPLAY_REQUIRED);
    } else {
      response = SetThreadExecutionState(ES_CONTINUOUS);
    }

    // SetThreadExecutionState returns 0 if the operation failed.
    if (response != 0) {
      _enabled = enable;
    }
  }

  @override
  Future<bool> get enabled async => _enabled;

  @override
  bool get isMock => false;
}
