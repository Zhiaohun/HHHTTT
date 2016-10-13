//
//  ReadRankListPageinfo.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadRankListPageinfo.h"


NSString *const kReadRankListPageinfoEnd = @"end";
NSString *const kReadRankListPageinfoPrev = @"prev";
NSString *const kReadRankListPageinfoStart = @"start";
NSString *const kReadRankListPageinfoNext = @"next";
NSString *const kReadRankListPageinfoPagesize = @"pagesize";
NSString *const kReadRankListPageinfoTotal = @"total";
NSString *const kReadRankListPageinfoPage = @"page";
NSString *const kReadRankListPageinfoPageCount = @"page_count";


@interface ReadRankListPageinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadRankListPageinfo

@synthesize endProperty = _endProperty;
@synthesize prev = _prev;
@synthesize start = _start;
@synthesize next = _next;
@synthesize pagesize = _pagesize;
@synthesize total = _total;
@synthesize page = _page;
@synthesize pageCount = _pageCount;


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
            self.endProperty = [[self objectOrNilForKey:kReadRankListPageinfoEnd fromDictionary:dict] doubleValue];
            self.prev = [[self objectOrNilForKey:kReadRankListPageinfoPrev fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kReadRankListPageinfoStart fromDictionary:dict] doubleValue];
            self.next = [[self objectOrNilForKey:kReadRankListPageinfoNext fromDictionary:dict] doubleValue];
            self.pagesize = [self objectOrNilForKey:kReadRankListPageinfoPagesize fromDictionary:dict];
            self.total = [[self objectOrNilForKey:kReadRankListPageinfoTotal fromDictionary:dict] doubleValue];
            self.page = [self objectOrNilForKey:kReadRankListPageinfoPage fromDictionary:dict];
            self.pageCount = [[self objectOrNilForKey:kReadRankListPageinfoPageCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kReadRankListPageinfoEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.prev] forKey:kReadRankListPageinfoPrev];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kReadRankListPageinfoStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.next] forKey:kReadRankListPageinfoNext];
    [mutableDict setValue:self.pagesize forKey:kReadRankListPageinfoPagesize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kReadRankListPageinfoTotal];
    [mutableDict setValue:self.page forKey:kReadRankListPageinfoPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kReadRankListPageinfoPageCount];

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

    self.endProperty = [aDecoder decodeDoubleForKey:kReadRankListPageinfoEnd];
    self.prev = [aDecoder decodeDoubleForKey:kReadRankListPageinfoPrev];
    self.start = [aDecoder decodeDoubleForKey:kReadRankListPageinfoStart];
    self.next = [aDecoder decodeDoubleForKey:kReadRankListPageinfoNext];
    self.pagesize = [aDecoder decodeObjectForKey:kReadRankListPageinfoPagesize];
    self.total = [aDecoder decodeDoubleForKey:kReadRankListPageinfoTotal];
    self.page = [aDecoder decodeObjectForKey:kReadRankListPageinfoPage];
    self.pageCount = [aDecoder decodeDoubleForKey:kReadRankListPageinfoPageCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_endProperty forKey:kReadRankListPageinfoEnd];
    [aCoder encodeDouble:_prev forKey:kReadRankListPageinfoPrev];
    [aCoder encodeDouble:_start forKey:kReadRankListPageinfoStart];
    [aCoder encodeDouble:_next forKey:kReadRankListPageinfoNext];
    [aCoder encodeObject:_pagesize forKey:kReadRankListPageinfoPagesize];
    [aCoder encodeDouble:_total forKey:kReadRankListPageinfoTotal];
    [aCoder encodeObject:_page forKey:kReadRankListPageinfoPage];
    [aCoder encodeDouble:_pageCount forKey:kReadRankListPageinfoPageCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadRankListPageinfo *copy = [[ReadRankListPageinfo alloc] init];
    
    if (copy) {

        copy.endProperty = self.endProperty;
        copy.prev = self.prev;
        copy.start = self.start;
        copy.next = self.next;
        copy.pagesize = [self.pagesize copyWithZone:zone];
        copy.total = self.total;
        copy.page = [self.page copyWithZone:zone];
        copy.pageCount = self.pageCount;
    }
    
    return copy;
}


@end
