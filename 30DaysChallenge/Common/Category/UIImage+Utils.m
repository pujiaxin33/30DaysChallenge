//
//  UIImage+Utils.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/6.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(CGSizeMake(10.f, 10.f));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 10.f, 10.f));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
