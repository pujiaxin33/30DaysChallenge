//
//  TZTextField.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/11.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZTextField.h"

static NSTimeInterval kAnimationDuration = 0.5;

@interface TZTextField ()
@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *roundLayer;
@end

@implementation TZTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    _backgroundLayer = [CAShapeLayer layer];
    _backgroundLayer.fillColor = kEmptyContentColor.CGColor;
    [self.layer addSublayer:_backgroundLayer];
    
    self.borderStyle = UITextBorderStyleNone;
    _roundLayer = [CAShapeLayer layer];
    _roundLayer.fillColor = [UIColor clearColor].CGColor;
    _roundLayer.strokeColor = kOrangeColor.CGColor;
    _roundLayer.lineWidth = 3.f;
    _roundLayer.opacity = 0;
    [self.layer addSublayer:_roundLayer];
    
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat cornerRadius = 5.f;
    CGFloat backgroundCornerRadius = cornerRadius*0.75;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(cornerRadius/2.f, cornerRadius/2.f, self.width-cornerRadius, self.height-cornerRadius) cornerRadius:cornerRadius];
    _backgroundLayer.frame = self.bounds;
    _backgroundLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(backgroundCornerRadius, backgroundCornerRadius, self.width-backgroundCornerRadius*2, self.height-backgroundCornerRadius*2) cornerRadius:backgroundCornerRadius].CGPath;
    _roundLayer.frame = self.bounds;
    _roundLayer.path = path.CGPath;
}

- (BOOL)becomeFirstResponder
{
    [self showBackgroundLayer];
    [self showRoundLayer];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [self dismissBackgroundLayer];
    [self dismissRoundLayer];
    return [super resignFirstResponder];
}

- (void)showRoundLayer
{
    [_roundLayer removeAllAnimations];
    POPBasicAnimation *animation = [POPBasicAnimation easeOutAnimation];
    animation.property = [POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
    animation.toValue = @(1);
    animation.duration = kAnimationDuration;
    [_roundLayer pop_addAnimation:animation forKey:@"show_round"];
}

- (void)dismissRoundLayer
{
    [_roundLayer removeAllAnimations];
    POPBasicAnimation *animation  = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    animation.toValue = @(0);
    animation.duration = kAnimationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_roundLayer pop_addAnimation:animation forKey:@"dismiss_round"];
}

- (void)showBackgroundLayer
{
    [_backgroundLayer removeAllAnimations];
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerFillColor];
    animation.toValue = [UIColor whiteColor];
    animation.duration = kAnimationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_backgroundLayer pop_addAnimation:animation forKey:@"show_background"];
}

- (void)dismissBackgroundLayer
{
    [_backgroundLayer removeAllAnimations];
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerFillColor];
    animation.toValue = kEmptyContentColor;
    animation.duration = kAnimationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_backgroundLayer pop_addAnimation:animation forKey:@"dismiss_background"];
}

//- (CGRect)borderRectForBounds:(CGRect)bounds
//{
//    return CGRectMake(5, 5, bounds.size.width - 10, bounds.size.height - 10);
//}

//- (CGRect)textRectForBounds:(CGRect)bounds
//{
//    return CGRectMake(5, 5, bounds.size.width - 10, bounds.size.height - 10);
//}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(10, 1, bounds.size.width - 20, bounds.size.height - 10);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(10, 1, bounds.size.width - 20, bounds.size.height - 10);
}

@end
