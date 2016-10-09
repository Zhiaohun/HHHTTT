//
//  UserInfoData.m
//
//  Created by lanou  on 16/9/20
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "UserInfoData.h"


NSString *const kUserInfoDataIcon = @"icon";
NSString *const kUserInfoDataUid = @"uid";
NSString *const kUserInfoDataUname = @"uname";
NSString *const kUserInfoDataAuth = @"auth";
NSString *const kUserInfoDataCoverimg = @"coverimg";


@interface UserInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserInfoData

@synthesize icon = _icon;
@synthesize uid = _uid;
@synthesize uname = _uname;
@synthesize auth = _auth;
@synthesize coverimg = _coverimg;


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
            self.icon = [self objectOrNilForKey:kUserInfoDataIcon fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kUserInfoDataUid fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kUserInfoDataUname fromDictionary:dict];
            self.auth = [self objectOrNilForKey:kUserInfoDataAuth fromDictionary:dict];
            self.coverimg = [self objectOrNilForKey:kUserInfoDataCoverimg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.icon forKey:kUserInfoDataIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kUserInfoDataUid];
    [mutableDict setValue:self.uname forKey:kUserInfoDataUname];
    [mutableDict setValue:self.auth forKey:kUserInfoDataAuth];
    [mutableDict setValue:self.coverimg forKey:kUserInfoDataCoverimg];

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

    self.icon = [aDecoder decodeObjectForKey:kUserInfoDataIcon];
    self.uid = [aDecoder decodeDoubleForKey:kUserInfoDataUid];
    self.uname = [aDecoder decodeObjectForKey:kUserInfoDataUname];
    self.auth = [aDecoder decodeObjectForKey:kUserInfoDataAuth];
    self.coverimg = [aDecoder decodeObjectForKey:kUserInfoDataCoverimg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_icon forKey:kUserInfoDataIcon];
    [aCoder encodeDouble:_uid forKey:kUserInfoDataUid];
    [aCoder encodeObject:_uname forKey:kUserInfoDataUname];
    [aCoder encodeObject:_auth forKey:kUserInfoDataAuth];
    [aCoder encodeObject:_coverimg forKey:kUserInfoDataCoverimg];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserInfoData *copy = [[UserInfoData alloc] init];
    
    if (copy) {

        copy.icon = [self.icon copyWithZone:zone];
        copy.uid = self.uid;
        copy.uname = [self.uname copyWithZone:zone];
        copy.auth = [self.auth copyWithZone:zone];
        copy.coverimg = [self.coverimg copyWithZone:zone];
    }
    
    return copy;
}


@end
