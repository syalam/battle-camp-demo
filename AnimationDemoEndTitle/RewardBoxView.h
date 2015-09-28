//
//  RewardBoxView.h
//
//  Code generated using QuartzCode 1.38.3 on 9/27/15.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface RewardBoxView : UIView

@property (nonatomic, strong) NSString * rewardText;
@property (nonatomic, strong) UIImage * rewardIcon;



- (void)addShowRewardBoxAnimation;
- (void)addShowRewardBoxAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
