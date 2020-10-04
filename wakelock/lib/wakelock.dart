import 'package:meta/meta.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

final _wakelockPlatformInstance = WakelockPlatformInterface.instance;

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
    @required bool enable,
    @Deprecated('Use the `enable` parameter instead.') bool on,
  }) {
    // The checks allow only `on` to be used in the case of old code and
    // they encourage to use only `enable` instead (combined with the
    // deprecation warning).
    assert(enable != null || on != null,
        'The `enable` parameter must not be null when toggling the wakelock.');
    assert(
        on == null || enable == null,
        'The `on` parameter has been deprecated; '
        'specify only the `enable` parameter instead.');

    return _wakelockPlatformInstance.toggle(enable: enable ?? on);
  }

  /// Returns whether the wakelock is currently enabled or not.
  ///
  /// If you want to retrieve the current wakelock status, you will have to call
  /// [Wakelock.enabled] and await its result:
  ///
  /// ```dart
  /// bool wakelockEnabled = await Wakelock.enabled;
  /// ```
  static Future<bool> get enabled => _wakelockPlatformInstance.enabled;

  /// Returns the current wakelock status.
  @Deprecated('Use the `enabled` getter instead.')
  static Future<bool> get isEnabled => enabled;
}
