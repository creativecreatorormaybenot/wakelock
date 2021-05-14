import 'package:wakelock_platform_interface/messages.dart';
import 'package:wakelock_platform_interface/wakelock_platform_interface.dart';

/// Method channel implementation of the [WakelockPlatformInterface].
class MethodChannelWakelock extends WakelockPlatformInterface {
  final _api = WakelockApi();

  @override
  Future<bool> get enabled async {
    final message = await _api.isEnabled();

    return message.enabled!;
  }

  @override
  Future<void> toggle({required bool enable}) async {
    final message = ToggleMessage();
    message.enable = enable;

    await _api.toggle(message);
  }
}
