//
//  MainOriginbook.m
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainOriginbook.h"


NSString *const kMainOriginbookCardcnt = @"cardcnt";
NSString *const kMainOriginbookPicpath = @"picpath";
NSString *const kMainOriginbookAva = @"ava";
NSString *const kMainOriginbookBookname = @"bookname";
NSString *const kMainOriginbookBookid = @"bookid";


@interface MainOriginbook ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainOriginbook

@synthesize cardcnt = _cardcnt;
@synthesize picpath = _picpath;
@synthesize ava = _ava;
@synthesize bookname = _bookname;
@synthesize bookid = _bookid;


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
            self.cardcnt = [self objectOrNilForKey:kMainOriginbookCardcnt fromDictionary:dict];
            self.picpath = [self objectOrNilForKey:kMainOriginbookPicpath fromDictionary:dict];
            self.ava = [self objectOrNilForKey:kMainOriginbookAva fromDictionary:dict];
            self.bookname = [self objectOrNilForKey:kMainOriginbookBookname fromDictionary:dict];
            self.bookid = [self objectOrNilForKey:kMainOriginbookBookid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cardcnt forKey:kMainOriginbookCardcnt];
    [mutableDict setValue:self.picpath forKey:kMainOriginbookPicpath];
    [mutableDict setValue:self.ava forKey:kMainOriginbookAva];
    [mutableDict setValue:self.bookname forKey:kMainOriginbookBookname];
    [mutableDict setValue:self.bookid forKey:kMainOriginbookBookid];

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

    self.cardcnt = [aDecoder decodeObjectForKey:kMainOriginbookCardcnt];
    self.picpath = [aDecoder decodeObjectForKey:kMainOriginbookPicpath];
    self.ava = [aDecoder decodeObjectForKey:kMainOriginbookAva];
    self.bookname = [aDecoder decodeObjectForKey:kMainOriginbookBookname];
    self.bookid = [aDecoder decodeObjectForKey:kMainOriginbookBookid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cardcnt forKey:kMainOriginbookCardcnt];
    [aCoder encodeObject:_picpath forKey:kMainOriginbookPicpath];
    [aCoder encodeObject:_ava forKey:kMainOriginbookAva];
    [aCoder encodeObject:_bookname forKey:kMainOriginbookBookname];
    [aCoder encodeObject:_bookid forKey:kMainOriginbookBookid];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainOriginbook *copy = [[MainOriginbook alloc] init];
    
    if (copy) {

        copy.cardcnt = [self.cardcnt copyWithZone:zone];
        copy.picpath = [self.picpath copyWithZone:zone];
        copy.ava = [self.ava copyWithZone:zone];
        copy.bookname = [self.bookname copyWithZone:zone];
        copy.bookid = [self.bookid copyWithZone:zone];
    }
    
    return copy;
}


@end
