//
//  LevelNumberView.m
//
//  Code generated using QuartzCode 1.37.2 on 9/26/15.
//  www.quartzcodeapp.com
//

#import "LevelNumberView.h"
#import "QCMethod.h"

@interface LevelNumberView ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation LevelNumberView

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

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self setupLayerFrames];
}

- (void)setBounds:(CGRect)bounds{
    [super setBounds:bounds];
    [self setupLayerFrames];
}

- (void)setupProperties{
    self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
    self.layers = [NSMutableDictionary dictionary];
    
}

- (void)setupLayers{
    //self.backgroundColor = [UIColor colorWithRed:0.0879 green: 0.09 blue:0.108 alpha:1];
    
    CALayer * glow = [CALayer layer];
    [self.layer addSublayer:glow];
    self.layers[@"glow"] = glow;
    
    CALayer * topUpArrow = [CALayer layer];
    [self.layer addSublayer:topUpArrow];
    self.layers[@"topUpArrow"] = topUpArrow;
    
    CALayer * upArrow = [CALayer layer];
    [self.layer addSublayer:upArrow];
    self.layers[@"upArrow"] = upArrow;
    
    CATextLayer * text = [CATextLayer layer];
    [self.layer addSublayer:text];
    self.layers[@"text"] = text;
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
    [self setupLayerFrames];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if(!layerIds || [layerIds containsObject:@"glow"]){
        CALayer * glow = self.layers[@"glow"];
        glow.contents = (id)[UIImage imageNamed:@"glow"].CGImage;
    }
    if(!layerIds || [layerIds containsObject:@"topUpArrow"]){
        CALayer * topUpArrow = self.layers[@"topUpArrow"];
        topUpArrow.contents = (id)[UIImage imageNamed:@"topUpArrow"].CGImage;
    }
    if(!layerIds || [layerIds containsObject:@"upArrow"]){
        CALayer * upArrow = self.layers[@"upArrow"];
        upArrow.contents = (id)[UIImage imageNamed:@"upArrow"].CGImage;
    }
    if(!layerIds || [layerIds containsObject:@"text"]){
        CATextLayer * text = self.layers[@"text"];
        text.alignmentMode            = kCAAlignmentCenter;
        text.contentsScale            = [[UIScreen mainScreen] scale];
        NSDictionary*  textAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Regular" size:100],
                                          (id)NSForegroundColorAttributeName: (id)[UIColor whiteColor].CGColor};
        NSString * textText           = @"5";
        NSAttributedString * textAttributedText = [[NSAttributedString alloc] initWithString:textText attributes:textAttributes];;
        text.string = textAttributedText;
        text.shadowColor              = [UIColor colorWithRed:0 green: 0 blue:0 alpha:0.638].CGColor;
        text.shadowOpacity = 0.64;
        text.shadowOffset  = CGSizeMake(3, 5);
        text.shadowRadius  = 5;
    }
    
    [CATransaction commit];
}

- (void)setupLayerFrames{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    CALayer * glow       = self.layers[@"glow"];
    glow.frame           = CGRectMake(0, -0.00309 * CGRectGetHeight(glow.superlayer.bounds),  CGRectGetWidth(glow.superlayer.bounds), 0.53333 * CGRectGetHeight(glow.superlayer.bounds));
    
    CALayer * topUpArrow = self.layers[@"topUpArrow"];
    topUpArrow.frame     = CGRectMake(0.14219 * CGRectGetWidth(topUpArrow.superlayer.bounds), 0.04358 * CGRectGetHeight(topUpArrow.superlayer.bounds), 0.71562 * CGRectGetWidth(topUpArrow.superlayer.bounds), 0.24375 * CGRectGetHeight(topUpArrow.superlayer.bounds));
    
    CALayer * upArrow    = self.layers[@"upArrow"];
    upArrow.frame        = CGRectMake(0.29531 * CGRectGetWidth(upArrow.superlayer.bounds), 0.21251 * CGRectGetHeight(upArrow.superlayer.bounds), 0.41562 * CGRectGetWidth(upArrow.superlayer.bounds), 0.48646 * CGRectGetHeight(upArrow.superlayer.bounds));
    
    CATextLayer * text   = self.layers[@"text"];
    text.frame           = CGRectMake(0.34504 * CGRectGetWidth(text.superlayer.bounds), 0.23044 * CGRectGetHeight(text.superlayer.bounds), 0.32063 * CGRectGetWidth(text.superlayer.bounds), 0.26852 * CGRectGetHeight(text.superlayer.bounds));
    
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addNumberCrashingAnimation{
    [self addNumberCrashingAnimationCompletionBlock:nil];
}

- (void)addNumberCrashingAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = 0.835;
        completionAnim.delegate = self;
        [completionAnim setValue:@"NumberCrashing" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"NumberCrashing"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"NumberCrashing"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    CALayer * glow = self.layers[@"glow"];
    
    ////Glow animation
    CAKeyframeAnimation * glowTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    glowTransformAnim.values    = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)],
                                    [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    glowTransformAnim.keyTimes  = @[@0, @1];
    glowTransformAnim.duration  = 0.171;
    glowTransformAnim.beginTime = 0.437;
    
    CAKeyframeAnimation * glowOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    glowOpacityAnim.values                = @[@0, @0, @1];
    glowOpacityAnim.keyTimes              = @[@0, @0.624, @1];
    glowOpacityAnim.duration              = 0.799;
    
    CAAnimationGroup * glowNumberCrashingAnim = [QCMethod groupAnimations:@[glowTransformAnim, glowOpacityAnim] fillMode:fillMode];
    [self.layers[@"glow"] addAnimation:glowNumberCrashingAnim forKey:@"glowNumberCrashingAnim"];
    
    CALayer * topUpArrow = self.layers[@"topUpArrow"];
    
    ////TopUpArrow animation
    CAKeyframeAnimation * topUpArrowTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    topUpArrowTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.3, 3, 1), CATransform3DMakeTranslation(0, 0.83333 * CGRectGetHeight(topUpArrow.superlayer.bounds), 0))],
                                               [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    topUpArrowTransformAnim.keyTimes       = @[@0, @1];
    topUpArrowTransformAnim.duration       = 0.298;
    topUpArrowTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup * topUpArrowNumberCrashingAnim = [QCMethod groupAnimations:@[topUpArrowTransformAnim] fillMode:fillMode];
    [self.layers[@"topUpArrow"] addAnimation:topUpArrowNumberCrashingAnim forKey:@"topUpArrowNumberCrashingAnim"];
    
    CALayer * upArrow = self.layers[@"upArrow"];
    
    ////UpArrow animation
    CAKeyframeAnimation * upArrowTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    upArrowTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0.5, 2.5, 1), CATransform3DMakeTranslation(0, 1.25 * CGRectGetHeight(upArrow.superlayer.bounds), 0))],
                                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    upArrowTransformAnim.keyTimes       = @[@0, @1];
    upArrowTransformAnim.duration       = 0.374;
    upArrowTransformAnim.beginTime      = 0.1;
    upArrowTransformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAKeyframeAnimation * upArrowHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
    upArrowHiddenAnim.values   = @[@YES, @NO];
    upArrowHiddenAnim.keyTimes = @[@0, @1];
    upArrowHiddenAnim.duration = 0.1;
    
    CAAnimationGroup * upArrowNumberCrashingAnim = [QCMethod groupAnimations:@[upArrowTransformAnim, upArrowHiddenAnim] fillMode:fillMode];
    [self.layers[@"upArrow"] addAnimation:upArrowNumberCrashingAnim forKey:@"upArrowNumberCrashingAnim"];
    
    CATextLayer * text = self.layers[@"text"];
    
    ////Text animation
    CAKeyframeAnimation * textTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    textTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DConcat(CATransform3DMakeScale(12, 12, 1), CATransform3DMakeTranslation(0, 0.14583 * CGRectGetHeight(text.superlayer.bounds), 0)), CATransform3DMakeRotation(-9 * M_PI/180, -0, 0, 1))],
                                         [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    textTransformAnim.keyTimes       = @[@0, @1];
    textTransformAnim.duration       = 0.507;
    textTransformAnim.beginTime      = 0.328;
    textTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.291 :0.453 :0.804 :0.129];
    
    CAKeyframeAnimation * textHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
    textHiddenAnim.values                = @[@YES, @YES, @NO];
    textHiddenAnim.keyTimes              = @[@0, @0.996, @1];
    textHiddenAnim.duration              = 0.373;
    textHiddenAnim.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup * textNumberCrashingAnim = [QCMethod groupAnimations:@[textTransformAnim, textHiddenAnim] fillMode:fillMode];
    [self.layers[@"text"] addAnimation:textNumberCrashingAnim forKey:@"textNumberCrashingAnim"];
}

- (void)addNumberRattlingAnimation{
    [self addNumberRattlingAnimationCompletionBlock:nil];
}

- (void)addNumberRattlingAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = 0.1;
        completionAnim.delegate = self;
        [completionAnim setValue:@"NumberRattling" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"NumberRattling"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"NumberRattling"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    CATextLayer * text = self.layers[@"text"];
    
    ////Text animation
    CAKeyframeAnimation * textTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    textTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DIdentity],
                                   [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-0.015625 * CGRectGetWidth(text.superlayer.bounds), -0.010417 * CGRectGetHeight(text.superlayer.bounds), 0)],
                                   [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.015625 * CGRectGetWidth(text.superlayer.bounds), 0.016667 * CGRectGetHeight(text.superlayer.bounds), 0)],
                                   [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-0.009375 * CGRectGetWidth(text.superlayer.bounds), 0.016667 * CGRectGetHeight(text.superlayer.bounds), 0)],
                                   [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    textTransformAnim.keyTimes = @[@0, @0.445, @0.232, @0.744, @1];
    textTransformAnim.duration = 0.1;
    
    CAAnimationGroup * textNumberRattlingAnim = [QCMethod groupAnimations:@[textTransformAnim] fillMode:fillMode];
    [self.layers[@"text"] addAnimation:textNumberRattlingAnim forKey:@"textNumberRattlingAnim"];
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
    if([identifier isEqualToString:@"NumberCrashing"]){
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"glow"] animationForKey:@"glowNumberCrashingAnim"] theLayer:self.layers[@"glow"]];
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"topUpArrow"] animationForKey:@"topUpArrowNumberCrashingAnim"] theLayer:self.layers[@"topUpArrow"]];
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"upArrow"] animationForKey:@"upArrowNumberCrashingAnim"] theLayer:self.layers[@"upArrow"]];
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"text"] animationForKey:@"textNumberCrashingAnim"] theLayer:self.layers[@"text"]];
    }
    else if([identifier isEqualToString:@"NumberRattling"]){
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"text"] animationForKey:@"textNumberRattlingAnim"] theLayer:self.layers[@"text"]];
    }
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"NumberCrashing"]){
        [self.layers[@"glow"] removeAnimationForKey:@"glowNumberCrashingAnim"];
        [self.layers[@"topUpArrow"] removeAnimationForKey:@"topUpArrowNumberCrashingAnim"];
        [self.layers[@"upArrow"] removeAnimationForKey:@"upArrowNumberCrashingAnim"];
        [self.layers[@"text"] removeAnimationForKey:@"textNumberCrashingAnim"];
    }
    else if([identifier isEqualToString:@"NumberRattling"]){
        [self.layers[@"text"] removeAnimationForKey:@"textNumberRattlingAnim"];
    }
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        [layer removeAllAnimations];
    }];
}

@end