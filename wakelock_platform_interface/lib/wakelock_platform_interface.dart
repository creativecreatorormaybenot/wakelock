import 'package:meta/meta.dart';
import 'package:wakelock_platform_interface/method_channel_wakelock.dart';

/// The interface that implementations of wakelock must implement.
///
/// Platform implementations should extend this class rather than implement it
/// because `implements` does not consider newly added methods to be breaking
/// changes. Extending this class (using `extends`) ensures that the subclass
/// will get the default implementation.
abstract class WakelockPlatformInterface {
  static WakelockPlatformInterface _instance = MethodChannelWakelock();

  /// The default instance of the [WakelockPlatformInterface] to use.
  ///
  /// Platform-specific plugins should override this with their own
  /// platform-specific class that extends [WakelockPlatformInterface] when they
  /// register themselves.
  ///
  /// Defaults to [MethodChannelWakelock].
  static WakelockPlatformInterface get instance => _instance;

  /// Sets the default instance of the [WakelockPlatformInterface].
  ///
  /// This will be removed after https://github.com/flutter/flutter/issues/43368
  /// has been resolved.
  static set instance(WakelockPlatformInterface instance) {
    if (!instance.isMock) {
      instance._verifyProvidesDefaultImplementations();
    }
    _instance = instance;
  }

  /// Only mock implementations should set this to true.
  ///
  /// Mockito mocks are implementing this class with `implements`, which is
  /// forbidden for anything other than mocks (see class docs). This property
  /// provides a backdoor for mockito mocks to skip the verification that the
  /// class is not implemented with `implements`.
  @visibleForTesting
  bool get isMock => false;

  /// Toggles the wakelock based on the given [enable] value.
  Future<void> toggle({required bool enable}) {
    throw UnimplementedError('toggle() has not been implemented.');
  }

  /// Returns whether the wakelock is enabled or not.
  Future<bool> get enabled {
    throw UnimplementedError('isEnabled has not been implemented.');
  }

  // This method makes sure that VideoPlayer isn't implemented with `implements`.
  //
  // See class doc for more details on why implementing this class is forbidden.
  //
  // This private method is called by the instance setter, which fails if the
  // class is implemented with `implements`.
  void _verifyProvidesDefaultImplementations() {}
}
