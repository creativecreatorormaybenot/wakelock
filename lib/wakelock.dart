import 'dart:async';

import 'package:flutter/services.dart';

/// To enable the wakelock, you can use [Wakelock.enableWakelock] and to disable it,
/// you can call [Wakelock.disableWakelock].
/// You do not need to worry about making redundant calls, e.g. calling [Wakelock.enableWakelock]
/// when the wakelock is already enabled as the plugin handles this for you.
/// If you want the flexibility to pass a [bool] to control whether the wakelock should be
/// enabled or disabled, you can use [Wakelock.toggleWakelock].
///
/// The [Wakelock.isWakelockEnabled] function allows you to retrieve the current wakelock
/// status from Android or iOS.
class Wakelock {
  static const MethodChannel _channel = const MethodChannel('wakelock');

  /// This can simply be called using `Wakelock.enableWakelock()` and does not return anything.
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> enableWakelock() =>
      _channel.invokeMethod('toggleWakelock', {'enable': true});

  /// This can simply be called using `Wakelock.disableWakelock()` and does not return anything.
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> disableWakelock() =>
      _channel.invokeMethod('toggleWakelock', {'enable': false});

  /// You can simply use this function to toggle the wakelock using a [bool] value.
  /// ```dart
  /// bool enable = true;
  /// Wakelock.toggleWakelock(enable);
  /// ```
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> toggleWakelock(bool enable) =>
      _channel.invokeMethod('toggleWakelock', {'enable': enable});

  /// If you want to retrieve the current wakelock status, you will have to call [Wakelock.isWakelockEnabled]
  /// and await its result: `bool isWakelockEnabled = await Wakelock.isWakelockEnabled()`
  static Future<bool> get isWakelockEnabled =>
      _channel.invokeMethod('isWakelockEnabled');
}
