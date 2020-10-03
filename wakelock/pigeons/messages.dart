import 'package:pigeon/pigeon.dart';

@HostApi(dartHostTestHandler: 'TestWakelockApi')
abstract class WakelockApi {}

void configurePlugins(PigeonOptions options) {
  options
    ..dartOut = '../wakelock_platform_interface/lib/messages.dart'
    ..objcHeaderOut = 'ios/Classes/messages.h'
    ..objcSourceOut = 'ios/Classes/messages.m'
    ..objcOptions.prefix = 'FLT'
    ..javaOut = 'android/src/main/java/creativemaybeno/wakelock/Messages.java'
    ..javaOptions.package = 'creativemaybeno.wakelock';
}
