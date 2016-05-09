//
//  TZViewController.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/6.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZViewController.h"

@interface TZViewController ()
@property (nonatomic, copy) ClickedCallback naviLeftItemCallback;
@property (nonatomic, copy) ClickedCallback naviRightItemCallback;
@end

@implementation TZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackgroundColor;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initUI];
    [self initDatas];
}

- (void)dealloc
{
    _naviLeftItemCallback = nil;
    _naviRightItemCallback = nil;
}

#pragma mark
#pragma mark init method

- (void)initUI
{
    NSLog(@"子类未继承%@",NSStringFromSelector(_cmd));
}

- (void)initDatas
{
    NSLog(@"子类未继承%s",__FUNCTION__);
}

#pragma mark 
#pragma mark 导航栏

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setNaviLeftItemWithTitle:(NSString *)title callback:(ClickedCallback)callback
{
    _naviLeftItemCallback = callback;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(naviLeftItemClicked)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)naviLeftItemClicked
{
    if (_naviLeftItemCallback) {
        _naviLeftItemCallback();
    }
}

- (void)setNaviRightItemWithTitle:(NSString *)title callback:(ClickedCallback)callback
{
    _naviRightItemCallback = callback;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(naviRightItemCallback)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)naviRightItemClicked
{
    if (_naviRightItemCallback) {
        _naviRightItemCallback();
    }
}

@end
