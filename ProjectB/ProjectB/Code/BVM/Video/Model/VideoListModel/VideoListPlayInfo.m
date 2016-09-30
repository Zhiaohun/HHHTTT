//
//  VideoListPlayInfo.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListPlayInfo.h"


NSString *const kVideoListPlayInfoName = @"name";
NSString *const kVideoListPlayInfoType = @"type";
NSString *const kVideoListPlayInfoUrl = @"url";
NSString *const kVideoListPlayInfoWidth = @"width";
NSString *const kVideoListPlayInfoHeight = @"height";


@interface VideoListPlayInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListPlayInfo

@synthesize name = _name;
@synthesize type = _type;
@synthesize url = _url;
@synthesize width = _width;
@synthesize height = _height;


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
            self.name = [self objectOrNilForKey:kVideoListPlayInfoName fromDictionary:dict];
            self.type = [self objectOrNilForKey:kVideoListPlayInfoType fromDictionary:dict];
            self.url = [self objectOrNilForKey:kVideoListPlayInfoUrl fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kVideoListPlayInfoWidth fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kVideoListPlayInfoHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kVideoListPlayInfoName];
    [mutableDict setValue:self.type forKey:kVideoListPlayInfoType];
    [mutableDict setValue:self.url forKey:kVideoListPlayInfoUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kVideoListPlayInfoWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kVideoListPlayInfoHeight];

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

    self.name = [aDecoder decodeObjectForKey:kVideoListPlayInfoName];
    self.type = [aDecoder decodeObjectForKey:kVideoListPlayInfoType];
    self.url = [aDecoder decodeObjectForKey:kVideoListPlayInfoUrl];
    self.width = [aDecoder decodeDoubleForKey:kVideoListPlayInfoWidth];
    self.height = [aDecoder decodeDoubleForKey:kVideoListPlayInfoHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kVideoListPlayInfoName];
    [aCoder encodeObject:_type forKey:kVideoListPlayInfoType];
    [aCoder encodeObject:_url forKey:kVideoListPlayInfoUrl];
    [aCoder encodeDouble:_width forKey:kVideoListPlayInfoWidth];
    [aCoder encodeDouble:_height forKey:kVideoListPlayInfoHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListPlayInfo *copy = [[VideoListPlayInfo alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.width = self.width;
        copy.height = self.height;
    }
    
    return copy;
}


@end
