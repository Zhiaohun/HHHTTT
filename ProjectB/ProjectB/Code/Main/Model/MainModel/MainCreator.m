//
//  MainCreator.m
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainCreator.h"


NSString *const kMainCreatorUsername = @"username";
NSString *const kMainCreatorGender = @"gender";
NSString *const kMainCreatorSmallavatar = @"smallavatar";
NSString *const kMainCreatorUid = @"uid";
NSString *const kMainCreatorFanscnt = @"fanscnt";
NSString *const kMainCreatorLargeavatar = @"largeavatar";


@interface MainCreator ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainCreator

@synthesize username = _username;
@synthesize gender = _gender;
@synthesize smallavatar = _smallavatar;
@synthesize uid = _uid;
@synthesize fanscnt = _fanscnt;
@synthesize largeavatar = _largeavatar;


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
            self.username = [self objectOrNilForKey:kMainCreatorUsername fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kMainCreatorGender fromDictionary:dict];
            self.smallavatar = [self objectOrNilForKey:kMainCreatorSmallavatar fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kMainCreatorUid fromDictionary:dict];
            self.fanscnt = [self objectOrNilForKey:kMainCreatorFanscnt fromDictionary:dict];
            self.largeavatar = [self objectOrNilForKey:kMainCreatorLargeavatar fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.username forKey:kMainCreatorUsername];
    [mutableDict setValue:self.gender forKey:kMainCreatorGender];
    [mutableDict setValue:self.smallavatar forKey:kMainCreatorSmallavatar];
    [mutableDict setValue:self.uid forKey:kMainCreatorUid];
    [mutableDict setValue:self.fanscnt forKey:kMainCreatorFanscnt];
    [mutableDict setValue:self.largeavatar forKey:kMainCreatorLargeavatar];

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

    self.username = [aDecoder decodeObjectForKey:kMainCreatorUsername];
    self.gender = [aDecoder decodeObjectForKey:kMainCreatorGender];
    self.smallavatar = [aDecoder decodeObjectForKey:kMainCreatorSmallavatar];
    self.uid = [aDecoder decodeObjectForKey:kMainCreatorUid];
    self.fanscnt = [aDecoder decodeObjectForKey:kMainCreatorFanscnt];
    self.largeavatar = [aDecoder decodeObjectForKey:kMainCreatorLargeavatar];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_username forKey:kMainCreatorUsername];
    [aCoder encodeObject:_gender forKey:kMainCreatorGender];
    [aCoder encodeObject:_smallavatar forKey:kMainCreatorSmallavatar];
    [aCoder encodeObject:_uid forKey:kMainCreatorUid];
    [aCoder encodeObject:_fanscnt forKey:kMainCreatorFanscnt];
    [aCoder encodeObject:_largeavatar forKey:kMainCreatorLargeavatar];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainCreator *copy = [[MainCreator alloc] init];
    
    if (copy) {

        copy.username = [self.username copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.smallavatar = [self.smallavatar copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.fanscnt = [self.fanscnt copyWithZone:zone];
        copy.largeavatar = [self.largeavatar copyWithZone:zone];
    }
    
    return copy;
}


@end
