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
    [[UIApplication sharedApplication] setIdleTimerDisabled:enable.boolValue];
    result(nil);
  } else if ([@"isEnabled" isEqualToString:call.method]) {
    bool enabled = [[UIApplication sharedApplication] isIdleTimerDisabled];
    result([NSNumber numberWithBool:enabled]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
