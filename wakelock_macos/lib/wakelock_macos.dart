import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

/// The macOS implementation of the [WakelockPlatformInterface].
///
/// This class implements the `wakelock` plugin functionality for macOS.
///
/// Note that this is *also* a method channel implementation (like the default
/// instance). We use manual method channel calls instead of `pigeon` for the
/// moment because macOS support for `pigeon` is not clear yet.
/// See https://github.com/flutter/flutter/issues/73738.
class WakelockMacOS extends WakelockPlatformInterface {
  // todo(creativecreatorormaybenot): use default method channel instance.
  static const MethodChannel _channel = MethodChannel('wakelock_macos');

  @override
  Future<void> toggle({required bool enable}) async {
    await _channel.invokeMethod('toggle', <String, dynamic>{
      'enable': enable,
    });
  }

  @override
  Future<bool> get enabled async =>
      await _channel.invokeMethod('enabled') as bool;
}
