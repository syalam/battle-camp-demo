//
//  LevelUpTitleView.m
//
//  Code generated using QuartzCode 1.37.2 on 9/26/15.
//  www.quartzcodeapp.com
//

#import "LevelUpTitleView.h"
#import "QCMethod.h"

@interface LevelUpTitleView ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation LevelUpTitleView

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
    CALayer * outeredgeglow = [CALayer layer];
    [self.layer addSublayer:outeredgeglow];
    self.layers[@"outeredgeglow"] = outeredgeglow;
    
    CATextLayer * text = [CATextLayer layer];
    [self.layer addSublayer:text];
    self.layers[@"text"] = text;
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
    [self setupLayerFrames];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if(!layerIds || [layerIds containsObject:@"outeredgeglow"]){
        CALayer * outeredgeglow = self.layers[@"outeredgeglow"];
        outeredgeglow.contents = (id)[UIImage imageNamed:@"outer-edge-glow"].CGImage;
    }
    if(!layerIds || [layerIds containsObject:@"text"]){
        CATextLayer * text = self.layers[@"text"];
        text.alignmentMode            = kCAAlignmentCenter;
        text.contentsScale            = [[UIScreen mainScreen] scale];
        NSDictionary*  textAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"GillSans-Light" size:22],
                                          (id)NSForegroundColorAttributeName: (id)[UIColor whiteColor].CGColor,
                                          NSKernAttributeName: @4};
        NSString * textText           = @"LEVEL UP";
        NSAttributedString * textAttributedText = [[NSAttributedString alloc] initWithString:textText attributes:textAttributes];;
        text.string = textAttributedText;
    }
    
    [CATransaction commit];
}

- (void)setupLayerFrames{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    CALayer * outeredgeglow = self.layers[@"outeredgeglow"];
    outeredgeglow.frame     = CGRectMake(-0.12656 * CGRectGetWidth(outeredgeglow.superlayer.bounds), -0.00556 * CGRectGetHeight(outeredgeglow.superlayer.bounds), 1.25312 * CGRectGetWidth(outeredgeglow.superlayer.bounds), 1.00556 * CGRectGetHeight(outeredgeglow.superlayer.bounds));
    
    CATextLayer * text      = self.layers[@"text"];
    text.frame              = CGRectMake(0.13155 * CGRectGetWidth(text.superlayer.bounds), 0.36306 * CGRectGetHeight(text.superlayer.bounds), 0.73846 * CGRectGetWidth(text.superlayer.bounds), 0.27387 * CGRectGetHeight(text.superlayer.bounds));
    
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addDisplayAnimation{
    [self addDisplayAnimationCompletionBlock:nil];
}

- (void)addDisplayAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = 1.199;
        completionAnim.delegate = self;
        [completionAnim setValue:@"Display" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"Display"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Display"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    CALayer * outeredgeglow = self.layers[@"outeredgeglow"];
    
    ////Outeredgeglow animation
    CAKeyframeAnimation * outeredgeglowTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    outeredgeglowTransformAnim.values    = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1)],
                                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.7, 0.4, 1)],
                                             [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    outeredgeglowTransformAnim.keyTimes  = @[@0, @0.345, @1];
    outeredgeglowTransformAnim.duration  = 0.27;
    outeredgeglowTransformAnim.beginTime = 0.294;
    
    CAKeyframeAnimation * outeredgeglowHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
    outeredgeglowHiddenAnim.values   = @[@YES, @YES, @NO];
    outeredgeglowHiddenAnim.keyTimes = @[@0, @0.892, @1];
    outeredgeglowHiddenAnim.duration = 0.333;
    
    CAAnimationGroup * outeredgeglowDisplayAnim = [QCMethod groupAnimations:@[outeredgeglowTransformAnim, outeredgeglowHiddenAnim] fillMode:fillMode];
    [self.layers[@"outeredgeglow"] addAnimation:outeredgeglowDisplayAnim forKey:@"outeredgeglowDisplayAnim"];
    
    CATextLayer * text = self.layers[@"text"];
    
    ////Text animation
    CAKeyframeAnimation * textPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    textPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(1.25 * CGRectGetWidth(text.superlayer.bounds), 0.5 * CGRectGetHeight(text.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(1.25 * CGRectGetWidth(text.superlayer.bounds), 0.5 * CGRectGetHeight(text.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.50078 * CGRectGetWidth(text.superlayer.bounds), 0.5 * CGRectGetHeight(text.superlayer.bounds))]];
    textPositionAnim.keyTimes              = @[@0, @0.19, @1];
    textPositionAnim.duration              = 0.905;
    textPositionAnim.beginTime             = 0.294;
    textPositionAnim.timingFunction        = [CAMediaTimingFunction functionWithControlPoints:0.321 :0.0204 :-0.206 :0.735];
    
    CAKeyframeAnimation * textHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
    textHiddenAnim.values                = @[@YES, @YES, @NO];
    textHiddenAnim.keyTimes              = @[@0, @0.884, @1];
    textHiddenAnim.duration              = 0.333;
    
    CAAnimationGroup * textDisplayAnim = [QCMethod groupAnimations:@[textPositionAnim, textHiddenAnim] fillMode:fillMode];
    [self.layers[@"text"] addAnimation:textDisplayAnim forKey:@"textDisplayAnim"];
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
    if([identifier isEqualToString:@"Display"]){
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"outeredgeglow"] animationForKey:@"outeredgeglowDisplayAnim"] theLayer:self.layers[@"outeredgeglow"]];
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"text"] animationForKey:@"textDisplayAnim"] theLayer:self.layers[@"text"]];
    }
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"Display"]){
        [self.layers[@"outeredgeglow"] removeAnimationForKey:@"outeredgeglowDisplayAnim"];
        [self.layers[@"text"] removeAnimationForKey:@"textDisplayAnim"];
    }
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        [layer removeAllAnimations];
    }];
}

@end