//
//  ViewController.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/4/28.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZMainViewController.h"
#import "TZMainContentView.h"
#import "TZMainContentModel.h"
#import "TZMainButton.h"

@interface TZMainViewController ()

@property (nonatomic, strong) TZMainContentView *doingView;

@end

@implementation TZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initUI
{
    //初始化导航栏
    self.title = @"30挑战";
    [self setNaviLeftItemWithTitle:@"设置" callback:^{
        NSLog(@"clicked settings button ");
    }];
    
    [self setNaviRightItemWithTitle:@"说明" callback:^{
        
    }];
    
    CGFloat topMargin = 20.f;
    CGFloat bottomMargin = 90.f;
    _doingView = [[TZMainContentView alloc] initWithFrame:CGRectMake(0, topMargin, WindowSize.width, WindowSize.height - NaviHeight - topMargin - bottomMargin)];
    [self.view addSubview:_doingView];
    
    CGFloat buttonWidth = 40.f;
    TZMainButton *createButton = [[TZMainButton alloc] initWithFrame:CGRectMake(WindowSize.width*0.5 - buttonWidth*0.5, CGRectGetMaxY(_doingView.frame) + (bottomMargin - buttonWidth)*0.5, buttonWidth, buttonWidth)];
    createButton.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:30];
    [createButton setTitle:@"+" forState:UIControlStateNormal];
    [createButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    createButton.touchUpInsideCallback = ^(UIButton *sender){
        NSLog(@"touch up inside");
    };
    [self.view addSubview:createButton];
    
    [createButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(_doingView.mas_bottom).offset(25);
        make.width.and.height.equalTo(@(buttonWidth));
    }];
    
    NSDictionary *dict1 = @{@"pictureName" : @"lufei-1",
                            @"challengeName" : @"每天运动1分钟",
                            @"completedDays" : @(1),
                            @"feeling" : @"今天感觉还不错"};
    TZMainContentModel *model1 = [TZMainContentModel modelObjectWithDictionary:dict1];
    
    NSDictionary *dict2 = @{@"pictureName" : @"lufei-2",
                            @"challengeName" : @"每天运动2分钟",
                            @"completedDays" : @(2),
                            @"feeling" : @"今天感觉还不错"};
    TZMainContentModel *model2 = [TZMainContentModel modelObjectWithDictionary:dict2];
    
    NSDictionary *dict3 = @{@"pictureName" : @"lufei-3",
                            @"challengeName" : @"每天运动3分钟",
                            @"completedDays" : @(3),
                            @"feeling" : @"今天感觉还不错"};
    TZMainContentModel *model3 = [TZMainContentModel modelObjectWithDictionary:dict3];
    
    NSDictionary *dict4 = @{@"pictureName" : @"lufei-4",
                            @"challengeName" : @"每天运动4分钟",
                            @"completedDays" : @(4),
                            @"feeling" : @"今天感觉还不错"};
    TZMainContentModel *model4 = [TZMainContentModel modelObjectWithDictionary:dict4];
    [_doingView loadDataSource:@[model1, model2, model3, model4]];
    
}

- (void)initDatas
{
    
}


@end
