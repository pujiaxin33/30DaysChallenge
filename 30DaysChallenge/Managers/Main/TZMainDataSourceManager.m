//
//  TZMainDataSourceManager.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/11.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZMainDataSourceManager.h"
#import "TZDataSourceDAO.h"

@implementation TZMainDataSourceManager

+ (NSArray *)getAllDataSources
{
    return [TZDataSourceDAO allDataSource];
}

@end
