//
//  TZTableViewController.h
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/6.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZTableViewController : UITableViewController

//==========子类继承===========
/**
 *  初始化界面
 */
- (void)initUI;
/**
 *  初始化数据
 */
- (void)initDatas;

#pragma mark
#pragma mark 导航栏
- (void)setNaviLeftItemWithTitle:(NSString *)title callback:(ClickedCallback)callback;
- (void)setNaviRightItemWithTitle:(NSString *)title callback:(ClickedCallback)callback;

- (void)setNaviType:(TZNavigationControllerType)type;


@end
