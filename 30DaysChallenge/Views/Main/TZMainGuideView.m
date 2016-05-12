//
//  TZMainGuideView.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/11.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZMainGuideView.h"
#import <FBShimmeringView.h>

@interface TZMainGuideView ()
@property (nonatomic, strong) FBShimmeringView *shimmeringView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *guideLabel;
@end

@implementation TZMainGuideView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    _shimmeringView = [[FBShimmeringView alloc] init];
    //允许闪烁
    _shimmeringView.shimmering = YES;
    //两次闪烁之间的间隔时间
    _shimmeringView.shimmeringPauseDuration = 0.5;
    //设置闪烁时的不透明度
    _shimmeringView.shimmeringAnimationOpacity = 0.3;
    //开始闪烁前的不透明度
    _shimmeringView.shimmeringOpacity = 1;
    //闪烁的速度
    _shimmeringView.shimmeringSpeed = 180;
    //闪烁带的比例
    _shimmeringView.shimmeringHighlightLength = 0.8;
    //闪烁的方向
    _shimmeringView.shimmeringDirection = FBShimmerDirectionRight;
    //开始闪烁后保持fade的持续时间
    _shimmeringView.shimmeringBeginFadeDuration = 0.3;
    //结束闪烁后保持fade的持续时间
    _shimmeringView.shimmeringEndFadeDuration = 0.3;
    
    [self addSubview:_shimmeringView];
    
    UIView *containerView = [[UIView alloc] initWithFrame:_shimmeringView.bounds];
    containerView.backgroundColor = [UIColor clearColor];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"30天挑战";
    _titleLabel.font = [UIFont fontWithName:KMainFontName size:39.0];
    _titleLabel.textColor = kBlueColor;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [containerView addSubview:_titleLabel];
    
    _guideLabel = [[UILabel alloc] init];
    _guideLabel.text = @"点击下方创建按钮，开始挑战吧！";
    _guideLabel.font = [UIFont systemFontOfSize:17.f];
    _guideLabel.textColor = kTextAssistColor;
    _guideLabel.textAlignment = NSTextAlignmentCenter;
    [containerView addSubview:_guideLabel];
    
    _shimmeringView.contentView = containerView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _shimmeringView.bounds = CGRectMake(0, 0, self.width, 80);
    _shimmeringView.center = self.center;
    _titleLabel.frame = CGRectMake(0, 0, _shimmeringView.width, 50);
    _guideLabel.frame = CGRectMake(0, _shimmeringView.height - 30, _shimmeringView.width, 20);
}

@end
