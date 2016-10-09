//
//  NewsGameWapPortal.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsGameWapPortal.h"


NSString *const kNewsGameWapPortalTitle = @"title";
NSString *const kNewsGameWapPortalSubtitle = @"subtitle";
NSString *const kNewsGameWapPortalImgsrc = @"imgsrc";
NSString *const kNewsGameWapPortalUrl = @"url";


@interface NewsGameWapPortal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsGameWapPortal

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize imgsrc = _imgsrc;
@synthesize url = _url;


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
            self.title = [self objectOrNilForKey:kNewsGameWapPortalTitle fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kNewsGameWapPortalSubtitle fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kNewsGameWapPortalImgsrc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsGameWapPortalUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kNewsGameWapPortalTitle];
    [mutableDict setValue:self.subtitle forKey:kNewsGameWapPortalSubtitle];
    [mutableDict setValue:self.imgsrc forKey:kNewsGameWapPortalImgsrc];
    [mutableDict setValue:self.url forKey:kNewsGameWapPortalUrl];

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

    self.title = [aDecoder decodeObjectForKey:kNewsGameWapPortalTitle];
    self.subtitle = [aDecoder decodeObjectForKey:kNewsGameWapPortalSubtitle];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsGameWapPortalImgsrc];
    self.url = [aDecoder decodeObjectForKey:kNewsGameWapPortalUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kNewsGameWapPortalTitle];
    [aCoder encodeObject:_subtitle forKey:kNewsGameWapPortalSubtitle];
    [aCoder encodeObject:_imgsrc forKey:kNewsGameWapPortalImgsrc];
    [aCoder encodeObject:_url forKey:kNewsGameWapPortalUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsGameWapPortal *copy = [[NewsGameWapPortal alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
