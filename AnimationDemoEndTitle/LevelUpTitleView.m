//
//  LevelUpTitleView.m
//
//  Code generated using QuartzCode 1.38.3 on 9/28/15.
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

@synthesize titleLabel;

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
    
    UIView*  outeredgeglow       = [[UIView alloc] initWithFrame:CGRectMake(-40, -0, 401, 90)];
    [self addSubview:outeredgeglow];
    self.layers[@"outeredgeglow"] = outeredgeglow;
    
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.36306 * CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds), 0.27387 * CGRectGetHeight(self.bounds))];;
    [self  addSubview:titleLabel];
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
    [self setupLayerFrames];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if(!layerIds || [layerIds containsObject:@"outeredgeglow"]){
        UIView * outeredgeglow = self.layers[@"outeredgeglow"];
        
        outeredgeglow.layer.contents = (id)[UIImage imageNamed:@"outer-edge-glow"].CGImage;
    }
    if(!layerIds || titleLabel){
        
        titleLabel.numberOfLines = 2;
        titleLabel.clipsToBounds = NO;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.lineBreakMode = NSLineBreakByClipping;
        
        NSDictionary*  textAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"GillSans-Light" size:22],
                                          NSForegroundColorAttributeName: [UIColor whiteColor],
                                          NSKernAttributeName: @4};
        NSString * textText = @"LEVEL UP";
        NSAttributedString * textAttributedText = [[NSAttributedString alloc] initWithString:textText attributes:textAttributes];;
        titleLabel.attributedText = textAttributedText;
    }
    
    [CATransaction commit];
}

- (void)setupLayerFrames{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    UIView * outeredgeglow = self.layers[@"outeredgeglow"];
    outeredgeglow.frame    = CGRectMake(-0.12656 * CGRectGetWidth(outeredgeglow.layer.superlayer.bounds), -0.00750 * CGRectGetHeight(outeredgeglow.layer.superlayer.bounds), 1.25312 * CGRectGetWidth(outeredgeglow.layer.superlayer.bounds), 1.00750 * CGRectGetHeight(outeredgeglow.layer.superlayer.bounds));
    
    titleLabel.frame             = CGRectMake(0, 0.36306 * CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds), 0.29 * CGRectGetHeight(self.bounds));
    
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addDisplayAnimation{
    [self addDisplayAnimationCompletionBlock:nil];
}

- (void)addDisplayAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    [self addDisplayAnimationTotalDuration:1.199 completionBlock:completionBlock];
}

- (void)addDisplayAnimationTotalDuration:(CFTimeInterval)totalDuration completionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = totalDuration;
        completionAnim.delegate = self;
        [completionAnim setValue:@"Display" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"Display"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"Display"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    UIView * outeredgeglow = self.layers[@"outeredgeglow"];
    [UIView animateKeyframesWithDuration:0 delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.34 animations:^{
            outeredgeglow.transform = CGAffineTransformMakeScale(0.7, 0.4);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.34 relativeDuration:0.66 animations:^{
            outeredgeglow.transform = CGAffineTransformIdentity;
        }];
    } completion:^(BOOL finished) {
    }];
    
    //CATextLayer * text = self.layers[@"text"];
    
    ////Text animation
    CAKeyframeAnimation * textPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    textPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(1.25 * CGRectGetWidth(self.bounds), 0.5 * CGRectGetHeight(self.bounds))], [NSValue valueWithCGPoint:CGPointMake(1.25 * CGRectGetWidth(self.bounds), 0.5 * CGRectGetHeight(self.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.50078 * CGRectGetWidth(self.bounds), 0.5 * CGRectGetHeight(self.bounds))]];
    textPositionAnim.keyTimes              = @[@0, @0.19, @1];
    textPositionAnim.duration              = 0.755 * totalDuration;
    textPositionAnim.beginTime             = 0.245 * totalDuration;
    textPositionAnim.timingFunction        = [CAMediaTimingFunction functionWithControlPoints:0.321 :0.0204 :-0.206 :0.735];
    
    CAKeyframeAnimation * textHiddenAnim = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
    textHiddenAnim.values                = @[@YES, @YES, @NO];
    textHiddenAnim.keyTimes              = @[@0, @0.884, @1];
    textHiddenAnim.duration              = 0.277 * totalDuration;
    
    CAAnimationGroup * textDisplayAnim = [QCMethod groupAnimations:@[textPositionAnim, textHiddenAnim] fillMode:fillMode];
    [titleLabel.layer addAnimation:textDisplayAnim forKey:@"textDisplayAnim"];
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
        [titleLabel.layer removeAnimationForKey:@"textDisplayAnim"];
    }
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        
        if ([layer.class isSubclassOfClass:UIView.class]) {
            [[(UIView *)layer layer] removeAllAnimations];
        }else{
            [layer removeAllAnimations];
        }
        
    }];
}

@end