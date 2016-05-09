//
//  TZMainContentModel.m
//
//  Created by   on 16/5/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TZMainContentModel.h"


NSString *const kTZMainContentModelWord = @"word";
NSString *const kTZMainContentModelCompletedDays = @"completedDays";
NSString *const kTZMainContentModelState = @"state";
NSString *const kTZMainContentModelPictureName = @"pictureName";
NSString *const kTZMainContentModelChallengeName = @"challengeName";
NSString *const kTZMainContentModelFeeling = @"feeling";


@interface TZMainContentModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TZMainContentModel

@synthesize word = _word;
@synthesize completedDays = _completedDays;
@synthesize state = _state;
@synthesize pictureName = _pictureName;
@synthesize challengeName = _challengeName;
@synthesize feeling = _feeling;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.word = [self objectOrNilForKey:kTZMainContentModelWord fromDictionary:dict];
            self.completedDays = [[self objectOrNilForKey:kTZMainContentModelCompletedDays fromDictionary:dict] doubleValue];
            self.state = [self objectOrNilForKey:kTZMainContentModelState fromDictionary:dict];
            self.pictureName = [self objectOrNilForKey:kTZMainContentModelPictureName fromDictionary:dict];
            self.challengeName = [self objectOrNilForKey:kTZMainContentModelChallengeName fromDictionary:dict];
            self.feeling = [self objectOrNilForKey:kTZMainContentModelFeeling fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.word forKey:kTZMainContentModelWord];
    [mutableDict setValue:[NSNumber numberWithDouble:self.completedDays] forKey:kTZMainContentModelCompletedDays];
    [mutableDict setValue:self.state forKey:kTZMainContentModelState];
    [mutableDict setValue:self.pictureName forKey:kTZMainContentModelPictureName];
    [mutableDict setValue:self.challengeName forKey:kTZMainContentModelChallengeName];
    [mutableDict setValue:self.feeling forKey:kTZMainContentModelFeeling];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.word = [aDecoder decodeObjectForKey:kTZMainContentModelWord];
    self.completedDays = [aDecoder decodeDoubleForKey:kTZMainContentModelCompletedDays];
    self.state = [aDecoder decodeObjectForKey:kTZMainContentModelState];
    self.pictureName = [aDecoder decodeObjectForKey:kTZMainContentModelPictureName];
    self.challengeName = [aDecoder decodeObjectForKey:kTZMainContentModelChallengeName];
    self.feeling = [aDecoder decodeObjectForKey:kTZMainContentModelFeeling];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_word forKey:kTZMainContentModelWord];
    [aCoder encodeDouble:_completedDays forKey:kTZMainContentModelCompletedDays];
    [aCoder encodeObject:_state forKey:kTZMainContentModelState];
    [aCoder encodeObject:_pictureName forKey:kTZMainContentModelPictureName];
    [aCoder encodeObject:_challengeName forKey:kTZMainContentModelChallengeName];
    [aCoder encodeObject:_feeling forKey:kTZMainContentModelFeeling];
}

- (id)copyWithZone:(NSZone *)zone
{
    TZMainContentModel *copy = [[TZMainContentModel alloc] init];
    
    if (copy) {

        copy.word = [self.word copyWithZone:zone];
        copy.completedDays = self.completedDays;
        copy.state = [self.state copyWithZone:zone];
        copy.pictureName = [self.pictureName copyWithZone:zone];
        copy.challengeName = [self.challengeName copyWithZone:zone];
        copy.feeling = [self.feeling copyWithZone:zone];
    }
    
    return copy;
}


@end
