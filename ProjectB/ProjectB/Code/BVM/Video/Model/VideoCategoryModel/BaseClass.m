//
//  BaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "ItemList.h"


NSString *const kBaseClassNextPageUrl = @"nextPageUrl";
NSString *const kBaseClassCount = @"count";
NSString *const kBaseClassItemList = @"itemList";
NSString *const kBaseClassTotal = @"total";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize nextPageUrl = _nextPageUrl;
@synthesize count = _count;
@synthesize itemList = _itemList;
@synthesize total = _total;


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
            self.nextPageUrl = [self objectOrNilForKey:kBaseClassNextPageUrl fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kBaseClassCount fromDictionary:dict] doubleValue];
    NSObject *receivedItemList = [dict objectForKey:kBaseClassItemList];
    NSMutableArray *parsedItemList = [NSMutableArray array];
    if ([receivedItemList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItemList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItemList addObject:[ItemList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItemList isKindOfClass:[NSDictionary class]]) {
       [parsedItemList addObject:[ItemList modelObjectWithDictionary:(NSDictionary *)receivedItemList]];
    }

    self.itemList = [NSArray arrayWithArray:parsedItemList];
            self.total = [[self objectOrNilForKey:kBaseClassTotal fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.nextPageUrl forKey:kBaseClassNextPageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kBaseClassCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kBaseClassItemList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kBaseClassTotal];

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

    self.nextPageUrl = [aDecoder decodeObjectForKey:kBaseClassNextPageUrl];
    self.count = [aDecoder decodeDoubleForKey:kBaseClassCount];
    self.itemList = [aDecoder decodeObjectForKey:kBaseClassItemList];
    self.total = [aDecoder decodeDoubleForKey:kBaseClassTotal];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_nextPageUrl forKey:kBaseClassNextPageUrl];
    [aCoder encodeDouble:_count forKey:kBaseClassCount];
    [aCoder encodeObject:_itemList forKey:kBaseClassItemList];
    [aCoder encodeDouble:_total forKey:kBaseClassTotal];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.nextPageUrl = [self.nextPageUrl copyWithZone:zone];
        copy.count = self.count;
        copy.itemList = [self.itemList copyWithZone:zone];
        copy.total = self.total;
    }
    
    return copy;
}


@end
