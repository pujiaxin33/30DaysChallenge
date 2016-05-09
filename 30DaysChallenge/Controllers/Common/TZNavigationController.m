//
//  TZNavigationController.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/6.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZNavigationController.h"

@interface TZNavigationController ()

@end

@implementation TZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}


@end
