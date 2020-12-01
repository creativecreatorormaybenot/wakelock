#import "WakelockPlugin.h"
#import "messages.h"

static void * mKeyPathObserverContextApplicationIsIdleTimerDisabled = &mKeyPathObserverContextApplicationIsIdleTimerDisabled;

@interface WakelockPlugin () <FLTWakelockApi>

@property (nonatomic, assign) BOOL enable;

@end

@implementation WakelockPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  WakelockPlugin* instance = [[WakelockPlugin alloc] init];
  FLTWakelockApiSetup(registrar.messenger, instance);
    
  [UIApplication.sharedApplication addObserver:instance forKeyPath:@"idleTimerDisabled" options:NSKeyValueObservingOptionNew context:mKeyPathObserverContextApplicationIsIdleTimerDisabled];
}

- (void)toggle:(FLTToggleMessage*)input error:(FlutterError**)error {
  NSNumber *enable = input.enable;
  self.enable = enable.boolValue;
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (context == mKeyPathObserverContextApplicationIsIdleTimerDisabled) {
    if (UIApplication.sharedApplication.idleTimerDisabled != self.enable) {
      UIApplication.sharedApplication.idleTimerDisabled = self.enable;
    }
  } else {
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
  }
}

- (void)dealloc {
  [UIApplication.sharedApplication removeObserver:self forKeyPath:@"idleTimerDisabled" context:mKeyPathObserverContextApplicationIsIdleTimerDisabled];
}

@end
