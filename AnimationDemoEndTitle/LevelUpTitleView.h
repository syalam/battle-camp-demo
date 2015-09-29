//
//  LevelUpTitleView.h
//
//  Code generated using QuartzCode 1.37.2 on 9/26/15.
//  www.quartzcodeapp.com
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface LevelUpTitleView : UIView

@property (nonatomic, strong) UILabel * titleLabel;


- (void)addDisplayAnimation;
- (void)addDisplayAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)addDisplayAnimationTotalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
