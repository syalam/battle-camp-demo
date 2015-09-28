//
//  ViewController.m
//  AnimationDemoEndTitle
//
//  Created by Michael Kral Work on 9/26/15.
//  Copyright © 2015 Tappforce LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL isAnimating;
@property (nonatomic, assign) BOOL isFinishedAnimating;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.isAnimating = NO;
    self.isFinishedAnimating = NO;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleUserTap:)];
    
    [self.view addGestureRecognizer:tapGesture];
    
    [self resetAnimations];
    
    
    
    NSString * titleString = @"Testing Custom Text";
    
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
    switch (index.integerValue) {
        case 1:
            self.animatedRewardBox1.alpha = 1.0;
            [self.animatedRewardBox1 addShowRewardBoxAnimation];
            break;
        case 2:
            self.animatedRewardBox2.alpha = 1.0;
            [self.animatedRewardBox2 addShowRewardBoxAnimation];
            break;
        case 3:
            self.animatedRewardBox3.alpha = 1.0;
            [self.animatedRewardBox3 addShowRewardBoxAnimation];
            break;
            
        default:
            break;
    }
}

-(void)showShareButtons:(id)sender {
    self.animatedShareButtonView.alpha = 1.0;
    [self.animatedShareButtonView addShowShareButtonAnimation];
    
}

-(void)startAnimations {
    
    self.isAnimating = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.darkOverlay.alpha = 0.85;
        
        self.animatedLevelNumberView.alpha = 1.0;
    }];
    
    
    __weak ViewController * weakSelf = self;
    [self.animatedLevelNumberView addNumberCrashingAnimationCompletionBlock:^(BOOL finished) {
        [weakSelf.animatedLevelNumberView addNumberRattlingAnimationCompletionBlock:^(BOOL finished) {
            
        }];
        
    }];
    
    
    CGFloat delay = 0.5;
    
    [self performSelector:@selector(startRewardAnimation:) withObject:@1 afterDelay: delay + 0.0];
    [self performSelector:@selector(startRewardAnimation:) withObject:@2 afterDelay:delay + 0.12];
    [self performSelector:@selector(startRewardAnimation:) withObject:@3 afterDelay:delay + 0.24];
    
    [self performSelector:@selector(showShareButtons:) withObject:nil afterDelay:delay + 0.2];
    
    
    self.animatedTitleView.alpha = 1.0;
    [_animatedTitleView addDisplayAnimationCompletionBlock:^(BOOL finished) {
        _isFinishedAnimating = YES;
        _isAnimating = NO;
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
