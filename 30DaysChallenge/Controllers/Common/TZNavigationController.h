//
//  TZNavigationController.h
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/6.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TZNavigationControllerType) {
    TZNavigationControllerType_clear = 1,   //透明
    TZNavigationControllerType_black,       //主题黑
};

@interface TZNavigationController : UINavigationController

@end
