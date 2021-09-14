#import "WakelockPlugin.h"
#import "IdleTimerDisabledObserver.h"
#import "messages.h"


@interface WakelockPlugin () <FLTWakelockApi>

@property (nonatomic, assign) BOOL enable;

@end

@implementation WakelockPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  WakelockPlugin* instance = [[WakelockPlugin alloc] init];
  FLTWakelockApiSetup(registrar.messenger, instance);
  
  [[IdleTimerDisabledObserver singleInstance] beginObserving];
}

- (void)toggleMsg:(FLTToggleMessage*)input error:(FlutterError**)error {
  NSNumber *enable = input.enable;
  self.enable = enable.boolValue;
  NSNumber *enabled = [NSNumber numberWithBool:[[UIApplication sharedApplication] isIdleTimerDisabled]];
  
  if (![enable isEqualToNumber:enabled]) {
    [[UIApplication sharedApplication] setIdleTimerDisabled:enable.boolValue];
  }
}

- (FLTIsEnabledMessage*)isEnabledWithError:(FlutterError* __autoreleasing *)error {
  NSNumber *enabled = [NSNumber numberWithBool:[[UIApplication sharedApplication] isIdleTimerDisabled]];
  
  FLTIsEnabledMessage* result = [[FLTIsEnabledMessage alloc] init];
  result.enabled = enabled;
  
  return result;
}

- (void)setEnable:(BOOL)enable {
  [IdleTimerDisabledObserver singleInstance].enable = enable;
  
  _enable = enable;
}

- (void)dealloc {
  [[IdleTimerDisabledObserver singleInstance] endObserving];
}

@end
