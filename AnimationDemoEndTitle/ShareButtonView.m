//
//  ShareButtonView.m
//
//  Code generated using QuartzCode 1.38.3 on 9/27/15.
//  www.quartzcodeapp.com
//

#import "ShareButtonView.h"
#import "QCMethod.h"

@interface ShareButtonView ()

@property (nonatomic, strong) NSMutableDictionary * layers;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;


@end

@implementation ShareButtonView

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
    //self.backgroundColor = [UIColor colorWithRed:0.23 green: 0.23 blue:0.23 alpha:1];
    
    CALayer * Group = [CALayer layer];
    [self.layer addSublayer:Group];
    self.layers[@"Group"] = Group;
    {
        CAShapeLayer * roundedRect = [CAShapeLayer layer];
        [Group addSublayer:roundedRect];
        self.layers[@"roundedRect"] = roundedRect;
        CATextLayer * text = [CATextLayer layer];
        [Group addSublayer:text];
        self.layers[@"text"] = text;
    }
    
    
    CATextLayer * text2 = [CATextLayer layer];
    [self.layer addSublayer:text2];
    self.layers[@"text2"] = text2;
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
    [self setupLayerFrames];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if(!layerIds || [layerIds containsObject:@"roundedRect"]){
        CAShapeLayer * roundedRect = self.layers[@"roundedRect"];
        roundedRect.fillColor     = [UIColor colorWithRed:1 green: 0.537 blue:0.286 alpha:1].CGColor;
        roundedRect.strokeColor   = [UIColor colorWithRed:0.329 green: 0.329 blue:0.329 alpha:1].CGColor;
        roundedRect.strokeEnd     = 0;
        roundedRect.shadowColor   = [UIColor colorWithRed:1 green: 0.4 blue:0.259 alpha:1].CGColor;
        roundedRect.shadowOpacity = 1;
        roundedRect.shadowOffset  = CGSizeMake(4, 4);
        roundedRect.shadowRadius  = 0;
    }
    if(!layerIds || [layerIds containsObject:@"text"]){
        CATextLayer * text = self.layers[@"text"];
        text.contentsScale   = [[UIScreen mainScreen] scale];
        text.string          = @"Share\n";
        text.font            = (__bridge CFTypeRef)@"AvenirNext-Medium";
        text.fontSize        = 16;
        text.alignmentMode   = kCAAlignmentCenter;
        text.foregroundColor = [UIColor whiteColor].CGColor;
    }
    if(!layerIds || [layerIds containsObject:@"text2"]){
        CATextLayer * text2 = self.layers[@"text2"];
        text2.contentsScale   = [[UIScreen mainScreen] scale];
        text2.string          = @"Not Now\n";
        text2.font            = (__bridge CFTypeRef)@"AvenirNext-Medium";
        text2.fontSize        = 13;
        text2.alignmentMode   = kCAAlignmentCenter;
        text2.foregroundColor = [UIColor whiteColor].CGColor;
    }
    
    [CATransaction commit];
}

- (void)setupLayerFrames{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    CALayer * Group            = self.layers[@"Group"];
    Group.frame                = CGRectMake(0.28275 * CGRectGetWidth(Group.superlayer.bounds), 0.12308 * CGRectGetHeight(Group.superlayer.bounds), 0.43451 * CGRectGetWidth(Group.superlayer.bounds), 0.28267 * CGRectGetHeight(Group.superlayer.bounds));
    
    CAShapeLayer * roundedRect = self.layers[@"roundedRect"];
    roundedRect.frame          = CGRectMake(0, 0,  CGRectGetWidth(roundedRect.superlayer.bounds),  CGRectGetHeight(roundedRect.superlayer.bounds));
    roundedRect.path           = [self roundedRectPathWithBounds:[self.layers[@"roundedRect"] bounds]].CGPath;
    
    CATextLayer * text         = self.layers[@"text"];
    text.frame                 = CGRectMake(0.21232 * CGRectGetWidth(text.superlayer.bounds), 0.22218 * CGRectGetHeight(text.superlayer.bounds), 0.57536 * CGRectGetWidth(text.superlayer.bounds), 0.52539 * CGRectGetHeight(text.superlayer.bounds));
    
    CATextLayer * text2        = self.layers[@"text2"];
    text2.frame                = CGRectMake(0.375 * CGRectGetWidth(text2.superlayer.bounds), 0.53638 * CGRectGetHeight(text2.superlayer.bounds), 0.25 * CGRectGetWidth(text2.superlayer.bounds), 0.10699 * CGRectGetHeight(text2.superlayer.bounds));
    
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addShowShareButtonAnimation{
    [self addShowShareButtonAnimationCompletionBlock:nil];
}

- (void)addShowShareButtonAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    
    [self addShowShareButtonAnimationTotalDuration:0.68 completionBlock:completionBlock];
    
    
}

- (void)addShowShareButtonAnimationTotalDuration:(CFTimeInterval)duration completionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = duration;
        completionAnim.delegate = self;
        [completionAnim setValue:@"ShowShareButton" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"ShowShareButton"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"ShowShareButton"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    CALayer * Group = self.layers[@"Group"];
    
    ////Group animation
    CAKeyframeAnimation * GroupPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    GroupPositionAnim.values         = @[[NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(Group.superlayer.bounds), 1.2 * CGRectGetHeight(Group.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(Group.superlayer.bounds), 0.2 * CGRectGetHeight(Group.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(Group.superlayer.bounds), 0.26441 * CGRectGetHeight(Group.superlayer.bounds))]];
    GroupPositionAnim.keyTimes       = @[@0, @0.79, @1];
    GroupPositionAnim.duration       = 0.946 * duration;
    GroupPositionAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup * GroupShowShareButtonAnim = [QCMethod groupAnimations:@[GroupPositionAnim] fillMode:fillMode];
    [Group addAnimation:GroupShowShareButtonAnim forKey:@"GroupShowShareButtonAnim"];
    
    CATextLayer * text2 = self.layers[@"text2"];
    
    ////Text2 animation
    CAKeyframeAnimation * text2PositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    text2PositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(text2.superlayer.bounds), 1.33333 * CGRectGetHeight(text2.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(text2.superlayer.bounds), 1.33333 * CGRectGetHeight(text2.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(text2.superlayer.bounds), 0.52 * CGRectGetHeight(text2.superlayer.bounds))], [NSValue valueWithCGPoint:CGPointMake(0.5 * CGRectGetWidth(text2.superlayer.bounds), 0.58987 * CGRectGetHeight(text2.superlayer.bounds))]];
    text2PositionAnim.keyTimes = @[@0, @0.131, @0.837, @1];
    text2PositionAnim.duration = duration;
    
    CAAnimationGroup * text2ShowShareButtonAnim = [QCMethod groupAnimations:@[text2PositionAnim] fillMode:fillMode];
    [text2 addAnimation:text2ShowShareButtonAnim forKey:@"text2ShowShareButtonAnim"];
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
    if([identifier isEqualToString:@"ShowShareButton"]){
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Group"] animationForKey:@"GroupShowShareButtonAnim"] theLayer:self.layers[@"Group"]];
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"text2"] animationForKey:@"text2ShowShareButtonAnim"] theLayer:self.layers[@"text2"]];
    }
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"ShowShareButton"]){
        [self.layers[@"Group"] removeAnimationForKey:@"GroupShowShareButtonAnim"];
        [self.layers[@"text2"] removeAnimationForKey:@"text2ShowShareButtonAnim"];
    }
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        [layer removeAllAnimations];
    }];
}

#pragma mark - Bezier Path

- (UIBezierPath*)roundedRectPathWithBounds:(CGRect)bound{
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPath];
    CGFloat minX = CGRectGetMinX(bound), minY = CGRectGetMinY(bound), w = CGRectGetWidth(bound), h = CGRectGetHeight(bound);
    
    [roundedRectPath moveToPoint:CGPointMake(minX + 0.02088 * w, minY)];
    [roundedRectPath addCurveToPoint:CGPointMake(minX, minY + 0.09434 * h) controlPoint1:CGPointMake(minX + 0.00935 * w, minY) controlPoint2:CGPointMake(minX, minY + 0.04224 * h)];
    [roundedRectPath addLineToPoint:CGPointMake(minX, minY + 0.90566 * h)];
    [roundedRectPath addCurveToPoint:CGPointMake(minX + 0.02088 * w, minY + h) controlPoint1:CGPointMake(minX, minY + 0.95776 * h) controlPoint2:CGPointMake(minX + 0.00935 * w, minY + h)];
    [roundedRectPath addLineToPoint:CGPointMake(minX + 0.97912 * w, minY + h)];
    [roundedRectPath addCurveToPoint:CGPointMake(minX + w, minY + 0.90566 * h) controlPoint1:CGPointMake(minX + 0.99065 * w, minY + h) controlPoint2:CGPointMake(minX + w, minY + 0.95776 * h)];
    [roundedRectPath addLineToPoint:CGPointMake(minX + w, minY + 0.09434 * h)];
    [roundedRectPath addCurveToPoint:CGPointMake(minX + 0.97912 * w, minY) controlPoint1:CGPointMake(minX + w, minY + 0.04224 * h) controlPoint2:CGPointMake(minX + 0.99065 * w, minY)];
    [roundedRectPath closePath];
    [roundedRectPath moveToPoint:CGPointMake(minX + 0.02088 * w, minY)];
    
    return roundedRectPath;
}


@end