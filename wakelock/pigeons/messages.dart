// This is fine because it is a dev dependency.
// See https://github.com/flutter/flutter/issues/71360.
// @dart=2.9
import 'package:pigeon/pigeon.dart';

/// Message for toggling the wakelock on the platform side.
class ToggleMessage {
  bool enable;
}

/// Message for reporting the wakelock state from the platform side.
class IsEnabledMessage {
  bool enabled;
}

@HostApi(dartHostTestHandler: 'TestWakelockApi')
abstract class WakelockApi {
  void toggle(ToggleMessage msg);

  IsEnabledMessage isEnabled();
}

void configurePigeon(PigeonOptions options) {
  options
    ..dartOut = '../wakelock_platform_interface/lib/messages.dart'
    ..objcHeaderOut = 'ios/Classes/messages.h'
    ..objcSourceOut = 'ios/Classes/messages.m'
    ..objcOptions.prefix = 'FLT'
    ..javaOut = 'android/src/main/java/creativemaybeno/wakelock/Messages.java'
    ..javaOptions.package = 'creativemaybeno.wakelock';
}
