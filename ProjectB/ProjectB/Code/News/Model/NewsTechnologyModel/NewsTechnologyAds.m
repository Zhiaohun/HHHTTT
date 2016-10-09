//
//  NewsTechnologyAds.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsTechnologyAds.h"


NSString *const kNewsTechnologyAdsTag = @"tag";
NSString *const kNewsTechnologyAdsDocid = @"docid";
NSString *const kNewsTechnologyAdsTitle = @"title";
NSString *const kNewsTechnologyAdsSubtitle = @"subtitle";
NSString *const kNewsTechnologyAdsImgsrc = @"imgsrc";
NSString *const kNewsTechnologyAdsUrl = @"url";


@interface NewsTechnologyAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsTechnologyAds

@synthesize tag = _tag;
@synthesize docid = _docid;
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
            self.tag = [self objectOrNilForKey:kNewsTechnologyAdsTag fromDictionary:dict];
            self.docid = [self objectOrNilForKey:kNewsTechnologyAdsDocid fromDictionary:dict];
            self.title = [self objectOrNilForKey:kNewsTechnologyAdsTitle fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kNewsTechnologyAdsSubtitle fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kNewsTechnologyAdsImgsrc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsTechnologyAdsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tag forKey:kNewsTechnologyAdsTag];
    [mutableDict setValue:self.docid forKey:kNewsTechnologyAdsDocid];
    [mutableDict setValue:self.title forKey:kNewsTechnologyAdsTitle];
    [mutableDict setValue:self.subtitle forKey:kNewsTechnologyAdsSubtitle];
    [mutableDict setValue:self.imgsrc forKey:kNewsTechnologyAdsImgsrc];
    [mutableDict setValue:self.url forKey:kNewsTechnologyAdsUrl];

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

    self.tag = [aDecoder decodeObjectForKey:kNewsTechnologyAdsTag];
    self.docid = [aDecoder decodeObjectForKey:kNewsTechnologyAdsDocid];
    self.title = [aDecoder decodeObjectForKey:kNewsTechnologyAdsTitle];
    self.subtitle = [aDecoder decodeObjectForKey:kNewsTechnologyAdsSubtitle];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsTechnologyAdsImgsrc];
    self.url = [aDecoder decodeObjectForKey:kNewsTechnologyAdsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tag forKey:kNewsTechnologyAdsTag];
    [aCoder encodeObject:_docid forKey:kNewsTechnologyAdsDocid];
    [aCoder encodeObject:_title forKey:kNewsTechnologyAdsTitle];
    [aCoder encodeObject:_subtitle forKey:kNewsTechnologyAdsSubtitle];
    [aCoder encodeObject:_imgsrc forKey:kNewsTechnologyAdsImgsrc];
    [aCoder encodeObject:_url forKey:kNewsTechnologyAdsUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsTechnologyAds *copy = [[NewsTechnologyAds alloc] init];
    
    if (copy) {

        copy.tag = [self.tag copyWithZone:zone];
        copy.docid = [self.docid copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
