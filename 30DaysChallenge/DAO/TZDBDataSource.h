//
//  TZDBDataSource.h
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/9.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface TZDBDataSource : NSObject

+ (instancetype)sharedInstance;
@property (nonatomic, strong) FMDatabase *db;
@property (nonatomic, strong) FMDatabaseQueue *queue;

@end
