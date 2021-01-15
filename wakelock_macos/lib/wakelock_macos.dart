import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

class WakelockMacos extends WakelockPlatformInterface {
  static const MethodChannel _channel = const MethodChannel('wakelock_macos');

  @override
  Future<void> toggle({required bool enable}) async {
    await _channel.invokeMethod('toggle', <String, dynamic>{
      'enable': enable,
    });
  }

  @override
  Future<bool> get enabled async {
    final enabled = await _channel.invokeMethod('enabled');
    return enabled;
  }
}
