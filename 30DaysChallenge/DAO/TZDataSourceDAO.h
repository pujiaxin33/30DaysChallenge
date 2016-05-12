//
//  TZDataSourceDAO.h
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/9.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TZMainContentModel.h"
#import "TZAbstractDAO.h"

@interface TZDataSourceDAO : TZAbstractDAO

+ (NSArray <TZMainContentModel *>*)allDataSource;

+ (void)createTable;

+ (void)insertData:(TZMainContentModel *)data;

+ (void)deleteData:(TZMainContentModel *)data;

+ (void)updateData:(TZMainContentModel *)data;

+ (TZMainContentModel *)queryDataWithResourceID:(NSString *)resoucreID;

@end
