#import "WakelockPlugin.h"

@implementation WakelockPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"wakelock"
            binaryMessenger:[registrar messenger]];
  WakelockPlugin* instance = [[WakelockPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"toggle" isEqualToString:call.method]) {
    NSNumber *enable = call.arguments[@"enable"];
    NSNumber *enabled = [NSNumber numberWithBool:[[UIApplication sharedApplication] isIdleTimerDisabled]];

    if([enable isEqualToNumber:enabled]) {
      result(nil);
    } else {
      [[UIApplication sharedApplication] setIdleTimerDisabled:enable.boolValue];
      result(nil);
    }
  } else if ([@"isEnabled" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:[[UIApplication sharedApplication] isIdleTimerDisabled]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
