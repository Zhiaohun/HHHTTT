//
//  MusicListUser.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicListUser.h"


NSString *const kMusicListUserUid = @"uid";
NSString *const kMusicListUserNickname = @"nickname";


@interface MusicListUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicListUser

@synthesize uid = _uid;
@synthesize nickname = _nickname;


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
            self.uid = [[self objectOrNilForKey:kMusicListUserUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kMusicListUserNickname fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kMusicListUserUid];
    [mutableDict setValue:self.nickname forKey:kMusicListUserNickname];

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

    self.uid = [aDecoder decodeDoubleForKey:kMusicListUserUid];
    self.nickname = [aDecoder decodeObjectForKey:kMusicListUserNickname];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kMusicListUserUid];
    [aCoder encodeObject:_nickname forKey:kMusicListUserNickname];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicListUser *copy = [[MusicListUser alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.nickname = [self.nickname copyWithZone:zone];
    }
    
    return copy;
}


@end
