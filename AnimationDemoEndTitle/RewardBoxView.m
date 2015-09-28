//
//  RewardBoxView.m
//
//  Code generated using QuartzCode 1.38.3 on 9/27/15.
//  www.quartzcodeapp.com
//

#import "RewardBoxView.h"
#import "QCMethod.h"

@interface RewardBoxView ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation RewardBoxView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupProperties];
        [self setupLayers];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupProperties];
        [self setupLayers];
    }
    return self;
}

-(void)setRewardIcon:(UIImage *)rewardIcon {
    _rewardIcon = rewardIcon;
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
    
}

-(void)setRewardText:(NSString *)rewardText {
    _rewardText = rewardText;
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
    
}

- (void)setupProperties{
    self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
    self.layers = [NSMutableDictionary dictionary];
    
}

- (void)setupLayers{
    //self.backgroundColor = [UIColor colorWithRed:0.118 green: 0.118 blue:0.118 alpha:1];
    
    CATextLayer * text = [CATextLayer layer];
    text.frame = CGRectMake(7.32, 88.1, 85.36, 13.06);
    [self.layer addSublayer:text];
    self.layers[@"text"] = text;
    
    CALayer * Group = [CALayer layer];
    Group.frame = CGRectMake(6, 5.81, 88, 88.5);
    [self.layer addSublayer:Group];
    self.layers[@"Group"] = Group;
    {
        CALayer * rewardBox = [CALayer layer];
        rewardBox.frame = CGRectMake(0, 0, 88, 88.5);
        [Group addSublayer:rewardBox];
        self.layers[@"rewardBox"] = rewardBox;
        CALayer * starIcon = [CALayer layer];
        starIcon.frame = CGRectMake(17.3, 18.6, 52.43, 50.95);
        [Group addSublayer:starIcon];
        self.layers[@"starIcon"] = starIcon;
    }
    
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if(!layerIds || [layerIds containsObject:@"text"]){
        CATextLayer * text = self.layers[@"text"];
        text.contentsScale   = [[UIScreen mainScreen] scale];
        text.string          = self.rewardText;
        text.font            = (__bridge CFTypeRef)@"AvenirNext-Regular";
        text.fontSize        = 9;
        text.alignmentMode   = kCAAlignmentCenter;
        text.foregroundColor = [UIColor whiteColor].CGColor;
    }
    if(!layerIds || [layerIds containsObject:@"rewardBox"]){
        CALayer * rewardBox = self.layers[@"rewardBox"];
        rewardBox.contents = (id)[UIImage imageNamed:@"rewardBox"].CGImage;
    }
    if(!layerIds || [layerIds containsObject:@"starIcon"]){
        CALayer * starIcon = self.layers[@"starIcon"];
        starIcon.contents = (id)self.rewardIcon.CGImage;
    }
    
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addShowRewardBoxAnimation{
    [self addShowRewardBoxAnimationCompletionBlock:nil];
}

- (void)addShowRewardBoxAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = 0.492;
        completionAnim.delegate = self;
        [completionAnim setValue:@"ShowRewardBox" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"ShowRewardBox"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"ShowRewardBox"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    ////Text animation
    CAKeyframeAnimation * textTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    textTransformAnim.values    = @[[NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.3, 0.3, 1), CATransform3DMakeTranslation(0, -25, 0))],
                                    [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(1.2, 1.2, 1), CATransform3DMakeTranslation(0, 5, 0))],
                                    [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    textTransformAnim.keyTimes  = @[@0, @0.721, @1];
    textTransformAnim.duration  = 0.313;
    textTransformAnim.beginTime = 0.179;
    
    CAKeyframeAnimation * textHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
    textHiddenAnim.values                = @[@YES, @YES, @NO];
    textHiddenAnim.keyTimes              = @[@0, @0.924, @1];
    textHiddenAnim.duration              = 0.198;
    
    CAAnimationGroup * textShowRewardBoxAnim = [QCMethod groupAnimations:@[textTransformAnim, textHiddenAnim] fillMode:fillMode];
    [self.layers[@"text"] addAnimation:textShowRewardBoxAnim forKey:@"textShowRewardBoxAnim"];
    
    ////Group animation
    CAKeyframeAnimation * GroupTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    GroupTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1)],
                                    [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1)],
                                    [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    GroupTransformAnim.keyTimes = @[@0, @0.593, @1];
    GroupTransformAnim.duration = 0.492;
    
    CAAnimationGroup * GroupShowRewardBoxAnim = [QCMethod groupAnimations:@[GroupTransformAnim] fillMode:fillMode];
    
    [self.layers[@"Group"] addAnimation:GroupShowRewardBoxAnim forKey:@"GroupShowRewardBoxAnim"];
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
    if (completionBlock){
        [self.completionBlocks removeObjectForKey:anim];
        if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
            [self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
            [self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
        }
        completionBlock(flag);
    }
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"ShowRewardBox"]){
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"text"] animationForKey:@"textShowRewardBoxAnim"] theLayer:self.layers[@"text"]];
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Group"] animationForKey:@"GroupShowRewardBoxAnim"] theLayer:self.layers[@"Group"]];
    }
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"ShowRewardBox"]){
        [self.layers[@"text"] removeAnimationForKey:@"textShowRewardBoxAnim"];
        [self.layers[@"Group"] removeAnimationForKey:@"GroupShowRewardBoxAnim"];
    }
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        [layer removeAllAnimations];
    }];
}

@end