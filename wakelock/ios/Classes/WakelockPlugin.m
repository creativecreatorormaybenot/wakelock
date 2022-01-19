#import "WakelockPlugin.h"
#import "messages.h"
#import "UIApplication+idleTimerLock.h"


@interface WakelockPlugin () <FLTWakelockApi>

@property (nonatomic, assign) BOOL enable;

@end

@implementation WakelockPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  WakelockPlugin* instance = [[WakelockPlugin alloc] init];
  FLTWakelockApiSetup(registrar.messenger, instance);
}

- (void)toggleMsg:(FLTToggleMessage*)input error:(FlutterError**)error {
  BOOL enable = [input.enable boolValue];
  if (!enable) {
    [[UIApplication sharedApplication] lock_idleTimerlockEnable:enable];//should disable first
    [self setIdleTimerDisabled:enable];
  } else {
    [self setIdleTimerDisabled:enable];
    [[UIApplication sharedApplication] lock_idleTimerlockEnable:enable];
  }
  self.enable = enable;
}

- (void)setIdleTimerDisabled:(BOOL)enable {
  BOOL enabled = [[UIApplication sharedApplication] isIdleTimerDisabled];
  if (enable!= enabled) {
    [[UIApplication sharedApplication] setIdleTimerDisabled:enable];
  }
}


- (FLTIsEnabledMessage*)isEnabledWithError:(FlutterError* __autoreleasing *)error {
  NSNumber *enabled = [NSNumber numberWithBool:[[UIApplication sharedApplication] isIdleTimerDisabled]];
  FLTIsEnabledMessage* result = [[FLTIsEnabledMessage alloc] init];
  result.enabled = enabled;
  return result;
}

- (void)setEnable:(BOOL)enable {
  _enable = enable;
}

@end
