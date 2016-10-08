//
//  ReadCommentPageinfo.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadCommentPageinfo.h"


NSString *const kReadCommentPageinfoEnd = @"end";
NSString *const kReadCommentPageinfoStart = @"start";
NSString *const kReadCommentPageinfoNext = @"next";
NSString *const kReadCommentPageinfoPagesize = @"pagesize";
NSString *const kReadCommentPageinfoTotal = @"total";
NSString *const kReadCommentPageinfoPage = @"page";
NSString *const kReadCommentPageinfoPageCount = @"page_count";


@interface ReadCommentPageinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadCommentPageinfo

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
            self.endProperty = [[self objectOrNilForKey:kReadCommentPageinfoEnd fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kReadCommentPageinfoStart fromDictionary:dict] doubleValue];
            self.next = [[self objectOrNilForKey:kReadCommentPageinfoNext fromDictionary:dict] doubleValue];
            self.pagesize = [self objectOrNilForKey:kReadCommentPageinfoPagesize fromDictionary:dict];
            self.total = [self objectOrNilForKey:kReadCommentPageinfoTotal fromDictionary:dict];
            self.page = [[self objectOrNilForKey:kReadCommentPageinfoPage fromDictionary:dict] doubleValue];
            self.pageCount = [[self objectOrNilForKey:kReadCommentPageinfoPageCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kReadCommentPageinfoEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kReadCommentPageinfoStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.next] forKey:kReadCommentPageinfoNext];
    [mutableDict setValue:self.pagesize forKey:kReadCommentPageinfoPagesize];
    [mutableDict setValue:self.total forKey:kReadCommentPageinfoTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kReadCommentPageinfoPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kReadCommentPageinfoPageCount];

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

    self.endProperty = [aDecoder decodeDoubleForKey:kReadCommentPageinfoEnd];
    self.start = [aDecoder decodeDoubleForKey:kReadCommentPageinfoStart];
    self.next = [aDecoder decodeDoubleForKey:kReadCommentPageinfoNext];
    self.pagesize = [aDecoder decodeObjectForKey:kReadCommentPageinfoPagesize];
    self.total = [aDecoder decodeObjectForKey:kReadCommentPageinfoTotal];
    self.page = [aDecoder decodeDoubleForKey:kReadCommentPageinfoPage];
    self.pageCount = [aDecoder decodeDoubleForKey:kReadCommentPageinfoPageCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_endProperty forKey:kReadCommentPageinfoEnd];
    [aCoder encodeDouble:_start forKey:kReadCommentPageinfoStart];
    [aCoder encodeDouble:_next forKey:kReadCommentPageinfoNext];
    [aCoder encodeObject:_pagesize forKey:kReadCommentPageinfoPagesize];
    [aCoder encodeObject:_total forKey:kReadCommentPageinfoTotal];
    [aCoder encodeDouble:_page forKey:kReadCommentPageinfoPage];
    [aCoder encodeDouble:_pageCount forKey:kReadCommentPageinfoPageCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadCommentPageinfo *copy = [[ReadCommentPageinfo alloc] init];
    
    if (copy) {

        copy.endProperty = self.endProperty;
        copy.start = self.start;
        copy.next = self.next;
        copy.pagesize = [self.pagesize copyWithZone:zone];
        copy.total = [self.total copyWithZone:zone];
        copy.page = self.page;
        copy.pageCount = self.pageCount;
    }
    
    return copy;
}


@end
