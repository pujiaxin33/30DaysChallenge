//
//  TZMainButton.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/9.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZMainButton.h"

@interface TZMainButton ()
@property (nonatomic, strong) CAShapeLayer *roundLayer;
@property (nonatomic, strong) UIBezierPath *normalPath;
@end

@implementation TZMainButton

- (void)dealloc
{
    _touchUpInsideCallback = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUIWithFrame:frame];
    }
    return self;
}

//缩放的时候，没有从中心点开始，暂时只能用下面的frame初始化方法
//+ (instancetype)buttonWithType:(UIButtonType)buttonType
//{
//    TZMainButton *button = [super buttonWithType:buttonType];
//    if (button) {
//        
//    }
//    return button;
//}

- (void)initUI
{
    _roundLayer = [CAShapeLayer layer];
    _roundLayer.frame = CGRectZero;
    _roundLayer.path = [UIBezierPath bezierPath].CGPath;
    _roundLayer.fillColor = kBlueColor.CGColor;
    [self.layer insertSublayer:_roundLayer atIndex:0];
    
    [self addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(dragExit) forControlEvents:UIControlEventTouchDragExit];
}

- (void)initUIWithFrame:(CGRect)frame
{
    [self initUI];
    _roundLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    _normalPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, frame.size.width, frame.size.height) cornerRadius:frame.size.width/2.f];
    _roundLayer.path = _normalPath.CGPath;
}

//- (void)layoutSubviews
//{
//   [super layoutSubviews];
//    _roundLayer.frame = CGRectMake(0, 0, self.width, self.height);
//    _roundLayer.anchorPoint = CGPointMake(0.5, 0.5);
//    _normalPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.width, self.height) cornerRadius:self.width/2.f];
//    _roundLayer.path = _normalPath.CGPath;
//}

- (void)touchDown
{
    [self startZoomInScale];
}

- (void)touchUpInside
{
    [self recoverScale];
    if (_touchUpInsideCallback) {
        _touchUpInsideCallback(self);
    }
}

- (void)dragExit
{
    [self recoverScale];
}

#pragma mark 
#pragma mark private

//放大
- (void)startZoomInScale
{
    [self startZoomToValue:[NSValue valueWithCGSize:CGSizeMake(1.3, 1.3)]];
}

//复原
- (void)recoverScale
{
    [self startZoomToValue:[NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)]];
}

- (void)startZoomToValue:(NSValue *)toValue
{
    [self startZoomFromValue:nil toValue:toValue];
}

- (void)startZoomFromValue:(NSValue *)fromValue toValue:(NSValue *)toValue
{
    [self.layer removeAllAnimations];
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animation.springBounciness = 12;
    animation.springSpeed = 10;
    if (fromValue) {
        animation.fromValue = fromValue;
    }
    animation.toValue = toValue;
    [self.layer pop_addAnimation:animation forKey:@"ZoomScale"];
}

@end
