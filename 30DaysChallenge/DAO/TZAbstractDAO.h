//
//  TZAbstractDAO.h
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/9.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TZDBDataSource.h"

@interface TZAbstractDAO : NSObject

+ (TZDBDataSource *)dbDataSource;
//可以根据数据分类创建多个
@end
