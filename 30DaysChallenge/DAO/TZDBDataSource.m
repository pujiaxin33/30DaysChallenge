//
//  TZDBDataSource.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/9.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZDBDataSource.h"

@implementation TZDBDataSource

+ (instancetype)sharedInstance
{
    static TZDBDataSource *dataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataSource = [[TZDBDataSource alloc] init];
    });
    return dataSource;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *basePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *path = [basePath stringByAppendingPathComponent:@"ChallengeData.db"];
        self.db = [FMDatabase databaseWithPath:path];
        self.queue = [FMDatabaseQueue databaseQueueWithPath:path];
    }
    return self;
}

@end
