//
//  TZGlobalConfigManager.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/6.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZGlobalConfigManager.h"
#import "UIImage+Utils.h"

@implementation TZGlobalConfigManager

+ (void)config
{
    [UINavigationBar appearance].barTintColor = kBackgroundColor;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0.5, 0.5);
    shadow.shadowColor = [UIColor lightGrayColor];
    NSDictionary *titleTextAttrDict = @{NSFontAttributeName : [UIFont systemFontOfSize:22],
                                        NSForegroundColorAttributeName : [UIColor whiteColor],
                                        NSShadowAttributeName : shadow};
    [UINavigationBar appearance].titleTextAttributes = titleTextAttrDict;
    
    
    [UIToolbar appearance].barTintColor = kBackgroundColor;
    [UIToolbar appearance].tintColor = [UIColor whiteColor];
}

@end
