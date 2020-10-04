#import "WakelockPlugin.h"
#import "messages.h"

@interface WakelockPlugin () <FLTWakelockApi>
@end

@implementation WakelockPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  WakelockPlugin* instance = [[WakelockPlugin alloc] init];
  FLTWakelockApiSetup(registrar.messenger, instance);
}

- (void)toggle:(FLTToggleMessage*)input error:(FlutterError**)error {
  NSNumber *enable = input.enable;
  NSNumber *enabled = [NSNumber numberWithBool:[[UIApplication sharedApplication] isIdleTimerDisabled]];
  
  if (![enable isEqualToNumber:enabled]) {
    [[UIApplication sharedApplication] setIdleTimerDisabled:enable.boolValue];
  }
}

- (FLTIsEnabledMessage*)isEnabled:(FlutterError* __autoreleasing *)error {
  NSNumber *enabled = [NSNumber numberWithBool:[[UIApplication sharedApplication] isIdleTimerDisabled]];
  
  FLTIsEnabledMessage* result = [[FLTIsEnabledMessage alloc] init];
  result.enabled = enabled;
  
  return result;
}

@end
