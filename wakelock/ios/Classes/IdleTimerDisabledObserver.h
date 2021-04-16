#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IdleTimerDisabledObserver : NSObject

@property BOOL enable;

+ (IdleTimerDisabledObserver*)singleInstance;

- (void) beginObserving;

- (void) endObserving;

@end

NS_ASSUME_NONNULL_END
