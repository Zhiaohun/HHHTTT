//
//  VideoListBaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListBaseClass.h"
#import "VideoListItemList.h"
#import "VideoListTag.h"


NSString *const kVideoListBaseClassNextPageUrl = @"nextPageUrl";
NSString *const kVideoListBaseClassCount = @"count";
NSString *const kVideoListBaseClassItemList = @"itemList";
NSString *const kVideoListBaseClassTotal = @"total";
NSString *const kVideoListBaseClassTag = @"tag";


@interface VideoListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListBaseClass

@synthesize nextPageUrl = _nextPageUrl;
@synthesize count = _count;
@synthesize itemList = _itemList;
@synthesize total = _total;
@synthesize tag = _tag;


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
            self.nextPageUrl = [self objectOrNilForKey:kVideoListBaseClassNextPageUrl fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kVideoListBaseClassCount fromDictionary:dict] doubleValue];
    NSObject *receivedVideoListItemList = [dict objectForKey:kVideoListBaseClassItemList];
    NSMutableArray *parsedVideoListItemList = [NSMutableArray array];
    if ([receivedVideoListItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVideoListItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVideoListItemList addObject:[VideoListItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVideoListItemList isKindOfClass:[NSDictionary class]]) {
       [parsedVideoListItemList addObject:[VideoListItemList modelObjectWithDictionary:(NSDictionary *)receivedVideoListItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedVideoListItemList];
            self.total = [[self objectOrNilForKey:kVideoListBaseClassTotal fromDictionary:dict] doubleValue];
            self.tag = [VideoListTag modelObjectWithDictionary:[dict objectForKey:kVideoListBaseClassTag]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.nextPageUrl forKey:kVideoListBaseClassNextPageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kVideoListBaseClassCount];
    NSMutableArray *tempArrayForItemList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kVideoListBaseClassItemList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kVideoListBaseClassTotal];
    [mutableDict setValue:[self.tag dictionaryRepresentation] forKey:kVideoListBaseClassTag];

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

    self.nextPageUrl = [aDecoder decodeObjectForKey:kVideoListBaseClassNextPageUrl];
    self.count = [aDecoder decodeDoubleForKey:kVideoListBaseClassCount];
    self.itemList = [aDecoder decodeObjectForKey:kVideoListBaseClassItemList];
    self.total = [aDecoder decodeDoubleForKey:kVideoListBaseClassTotal];
    self.tag = [aDecoder decodeObjectForKey:kVideoListBaseClassTag];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_nextPageUrl forKey:kVideoListBaseClassNextPageUrl];
    [aCoder encodeDouble:_count forKey:kVideoListBaseClassCount];
    [aCoder encodeObject:_itemList forKey:kVideoListBaseClassItemList];
    [aCoder encodeDouble:_total forKey:kVideoListBaseClassTotal];
    [aCoder encodeObject:_tag forKey:kVideoListBaseClassTag];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListBaseClass *copy = [[VideoListBaseClass alloc] init];
    
    if (copy) {

        copy.nextPageUrl = [self.nextPageUrl copyWithZone:zone];
        copy.count = self.count;
        copy.itemList = [self.itemList copyWithZone:zone];
        copy.total = self.total;
        copy.tag = [self.tag copyWithZone:zone];
    }
    
    return copy;
}


@end
