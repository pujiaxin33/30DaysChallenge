//
//  TZDataSourceDAO.m
//  30DaysChallenge
//
//  Created by jiaxin on 16/5/9.
//  Copyright © 2016年 jiaxin. All rights reserved.
//

#import "TZDataSourceDAO.h"

@implementation TZDataSourceDAO

+ (NSArray<TZMainContentModel *> *)allDataSource
{
    NSMutableArray *tempDataSource = [NSMutableArray array];
    
    [[self dbDataSource].queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM main_data;"];
        while ([result next]) {
            TZMainContentModel *model = [TZMainContentModel new];
            model.resourceID = [result stringForColumn:@"resourceID"];
            model.word = [result stringForColumn:@"word"];
            model.feeling = [result stringForColumn:@"feeling"];
            model.completedDays = [result intForColumn:@"completedDays"];
            model.state = [result stringForColumn:@"state"];
            model.pictureName = [result stringForColumn:@"pictureName"];
            model.challengeName = [result stringForColumn:@"challengeName"];
            [tempDataSource addObject:model];
        }
        [result close];
    }];
    return tempDataSource.copy;
}

+ (void)createTable
{
    [[self dbDataSource].queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS main_data (resourceID TEXT PRIMARY KEY, word TEXT, completedDays INTEGER, state TEXT, pictureName TEXT, challengeName TEXT, feeling TEXT);"];
    }];
}

+ (void)insertData:(TZMainContentModel *)data
{
    [[self dbDataSource].queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:@"INSERT INTO main_data (resourceID, word, completedDays, state, pictureName, challengeName, feeling) values (?, ?, ?, ?, ?, ?, ?)", data.resourceID, data.word, @(data.completedDays), data.state, data.pictureName, data.challengeName, data.feeling];
    }];
}

+ (void)deleteData:(TZMainContentModel *)data
{
    [[self dbDataSource].queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"DELETE FROM main_data WHERE resourceID = '%@';", data.resourceID]];
    }];
}

+ (void)updateData:(TZMainContentModel *)data
{
    [[self dbDataSource].queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:@"UPDATE main_data SET word = ?, feeling = ?, completedDays = ?, state = ?, pictureName = ?, challengeName = ? WHERE resourceID = ?;", data.word, data.feeling, data.completedDays, data.state, data.pictureName, data.challengeName, data.resourceID];
    }];
}

+ (TZMainContentModel *)queryDataWithResourceID:(NSString *)resoucreID
{
    __block TZMainContentModel *model = nil;
    [[self dbDataSource].queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        FMResultSet *result = [db executeQuery:[NSString stringWithFormat:@"SELECT * FROM main_data WHERE resourceID = %@;", resoucreID]];
        while ([result next]) {
            model = [TZMainContentModel new];
            model.resourceID = [result stringForColumn:@"resourceID"];
            model.word = [result stringForColumn:@"word"];
            model.feeling = [result stringForColumn:@"feeling"];
            model.completedDays = [result intForColumn:@"completedDays"];
            model.state = [result stringForColumn:@"state"];
            model.pictureName = [result stringForColumn:@"pictureName"];
            model.challengeName = [result stringForColumn:@"challengeName"];
        }
        [result close];
    }];
    return model;
}

@end
