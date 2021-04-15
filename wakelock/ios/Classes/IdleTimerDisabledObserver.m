#import "IdleTimerDisabledObserver.h"

@interface IdleTimerDisabledObserver() {
  int numObservers;
}

@end

static void * mKeyPathObserverContextApplicationIsIdleTimerDisabled = &mKeyPathObserverContextApplicationIsIdleTimerDisabled;

@implementation IdleTimerDisabledObserver

+ (IdleTimerDisabledObserver*)singleInstance {
  static IdleTimerDisabledObserver *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (void)beginObserving {
  if (numObservers == 0) {
    [UIApplication.sharedApplication addObserver:self
                                      forKeyPath:@"idleTimerDisabled"
                                         options:NSKeyValueObservingOptionNew
                                         context:mKeyPathObserverContextApplicationIsIdleTimerDisabled];
  }
  
  numObservers ++;
}

- (void)endObserving {
  numObservers --;
  
  if (numObservers == 0) {
    [UIApplication.sharedApplication removeObserver:self forKeyPath:@"idleTimerDisabled" context:mKeyPathObserverContextApplicationIsIdleTimerDisabled];
  }
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


@end
