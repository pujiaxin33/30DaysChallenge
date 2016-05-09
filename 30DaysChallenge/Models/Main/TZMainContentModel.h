//
//  TZMainContentModel.h
//
//  Created by   on 16/5/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TZMainContentModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *word;
@property (nonatomic, assign) NSUInteger completedDays;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *pictureName;
@property (nonatomic, strong) NSString *challengeName;
@property (nonatomic, strong) NSString *feeling;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
