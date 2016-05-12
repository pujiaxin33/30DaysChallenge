//
//  TZAbstractDAO.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/9.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZAbstractDAO.h"

@implementation TZAbstractDAO

+ (TZDBDataSource *)dbDataSource
{
    return [TZDBDataSource sharedInstance];
}

@end
