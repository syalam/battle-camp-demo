//
//  LevelNumberView.m
//
//  Code generated using QuartzCode 1.38.3 on 9/28/15.
//  www.quartzcodeapp.com
//

#import "LevelNumberView.h"
#import "QCMethod.h"

@interface LevelNumberView ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, assign) BOOL  animationAdded;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;


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

- (void)setNumberCrashingAnimProgress:(CGFloat)numberCrashingAnimProgress{
    if(!self.animationAdded){
        [self removeAllAnimations];
        [self addNumberCrashingAnimation];
        self.animationAdded = YES;
        self.layer.speed = 0;
        self.layer.timeOffset = 0;
    }
    else{
        CGFloat totalDuration = 0.84;
        CGFloat offset = numberCrashingAnimProgress * totalDuration;
        self.layer.timeOffset = offset;
    }
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
    self.backgroundColor = [UIColor colorWithRed:0.0879 green: 0.09 blue:0.108 alpha:1];
    
    
    UIView*  glow       = [[UIView alloc] initWithFrame:CGRectMake(0, -1, 320, 256)];
    [self addSubview:glow];
    self.layers[@"glow"] = glow;
    
    UIView*  topUpArrow       = [[UIView alloc] initWithFrame:CGRectMake(46, 21, 229, 117)];
    [self addSubview:topUpArrow];
    self.layers[@"topUpArrow"] = topUpArrow;
    
    UIView*  upArrow       = [[UIView alloc] initWithFrame:CGRectMake(94, 102, 133, 234)];
    [self addSubview:upArrow];
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
        
        UIView * glow = self.layers[@"glow"];
        glow.layer.contents = (id)[UIImage imageNamed:@"glow"].CGImage;
    }
    if(!layerIds || [layerIds containsObject:@"topUpArrow"]){
        UIView * topUpArrow = self.layers[@"topUpArrow"];
        
        topUpArrow.layer.contents = (id)[UIImage imageNamed:@"topUpArrow"].CGImage;
    }
    if(!layerIds || [layerIds containsObject:@"upArrow"]){
        UIView * upArrow = self.layers[@"upArrow"];
        
        upArrow.layer.contents = (id)[UIImage imageNamed:@"upArrow"].CGImage;
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
    
    UIView * glow       = self.layers[@"glow"];
    glow.frame          = CGRectMake(0, -0.00309 * CGRectGetHeight(glow.layer.superlayer.bounds),  CGRectGetWidth(glow.layer.superlayer.bounds), 0.53333 * CGRectGetHeight(glow.layer.superlayer.bounds));
    
    UIView * topUpArrow = self.layers[@"topUpArrow"];
    topUpArrow.frame    = CGRectMake(0.14219 * CGRectGetWidth(topUpArrow.layer.superlayer.bounds), 0.04358 * CGRectGetHeight(topUpArrow.layer.superlayer.bounds), 0.71562 * CGRectGetWidth(topUpArrow.layer.superlayer.bounds), 0.24375 * CGRectGetHeight(topUpArrow.layer.superlayer.bounds));
    
    UIView * upArrow    = self.layers[@"upArrow"];
    upArrow.frame       = CGRectMake(0.29531 * CGRectGetWidth(upArrow.layer.superlayer.bounds), 0.21251 * CGRectGetHeight(upArrow.layer.superlayer.bounds), 0.41562 * CGRectGetWidth(upArrow.layer.superlayer.bounds), 0.48646 * CGRectGetHeight(upArrow.layer.superlayer.bounds));
    
    CATextLayer * text  = self.layers[@"text"];
    text.frame          = CGRectMake(0.34504 * CGRectGetWidth(text.superlayer.bounds), 0.23044 * CGRectGetHeight(text.superlayer.bounds), 0.32063 * CGRectGetWidth(text.superlayer.bounds), 0.26852 * CGRectGetHeight(text.superlayer.bounds));
    
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addNumberCrashingAnimation{
    [self addNumberCrashingAnimationCompletionBlock:nil];
}

- (void)addNumberCrashingAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    [self addNumberCrashingAnimationTotalDuration:0.835 completionBlock:completionBlock];
}

- (void)addNumberCrashingAnimationTotalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = totalDuration;
        completionAnim.delegate = self;
        [completionAnim setValue:@"NumberCrashing" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"NumberCrashing"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"NumberCrashing"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    UIView * glow = self.layers[@"glow"];
    [UIView animateKeyframesWithDuration:0 delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.55 relativeDuration:0.21 animations:^{
            glow.transform = CGAffineTransformIdentity;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.62 animations:^{
            glow.alpha = 0;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.62 relativeDuration:0.38 animations:^{
            glow.alpha = 1;
        }];
    } completion:^(BOOL finished) {
    }];
    
    UIView * topUpArrow = self.layers[@"topUpArrow"];
    [UIView animateWithDuration:0.298 delay:0 options:0 animations:^{
        topUpArrow.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
    UIView * upArrow = self.layers[@"upArrow"];
    [UIView animateWithDuration:0.374 delay:0.1 options:0 animations:^{
        upArrow.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];
    
    CATextLayer * text = self.layers[@"text"];
    
    ////Text animation
    CAKeyframeAnimation * textTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    textTransformAnim.values         = @[[NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DConcat(CATransform3DMakeScale(12, 12, 1), CATransform3DMakeTranslation(0, 0.14583 * CGRectGetHeight(text.superlayer.bounds), 0)), CATransform3DMakeRotation(-9 * M_PI/180, -0, 0, 1))],
                                         [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    textTransformAnim.keyTimes       = @[@0, @1];
    textTransformAnim.duration       = 0.608 * totalDuration;
    textTransformAnim.beginTime      = 0.392 * totalDuration;
    textTransformAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.291 :0.453 :0.804 :0.129];
    
    CAKeyframeAnimation * textHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
    textHiddenAnim.values                = @[@YES, @YES, @NO];
    textHiddenAnim.keyTimes              = @[@0, @0.996, @1];
    textHiddenAnim.duration              = 0.447 * totalDuration;
    textHiddenAnim.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup * textNumberCrashingAnim = [QCMethod groupAnimations:@[textTransformAnim, textHiddenAnim] fillMode:fillMode];
    [text addAnimation:textNumberCrashingAnim forKey:@"textNumberCrashingAnim"];
}

- (void)addNumberRattlingAnimation{
    [self addNumberRattlingAnimationCompletionBlock:nil];
}

- (void)addNumberRattlingAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    [self addNumberRattlingAnimationTotalDuration:0.1 completionBlock:completionBlock];
}

- (void)addNumberRattlingAnimationTotalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = totalDuration;
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
    textTransformAnim.duration = totalDuration;
    
    CAAnimationGroup * textNumberRattlingAnim = [QCMethod groupAnimations:@[textTransformAnim] fillMode:fillMode];
    [text addAnimation:textNumberRattlingAnim forKey:@"textNumberRattlingAnim"];
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
    self.layer.speed = 1;
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        if([layer.class isSubclassOfClass:CALayer.class])
        [layer removeAllAnimations];
    }];
    self.layer.speed = 1;
}

@end