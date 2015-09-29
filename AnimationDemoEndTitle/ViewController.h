//
//  ViewController.h
//  AnimationDemoEndTitle
//
//  Created by Michael Kral Work on 9/26/15.
//  Copyright © 2015 Tappforce LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

//Animated Views
#import "LevelUpTitleView.h"
#import "LevelNumberView.h"
#import "RewardBoxView.h"
#import "ShareButtonView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet LevelUpTitleView * animatedTitleView;
@property (nonatomic, strong) IBOutlet LevelNumberView * animatedLevelNumberView;

@property (nonatomic, strong) IBOutlet ShareButtonView * animatedShareButtonView;

@property (nonatomic, strong) IBOutlet RewardBoxView * animatedRewardBox1;
@property (nonatomic, strong) IBOutlet RewardBoxView * animatedRewardBox2;
@property (nonatomic, strong) IBOutlet RewardBoxView * animatedRewardBox3;

@property (nonatomic, strong) IBOutlet UIView * darkOverlay;

@property (nonatomic, strong) IBOutlet UISegmentedControl * speedControl;


@end

