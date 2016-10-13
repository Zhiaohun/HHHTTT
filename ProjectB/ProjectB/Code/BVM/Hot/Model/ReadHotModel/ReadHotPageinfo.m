//
//  ReadHotPageinfo.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadHotPageinfo.h"


NSString *const kReadHotPageinfoEnd = @"end";
NSString *const kReadHotPageinfoStart = @"start";
NSString *const kReadHotPageinfoNext = @"next";
NSString *const kReadHotPageinfoPagesize = @"pagesize";
NSString *const kReadHotPageinfoTotal = @"total";
NSString *const kReadHotPageinfoPage = @"page";
NSString *const kReadHotPageinfoPageCount = @"page_count";


@interface ReadHotPageinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadHotPageinfo

@synthesize endProperty = _endProperty;
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
            self.endProperty = [[self objectOrNilForKey:kReadHotPageinfoEnd fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kReadHotPageinfoStart fromDictionary:dict] doubleValue];
            self.next = [[self objectOrNilForKey:kReadHotPageinfoNext fromDictionary:dict] doubleValue];
            self.pagesize = [self objectOrNilForKey:kReadHotPageinfoPagesize fromDictionary:dict];
            self.total = [[self objectOrNilForKey:kReadHotPageinfoTotal fromDictionary:dict] doubleValue];
            self.page = [self objectOrNilForKey:kReadHotPageinfoPage fromDictionary:dict];
            self.pageCount = [[self objectOrNilForKey:kReadHotPageinfoPageCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kReadHotPageinfoEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kReadHotPageinfoStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.next] forKey:kReadHotPageinfoNext];
    [mutableDict setValue:self.pagesize forKey:kReadHotPageinfoPagesize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kReadHotPageinfoTotal];
    [mutableDict setValue:self.page forKey:kReadHotPageinfoPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kReadHotPageinfoPageCount];

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

    self.endProperty = [aDecoder decodeDoubleForKey:kReadHotPageinfoEnd];
    self.start = [aDecoder decodeDoubleForKey:kReadHotPageinfoStart];
    self.next = [aDecoder decodeDoubleForKey:kReadHotPageinfoNext];
    self.pagesize = [aDecoder decodeObjectForKey:kReadHotPageinfoPagesize];
    self.total = [aDecoder decodeDoubleForKey:kReadHotPageinfoTotal];
    self.page = [aDecoder decodeObjectForKey:kReadHotPageinfoPage];
    self.pageCount = [aDecoder decodeDoubleForKey:kReadHotPageinfoPageCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_endProperty forKey:kReadHotPageinfoEnd];
    [aCoder encodeDouble:_start forKey:kReadHotPageinfoStart];
    [aCoder encodeDouble:_next forKey:kReadHotPageinfoNext];
    [aCoder encodeObject:_pagesize forKey:kReadHotPageinfoPagesize];
    [aCoder encodeDouble:_total forKey:kReadHotPageinfoTotal];
    [aCoder encodeObject:_page forKey:kReadHotPageinfoPage];
    [aCoder encodeDouble:_pageCount forKey:kReadHotPageinfoPageCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadHotPageinfo *copy = [[ReadHotPageinfo alloc] init];
    
    if (copy) {

        copy.endProperty = self.endProperty;
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
