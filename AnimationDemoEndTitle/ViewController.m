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
    
    self.isFinishedAnimating = NO;
    
    [self.animatedTitleView removeAllAnimations];
    [self.animatedLevelNumberView removeAllAnimations];
    
}

-(void)startAnimations {
    
    self.isAnimating = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.darkOverlay.alpha = 0.85;
        
        self.animatedLevelNumberView.alpha = 1.0;
    }];
    
    [_animatedLevelNumberView addNumberCrashingAnimationCompletionBlock:^(BOOL finished) {
        [_animatedLevelNumberView addNumberRattlingAnimationCompletionBlock:^(BOOL finished) {
            
        }];
        
    }];
    
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
