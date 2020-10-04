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

  /// Toggles the wakelock based on the given [enable] value.
  Future<void> toggle({@required bool enable});

  /// Returns whether the wakelock is enabled or not.
  Future<bool> get isEnabled;
}
