//
//  RewardBoxView.h
//
//  Code generated using QuartzCode 1.38.3 on 9/27/15.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ShareButtonView : UIView

@property (nonatomic, strong) UIButton * shareButton;

@property (nonatomic, strong) UIButton * dismissButton;


- (void)addShowShareButtonAnimation;
- (void)addShowShareButtonAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addShowShareButtonAnimationTotalDuration:(CFTimeInterval)duration completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
