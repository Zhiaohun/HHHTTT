//
//  VideoListWebUrl.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListWebUrl.h"


NSString *const kVideoListWebUrlRaw = @"raw";
NSString *const kVideoListWebUrlForWeibo = @"forWeibo";


@interface VideoListWebUrl ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListWebUrl

@synthesize raw = _raw;
@synthesize forWeibo = _forWeibo;


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
            self.raw = [self objectOrNilForKey:kVideoListWebUrlRaw fromDictionary:dict];
            self.forWeibo = [self objectOrNilForKey:kVideoListWebUrlForWeibo fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.raw forKey:kVideoListWebUrlRaw];
    [mutableDict setValue:self.forWeibo forKey:kVideoListWebUrlForWeibo];

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

    self.raw = [aDecoder decodeObjectForKey:kVideoListWebUrlRaw];
    self.forWeibo = [aDecoder decodeObjectForKey:kVideoListWebUrlForWeibo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_raw forKey:kVideoListWebUrlRaw];
    [aCoder encodeObject:_forWeibo forKey:kVideoListWebUrlForWeibo];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListWebUrl *copy = [[VideoListWebUrl alloc] init];
    
    if (copy) {

        copy.raw = [self.raw copyWithZone:zone];
        copy.forWeibo = [self.forWeibo copyWithZone:zone];
    }
    
    return copy;
}


@end
