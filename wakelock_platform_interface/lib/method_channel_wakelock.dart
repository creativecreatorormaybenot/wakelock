// Ignoring until pigeon is migrated to null safety.
// See https://github.com/flutter/flutter/issues/71360.
// ignore: import_of_legacy_library_into_null_safe
import 'package:wakelock_platform_interface/messages.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

/// Method channel implementation of the [WakelockPlatformInterface].
class MethodChannelWakelock extends WakelockPlatformInterface {
  final _api = WakelockApi();

  @override
  Future<bool> get enabled async {
    final message = await _api.isEnabled();

    return message.enabled;
  }

  @override
  Future<void> toggle({required bool enable}) async {
    final message = ToggleMessage();
    message.enable = enable;

    await _api.toggle(message);
  }
}
