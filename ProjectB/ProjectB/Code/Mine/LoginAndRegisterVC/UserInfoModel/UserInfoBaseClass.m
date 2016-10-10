//
//  UserInfoBaseClass.m
//
//  Created by lanou  on 16/9/20
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "UserInfoBaseClass.h"
#import "UserInfoData.h"


NSString *const kUserInfoBaseClassResult = @"result";
NSString *const kUserInfoBaseClassData = @"data";


@interface UserInfoBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserInfoBaseClass

@synthesize result = _result;
@synthesize data = _data;


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
            self.result = [[self objectOrNilForKey:kUserInfoBaseClassResult fromDictionary:dict] doubleValue];
            self.data = [UserInfoData modelObjectWithDictionary:[dict objectForKey:kUserInfoBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.result] forKey:kUserInfoBaseClassResult];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kUserInfoBaseClassData];

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

    self.result = [aDecoder decodeDoubleForKey:kUserInfoBaseClassResult];
    self.data = [aDecoder decodeObjectForKey:kUserInfoBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_result forKey:kUserInfoBaseClassResult];
    [aCoder encodeObject:_data forKey:kUserInfoBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserInfoBaseClass *copy = [[UserInfoBaseClass alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
