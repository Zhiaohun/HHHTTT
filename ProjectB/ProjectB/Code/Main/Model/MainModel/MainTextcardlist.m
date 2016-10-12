//
//  MainTextcardlist.m
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainTextcardlist.h"
#import "MainOriginbook.h"
#import "MainCreator.h"


NSString *const kMainTextcardlistContent = @"content";
NSString *const kMainTextcardlistCategory = @"category";
NSString *const kMainTextcardlistTextcardid = @"textcardid";
NSString *const kMainTextcardlistAva = @"ava";
NSString *const kMainTextcardlistOriginbook = @"originbook";
NSString *const kMainTextcardlistCommentcnt = @"commentcnt";
NSString *const kMainTextcardlistPriv = @"priv";
NSString *const kMainTextcardlistFrom = @"from";
NSString *const kMainTextcardlistPicpath = @"picpath";
NSString *const kMainTextcardlistType = @"type";
NSString *const kMainTextcardlistTitle = @"title";
NSString *const kMainTextcardlistOriginal = @"original";
NSString *const kMainTextcardlistCreator = @"creator";
NSString *const kMainTextcardlistRec = @"rec";
NSString *const kMainTextcardlistCollectcnt = @"collectcnt";
NSString *const kMainTextcardlistCommercialtag = @"commercialtag";
NSString *const kMainTextcardlistDatetime = @"datetime";


@interface MainTextcardlist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainTextcardlist

@synthesize content = _content;
@synthesize category = _category;
@synthesize textcardid = _textcardid;
@synthesize ava = _ava;
@synthesize originbook = _originbook;
@synthesize commentcnt = _commentcnt;
@synthesize priv = _priv;
@synthesize from = _from;
@synthesize picpath = _picpath;
@synthesize type = _type;
@synthesize title = _title;
@synthesize original = _original;
@synthesize creator = _creator;
@synthesize rec = _rec;
@synthesize collectcnt = _collectcnt;
@synthesize commercialtag = _commercialtag;
@synthesize datetime = _datetime;


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
            self.content = [self objectOrNilForKey:kMainTextcardlistContent fromDictionary:dict];
            self.category = [self objectOrNilForKey:kMainTextcardlistCategory fromDictionary:dict];
            self.textcardid = [self objectOrNilForKey:kMainTextcardlistTextcardid fromDictionary:dict];
            self.ava = [self objectOrNilForKey:kMainTextcardlistAva fromDictionary:dict];
            self.originbook = [MainOriginbook modelObjectWithDictionary:[dict objectForKey:kMainTextcardlistOriginbook]];
            self.commentcnt = [self objectOrNilForKey:kMainTextcardlistCommentcnt fromDictionary:dict];
            self.priv = [self objectOrNilForKey:kMainTextcardlistPriv fromDictionary:dict];
            self.from = [self objectOrNilForKey:kMainTextcardlistFrom fromDictionary:dict];
            self.picpath = [self objectOrNilForKey:kMainTextcardlistPicpath fromDictionary:dict];
            self.type = [self objectOrNilForKey:kMainTextcardlistType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMainTextcardlistTitle fromDictionary:dict];
            self.original = [self objectOrNilForKey:kMainTextcardlistOriginal fromDictionary:dict];
            self.creator = [MainCreator modelObjectWithDictionary:[dict objectForKey:kMainTextcardlistCreator]];
            self.rec = [self objectOrNilForKey:kMainTextcardlistRec fromDictionary:dict];
            self.collectcnt = [self objectOrNilForKey:kMainTextcardlistCollectcnt fromDictionary:dict];
            self.commercialtag = [self objectOrNilForKey:kMainTextcardlistCommercialtag fromDictionary:dict];
            self.datetime = [self objectOrNilForKey:kMainTextcardlistDatetime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.content forKey:kMainTextcardlistContent];
    [mutableDict setValue:self.category forKey:kMainTextcardlistCategory];
    [mutableDict setValue:self.textcardid forKey:kMainTextcardlistTextcardid];
    [mutableDict setValue:self.ava forKey:kMainTextcardlistAva];
    [mutableDict setValue:[self.originbook dictionaryRepresentation] forKey:kMainTextcardlistOriginbook];
    [mutableDict setValue:self.commentcnt forKey:kMainTextcardlistCommentcnt];
    [mutableDict setValue:self.priv forKey:kMainTextcardlistPriv];
    [mutableDict setValue:self.from forKey:kMainTextcardlistFrom];
    [mutableDict setValue:self.picpath forKey:kMainTextcardlistPicpath];
    [mutableDict setValue:self.type forKey:kMainTextcardlistType];
    [mutableDict setValue:self.title forKey:kMainTextcardlistTitle];
    [mutableDict setValue:self.original forKey:kMainTextcardlistOriginal];
    [mutableDict setValue:[self.creator dictionaryRepresentation] forKey:kMainTextcardlistCreator];
    [mutableDict setValue:self.rec forKey:kMainTextcardlistRec];
    [mutableDict setValue:self.collectcnt forKey:kMainTextcardlistCollectcnt];
    [mutableDict setValue:self.commercialtag forKey:kMainTextcardlistCommercialtag];
    [mutableDict setValue:self.datetime forKey:kMainTextcardlistDatetime];

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

    self.content = [aDecoder decodeObjectForKey:kMainTextcardlistContent];
    self.category = [aDecoder decodeObjectForKey:kMainTextcardlistCategory];
    self.textcardid = [aDecoder decodeObjectForKey:kMainTextcardlistTextcardid];
    self.ava = [aDecoder decodeObjectForKey:kMainTextcardlistAva];
    self.originbook = [aDecoder decodeObjectForKey:kMainTextcardlistOriginbook];
    self.commentcnt = [aDecoder decodeObjectForKey:kMainTextcardlistCommentcnt];
    self.priv = [aDecoder decodeObjectForKey:kMainTextcardlistPriv];
    self.from = [aDecoder decodeObjectForKey:kMainTextcardlistFrom];
    self.picpath = [aDecoder decodeObjectForKey:kMainTextcardlistPicpath];
    self.type = [aDecoder decodeObjectForKey:kMainTextcardlistType];
    self.title = [aDecoder decodeObjectForKey:kMainTextcardlistTitle];
    self.original = [aDecoder decodeObjectForKey:kMainTextcardlistOriginal];
    self.creator = [aDecoder decodeObjectForKey:kMainTextcardlistCreator];
    self.rec = [aDecoder decodeObjectForKey:kMainTextcardlistRec];
    self.collectcnt = [aDecoder decodeObjectForKey:kMainTextcardlistCollectcnt];
    self.commercialtag = [aDecoder decodeObjectForKey:kMainTextcardlistCommercialtag];
    self.datetime = [aDecoder decodeObjectForKey:kMainTextcardlistDatetime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_content forKey:kMainTextcardlistContent];
    [aCoder encodeObject:_category forKey:kMainTextcardlistCategory];
    [aCoder encodeObject:_textcardid forKey:kMainTextcardlistTextcardid];
    [aCoder encodeObject:_ava forKey:kMainTextcardlistAva];
    [aCoder encodeObject:_originbook forKey:kMainTextcardlistOriginbook];
    [aCoder encodeObject:_commentcnt forKey:kMainTextcardlistCommentcnt];
    [aCoder encodeObject:_priv forKey:kMainTextcardlistPriv];
    [aCoder encodeObject:_from forKey:kMainTextcardlistFrom];
    [aCoder encodeObject:_picpath forKey:kMainTextcardlistPicpath];
    [aCoder encodeObject:_type forKey:kMainTextcardlistType];
    [aCoder encodeObject:_title forKey:kMainTextcardlistTitle];
    [aCoder encodeObject:_original forKey:kMainTextcardlistOriginal];
    [aCoder encodeObject:_creator forKey:kMainTextcardlistCreator];
    [aCoder encodeObject:_rec forKey:kMainTextcardlistRec];
    [aCoder encodeObject:_collectcnt forKey:kMainTextcardlistCollectcnt];
    [aCoder encodeObject:_commercialtag forKey:kMainTextcardlistCommercialtag];
    [aCoder encodeObject:_datetime forKey:kMainTextcardlistDatetime];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainTextcardlist *copy = [[MainTextcardlist alloc] init];
    
    if (copy) {

        copy.content = [self.content copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.textcardid = [self.textcardid copyWithZone:zone];
        copy.ava = [self.ava copyWithZone:zone];
        copy.originbook = [self.originbook copyWithZone:zone];
        copy.commentcnt = [self.commentcnt copyWithZone:zone];
        copy.priv = [self.priv copyWithZone:zone];
        copy.from = [self.from copyWithZone:zone];
        copy.picpath = [self.picpath copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.original = [self.original copyWithZone:zone];
        copy.creator = [self.creator copyWithZone:zone];
        copy.rec = [self.rec copyWithZone:zone];
        copy.collectcnt = [self.collectcnt copyWithZone:zone];
        copy.commercialtag = [self.commercialtag copyWithZone:zone];
        copy.datetime = [self.datetime copyWithZone:zone];
    }
    
    return copy;
}


@end
