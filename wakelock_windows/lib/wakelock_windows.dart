import 'dart:async';

import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';
import 'package:win32/win32.dart';

/// Informs the system that the state being set should remain in effect until
/// the next call that uses ES_CONTINUOUS and one of the other state flags is
/// cleared.
///
/// See https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-setthreadexecutionstate#parameters.
// ignore: constant_identifier_names
const _ES_CONTINUOUS = 0x80000000;

/// Forces the display to be on by resetting the display idle timer.
///
/// See https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-setthreadexecutionstate#parameters.
// ignore: constant_identifier_names
const _ES_DISPLAY_REQUIRED = 0x00000002;

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
      response = SetThreadExecutionState(_ES_CONTINUOUS | _ES_DISPLAY_REQUIRED);
    } else {
      response = SetThreadExecutionState(_ES_CONTINUOUS);
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
