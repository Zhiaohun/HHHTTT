//
//  NewsEntertainmentAds.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsEntertainmentAds.h"


NSString *const kNewsEntertainmentAdsTag = @"tag";
NSString *const kNewsEntertainmentAdsTitle = @"title";
NSString *const kNewsEntertainmentAdsUrl = @"url";
NSString *const kNewsEntertainmentAdsImgsrc = @"imgsrc";
NSString *const kNewsEntertainmentAdsSubtitle = @"subtitle";


@interface NewsEntertainmentAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsEntertainmentAds

@synthesize tag = _tag;
@synthesize title = _title;
@synthesize url = _url;
@synthesize imgsrc = _imgsrc;
@synthesize subtitle = _subtitle;


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
            self.tag = [self objectOrNilForKey:kNewsEntertainmentAdsTag fromDictionary:dict];
            self.title = [self objectOrNilForKey:kNewsEntertainmentAdsTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsEntertainmentAdsUrl fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kNewsEntertainmentAdsImgsrc fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kNewsEntertainmentAdsSubtitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tag forKey:kNewsEntertainmentAdsTag];
    [mutableDict setValue:self.title forKey:kNewsEntertainmentAdsTitle];
    [mutableDict setValue:self.url forKey:kNewsEntertainmentAdsUrl];
    [mutableDict setValue:self.imgsrc forKey:kNewsEntertainmentAdsImgsrc];
    [mutableDict setValue:self.subtitle forKey:kNewsEntertainmentAdsSubtitle];

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

    self.tag = [aDecoder decodeObjectForKey:kNewsEntertainmentAdsTag];
    self.title = [aDecoder decodeObjectForKey:kNewsEntertainmentAdsTitle];
    self.url = [aDecoder decodeObjectForKey:kNewsEntertainmentAdsUrl];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsEntertainmentAdsImgsrc];
    self.subtitle = [aDecoder decodeObjectForKey:kNewsEntertainmentAdsSubtitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tag forKey:kNewsEntertainmentAdsTag];
    [aCoder encodeObject:_title forKey:kNewsEntertainmentAdsTitle];
    [aCoder encodeObject:_url forKey:kNewsEntertainmentAdsUrl];
    [aCoder encodeObject:_imgsrc forKey:kNewsEntertainmentAdsImgsrc];
    [aCoder encodeObject:_subtitle forKey:kNewsEntertainmentAdsSubtitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsEntertainmentAds *copy = [[NewsEntertainmentAds alloc] init];
    
    if (copy) {

        copy.tag = [self.tag copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
    }
    
    return copy;
}


@end
