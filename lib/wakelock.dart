import 'dart:async';

import 'package:flutter/services.dart';

/// To enable the wakelock, you can use [Wakelock.enable] and to disable it,
/// you can call [Wakelock.disable].
/// You do not need to worry about making redundant calls, e.g. calling [Wakelock.enable]
/// when the wakelock is already enabled as the plugin handles this for you.
/// If you want the flexibility to pass a [bool] to control whether the wakelock should be
/// enabled or disabled, you can use [Wakelock.toggle].
///
/// The [Wakelock.isEnabled] function allows you to retrieve the current wakelock
/// status from Android or iOS.
class Wakelock {
  static const MethodChannel _channel = const MethodChannel('wakelock');

  /// This can simply be called using `Wakelock.enable()` and does not return anything.
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> enable() =>
      _channel.invokeMethod('toggle', {'enable': true});

  /// This can simply be called using `Wakelock.disable()` and does not return anything.
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> disable() =>
      _channel.invokeMethod('toggle', {'enable': false});

  /// You can simply use this function to toggle the wakelock using a [bool] value.
  /// ```dart
  /// bool enable = true;
  /// Wakelock.toggle(enable);
  /// ```
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> toggle(bool enable) =>
      _channel.invokeMethod('toggle', {'enable': enable});

  /// If you want to retrieve the current wakelock status, you will have to call [Wakelock.isEnabled]
  /// and await its result: `bool isEnabled = await Wakelock.isEnabled()`
  static Future<bool> get isEnabled => _channel.invokeMethod('isEnabled');
}
