//
//  LevelNumberView.h
//
//  Code generated using QuartzCode 1.37.2 on 9/26/15.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface LevelNumberView : UIView



- (void)addNumberCrashingAnimation;
- (void)addNumberCrashingAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addNumberRattlingAnimation;
- (void)addNumberRattlingAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
