//
//  ViewController.m
//  AnimationDemoEndTitle
//
//  Created by Michael Kral Work on 9/26/15.
//  Copyright © 2015 Tappforce LLC. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    AnimationSpeedNormal = 1,
    AnimationSpeedSlow = 2
}AnimationSpeed;

@interface ViewController ()

@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, assign) BOOL isFinishedAnimating;

@property (nonatomic, assign) AnimationSpeed animationSpeed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.animationSpeed = AnimationSpeedNormal;
    
    self.isAnimating = NO;
    self.isFinishedAnimating = NO;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleUserTap:)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    [self resetAnimations];
    
    
    
    NSString * titleString = @"LEVEL UP";
    
    NSDictionary*  textAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"GillSans-Light" size:22],
                                      NSForegroundColorAttributeName: [UIColor whiteColor],
                                      NSKernAttributeName: @4};
    
    NSAttributedString * textAttributedText = [[NSAttributedString alloc] initWithString:titleString attributes:textAttributes];
    
    
    self.animatedTitleView.titleLabel.attributedText = textAttributedText;
    
    self.animatedRewardBox1.rewardIcon = [UIImage imageNamed:@"spinIcon"];
    self.animatedRewardBox1.rewardText = @"1 Ultimate Spin";
    
    self.animatedRewardBox2.rewardIcon = [UIImage imageNamed:@"powerIcon"];
    self.animatedRewardBox2.rewardText = @"5 Energy";
    
    self.animatedRewardBox3.rewardIcon = [UIImage imageNamed:@"starIcon"];
    self.animatedRewardBox3.rewardText = @"1 New Inventory Slot";
    
    [self.speedControl addTarget:self action:@selector(handleSpeedChange:) forControlEvents:UIControlEventValueChanged];
    
}

-(CGFloat)adjustedDuration:(CGFloat)duration
{
    
    CGFloat adjustment = 1.0;
    
    switch (self.animationSpeed) {
        case AnimationSpeedSlow:
        {
            adjustment = 2.0;
        }
            break;
            
        default:
            break;
    }
    return  duration * adjustment;
    
}
-(void)handleSpeedChange:(UISegmentedControl *)sender
{
    
    //if(!self.isAnimating){
        
        switch (sender.selectedSegmentIndex) {
            case 0:{
                self.animationSpeed = AnimationSpeedNormal;
            }
                
                break;
                
            case 1:
            {
                self.animationSpeed = AnimationSpeedSlow;
            }
                
                break;
                
            default:
                break;
        }
    //}
    
    
}
-(void)handleUserTap:(id)sender {
    
    if(!self.isAnimating){
        
        if(self.isFinishedAnimating){
            
            [self resetAnimations];
            
        }else{
            
            [self startAnimations];
            
        }
        
    }
    
}

-(void)resetAnimations {
    
    self.darkOverlay.alpha = 0.0f;
    self.animatedTitleView.alpha = 0.0f;
    self.animatedLevelNumberView.alpha = 0.0f;
    self.animatedRewardBox1.alpha = 0.0f;
    self.animatedRewardBox2.alpha = 0.0f;
    self.animatedRewardBox3.alpha = 0.0f;
    
    self.animatedShareButtonView.alpha = 0.0f;
    
    
    
    self.isFinishedAnimating = NO;
    
    [self.animatedTitleView removeAllAnimations];
    [self.animatedLevelNumberView removeAllAnimations];
    [self.animatedRewardBox1 removeAllAnimations];
    [self.animatedRewardBox2 removeAllAnimations];
    [self.animatedRewardBox3 removeAllAnimations];
    [self.animatedShareButtonView removeAllAnimations];
    
}

-(void)startRewardAnimation:(NSNumber *)index
{
    NSTimeInterval rewardAnimation = [self adjustedDuration:0.5];
    
    switch (index.integerValue) {
        case 1:
            self.animatedRewardBox1.alpha = 1.0;
            [self.animatedRewardBox1 addShowRewardBoxAnimationTotalDuration:rewardAnimation completionBlock:nil];
            break;
        case 2:
            self.animatedRewardBox2.alpha = 1.0;
            [self.animatedRewardBox2 addShowRewardBoxAnimationTotalDuration:rewardAnimation completionBlock:nil];
            break;
        case 3:
            self.animatedRewardBox3.alpha = 1.0;
            [self.animatedRewardBox3 addShowRewardBoxAnimationTotalDuration:rewardAnimation completionBlock:nil];
            break;
            
        default:
            break;
    }
}

-(void)showShareButtons:(id)sender {
    
    NSTimeInterval interval = [self adjustedDuration:0.68];
    self.animatedShareButtonView.alpha = 1.0;
    [self.animatedShareButtonView addShowShareButtonAnimationTotalDuration:interval completionBlock:nil];
    
}

-(void)startAnimations {
    
    self.isAnimating = YES;
    
    [UIView animateWithDuration:[self adjustedDuration:0.3] animations:^{
        self.darkOverlay.alpha = 0.85;
        
        self.animatedLevelNumberView.alpha = 1.0;
    }];
    
    
    __weak ViewController * weakSelf = self;
    
    
    NSTimeInterval crashAnimationInterval = [self adjustedDuration:0.85];
    NSTimeInterval shakeAnimationInterval = [self adjustedDuration:0.1];
    
    [self.animatedLevelNumberView addNumberCrashingAnimationTotalDuration:crashAnimationInterval completionBlock:^(BOOL finished) {
       [weakSelf.animatedLevelNumberView addNumberRattlingAnimationTotalDuration:shakeAnimationInterval completionBlock:^(BOOL finished) {
           
       }];
    }];
    
    CGFloat delay = [self adjustedDuration:0.5];
    
    [self performSelector:@selector(startRewardAnimation:) withObject:@1 afterDelay: [self adjustedDuration:delay + 0.0]];
    [self performSelector:@selector(startRewardAnimation:) withObject:@2 afterDelay:[self adjustedDuration:delay + 0.12]];
    [self performSelector:@selector(startRewardAnimation:) withObject:@3 afterDelay:[self adjustedDuration:delay + 0.24]];
    
    [self performSelector:@selector(showShareButtons:) withObject:nil afterDelay:[self adjustedDuration:delay + 0.2]];
    
    
    
    NSTimeInterval interval = [self adjustedDuration:1.2];
    
    self.animatedTitleView.alpha = 1.0;
    [_animatedTitleView addDisplayAnimationTotalDuration:interval completionBlock:^(BOOL finished) {
        _isFinishedAnimating = YES;
        _isAnimating = NO;
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
