//
//  TZViewController.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/6.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZViewController.h"
#import "UIImage+Utils.h"

static NSTimeInterval kZoomAnimationDuration = 0.35;

@interface TZViewController ()
@property (nonatomic, assign) BOOL isViewDidAppear;
@property (nonatomic, copy) ClickedCallback naviLeftItemCallback;
@property (nonatomic, copy) ClickedCallback naviRightItemCallback;

@end

@implementation TZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kBackgroundColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    _containerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_containerView];
    
    [self initDatas];
    [self initUI];
}


- (void)dealloc
{
    _naviLeftItemCallback = nil;
    _naviRightItemCallback = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isViewDidAppear) {
        [self zoomViewScaleToValue:1];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.isViewDidAppear = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self zoomViewScaleToValue:0.88];
}

- (void)zoomViewScaleToValue:(CGFloat)toValue
{
    [self.containerView pop_removeAllAnimations];
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(toValue, toValue)];
    animation.duration = kZoomAnimationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.containerView pop_addAnimation:animation forKey:@"zoom"];
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

- (void)setNaviType:(TZNavigationControllerType)type
{
    switch (type) {
        case TZNavigationControllerType_clear:
        {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
        }
            break;
        case TZNavigationControllerType_black:
        {
            
        }
            break;
        case TZNavigationControllerType_white:
        {
            self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        }
            break;
        default:
            break;
    }
}

@end
