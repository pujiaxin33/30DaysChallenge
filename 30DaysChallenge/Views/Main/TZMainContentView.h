//
//  TZMainContentView.h
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/7.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TZMainContentModel;

@interface TZMainContentView : UIView

- (void)loadDataSource:(NSArray <TZMainContentModel *> *)dataSource;

@end
