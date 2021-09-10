import 'package:pigeon/pigeon.dart';

/// Message for toggling the wakelock on the platform side.
class ToggleMessage {
  bool? enable;
}

/// Message for reporting the wakelock state from the platform side.
class IsEnabledMessage {
  bool? enabled;
}

@ConfigurePigeon(PigeonOptions(
  dartOut: '../wakelock_platform_interface/lib/messages.dart',
  dartTestOut: '../wakelock_platform_interface/test/messages.dart',
  objcHeaderOut: 'ios/Classes/messages.h',
  objcSourceOut: 'ios/Classes/messages.m',
  objcOptions: ObjcOptions(
    prefix: 'FLT',
  ),
  javaOut: 'android/src/main/java/creativemaybeno/wakelock/Messages.java',
  javaOptions: JavaOptions(
    package: 'creativemaybeno.wakelock',
  ),
))
@HostApi(dartHostTestHandler: 'TestWakelockApi')
abstract class WakelockApi {
  void toggle(ToggleMessage msg);

  IsEnabledMessage isEnabled();
}
