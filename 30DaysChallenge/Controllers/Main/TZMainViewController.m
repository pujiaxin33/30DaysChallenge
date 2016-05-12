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
#import "TZMainDataSourceManager.h"
#import "TZMainGuideView.h"
#import "TZCreateChallengeController.h"

@interface TZMainViewController ()

@property (nonatomic, strong) TZMainContentView *doingView;
@property (nonatomic, strong) NSArray *doingDataSource;

@end

@implementation TZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initDatas
{
//    _doingDataSource = [TZMainDataSourceManager getAllDataSources];
}

- (void)initUI
{
    //初始化导航栏
    self.title = @"30挑战";
    [self setNaviLeftItemWithTitle:@"设置" callback:^{
        
    }];
    
    [self setNaviRightItemWithTitle:@"说明" callback:^{
        
    }];
    
    CGFloat topMargin = 20.f;
    CGFloat bottomMargin = 90.f;
    _doingView = [[TZMainContentView alloc] initWithFrame:CGRectMake(0, topMargin, WindowSize.width, WindowSize.height - NaviHeight - topMargin - bottomMargin)];
    _doingView.hidden = YES;
    [self.containerView addSubview:_doingView];
    
    [_doingView loadDataSource:_doingDataSource];
    
    TZMainGuideView *guideView = [[TZMainGuideView alloc] init];
    [self.containerView addSubview:guideView];
    [guideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_height);
    }];
    
    
    if (_doingDataSource && _doingDataSource.count > 0) {
        _doingView.hidden = NO;
    }else {
        guideView.hidden = NO;
    }
    
    CGFloat buttonWidth = 40.f;
    TZMainButton *createButton = [[TZMainButton alloc] initWithFrame:CGRectMake(WindowSize.width*0.5 - buttonWidth*0.5, CGRectGetMaxY(_doingView.frame) + (bottomMargin - buttonWidth)*0.5, buttonWidth, buttonWidth)];
    createButton.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:30];
    [createButton setTitle:@"+" forState:UIControlStateNormal];
    [createButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    createButton.touchUpInsideCallback = ^(UIButton *sender){
        [self performSegueWithIdentifier:NSStringFromClass([TZCreateChallengeController class]) sender:nil];
    };
    [self.containerView addSubview:createButton];
    
    [createButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(_doingView.mas_bottom).offset(25);
        make.width.and.height.equalTo(@(buttonWidth));
    }];
    
    NSLog(@"%@", NSHomeDirectory());
    
//    NSDictionary *dict1 = @{@"pictureName" : @"lufei-1",
//                            @"challengeName" : @"每天运动1分钟",
//                            @"completedDays" : @(1),
//                            @"feeling" : @"今天感觉还不错",
//                            @"resourceID" : @"1",
//                            @"word" : @"",
//                            @"state" : @"进行中"};
//    TZMainContentModel *model1 = [TZMainContentModel modelObjectWithDictionary:dict1];
}






@end
