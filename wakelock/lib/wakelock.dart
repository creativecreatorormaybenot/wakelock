import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:wakelock/src/windows_stub.dart'
    if (dart.library.io) 'package:wakelock_windows/wakelock_windows.dart';
import 'package:wakelock_macos/wakelock_macos.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

/// The [WakelockPlatformInterface] that is used by [Wakelock].
///
/// This needs to be exposed for testing as unit tests might run on macOS.
/// In that case, the "hacky" instance override that we use here would be
/// triggered for the unit tests, even though the unit tests should actually
/// test the `pigeon` method channel implementation. Therefore, we want to
/// override this in tests that run on macOS (where there is no actual device).
@visibleForTesting
var wakelockPlatformInstance = _defaultPlatformInstance;

/// Workaround for configuring platform instances until https://github.com/flutter/flutter/issues/52267
/// arrives on stable.
///
/// As soon as https://github.com/flutter/flutter/issues/52267#issuecomment-792302417
/// is available, this should be completely removed and both macOS & Windows
/// should use `dartPluginClass` instead.
WakelockPlatformInterface get _defaultPlatformInstance {
  // We want to return early on web as the platform checks are unsupported on
  // web.
  if (kIsWeb) return WakelockPlatformInterface.instance;

  if (Platform.isMacOS) {
    // Assigning the macOS platform instance like this is not optimal.
    // Ideally, we would use the default method channel instance on macOS,
    // however, it is not yet entirely clear how to integrate with pigeon.
    // This should just work fine and the io reference should be tree shaken
    // on web.
    return WakelockMacOS();
  }

  if (Platform.isWindows) {
    // This does not feel like the correct way to assign the Windows
    // implementation, however, the platform channels do not have to be used
    // thanks to the win32 package. See https://github.com/flutter/flutter/issues/52267.
    return WakelockWindows();
  }

  return WakelockPlatformInterface.instance;
}

/// Class providing all wakelock functionality using static members.
///
/// To enable the wakelock, you can use [Wakelock.enable] and to disable it,
/// you can call [Wakelock.disable].
/// You do not need to worry about making redundant calls, e.g. calling
/// [Wakelock.enable] when the wakelock is already enabled as the plugin handles
/// this for you, i.e. it checks the status to determine if the wakelock is
/// already enabled or disabled.
/// If you want the flexibility to pass a [bool] to control whether the wakelock
/// should be enabled or disabled, you can use [Wakelock.toggle].
///
/// The [Wakelock.enabled] getter allows you to retrieve the current wakelock
/// status of the device..
class Wakelock {
  /// Enables the wakelock.
  ///
  /// This can simply be called using `Wakelock.enable()` and does not return
  /// anything.
  /// You can await the [Future] to wait for the operation to complete.
  ///
  /// See also:
  /// * [toggle], which allows to enable or disable using a [bool] parameter.
  static Future<void> enable() => toggle(enable: true);

  /// Disables the wakelock.
  ///
  /// This can simply be called using `Wakelock.disable()` and does not return
  /// anything.
  /// You can await the [Future] to wait for the operation to complete.
  ///
  /// See also:
  /// * [toggle], which allows to enable or disable using a [bool] parameter.
  static Future<void> disable() => toggle(enable: false);

  /// Toggles the wakelock on or off.
  ///
  /// You can simply use this function to toggle the wakelock using a [bool]
  /// value (for the [enable] parameter).
  ///
  /// ```dart
  /// // This line keeps the screen on.
  /// Wakelock.toggle(enable: true);
  ///
  /// bool enableWakelock = false;
  /// // The following line disables the wakelock.
  /// Wakelock.toggle(enable: enableWakelock);
  /// ```
  ///
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> toggle({
    required bool enable,
  }) {
    return wakelockPlatformInstance.toggle(enable: enable);
  }

  /// Returns whether the wakelock is currently enabled or not.
  ///
  /// If you want to retrieve the current wakelock status, you will have to call
  /// [Wakelock.enabled] and await its result:
  ///
  /// ```dart
  /// bool wakelockEnabled = await Wakelock.enabled;
  /// ```
  static Future<bool> get enabled => wakelockPlatformInstance.enabled;
}
