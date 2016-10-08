//
//  MusicListBaseClass.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicListBaseClass.h"
#import "MusicListData.h"


NSString *const kMusicListBaseClassRet = @"ret";
NSString *const kMusicListBaseClassData = @"data";
NSString *const kMusicListBaseClassMsg = @"msg";


@interface MusicListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicListBaseClass

@synthesize ret = _ret;
@synthesize data = _data;
@synthesize msg = _msg;


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
            self.ret = [[self objectOrNilForKey:kMusicListBaseClassRet fromDictionary:dict] doubleValue];
            self.data = [MusicListData modelObjectWithDictionary:[dict objectForKey:kMusicListBaseClassData]];
            self.msg = [self objectOrNilForKey:kMusicListBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kMusicListBaseClassRet];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kMusicListBaseClassData];
    [mutableDict setValue:self.msg forKey:kMusicListBaseClassMsg];

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

    self.ret = [aDecoder decodeDoubleForKey:kMusicListBaseClassRet];
    self.data = [aDecoder decodeObjectForKey:kMusicListBaseClassData];
    self.msg = [aDecoder decodeObjectForKey:kMusicListBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kMusicListBaseClassRet];
    [aCoder encodeObject:_data forKey:kMusicListBaseClassData];
    [aCoder encodeObject:_msg forKey:kMusicListBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicListBaseClass *copy = [[MusicListBaseClass alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
