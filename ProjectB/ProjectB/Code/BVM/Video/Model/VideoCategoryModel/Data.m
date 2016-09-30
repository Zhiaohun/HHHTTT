//
//  Data.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Data.h"


NSString *const kDataDataType = @"dataType";
NSString *const kDataId = @"id";
NSString *const kDataShade = @"shade";
NSString *const kDataTitle = @"title";
NSString *const kDataImage = @"image";
NSString *const kDataCount = @"count";
NSString *const kDataActionUrl = @"actionUrl";
NSString *const kDataAdTrack = @"adTrack";
NSString *const kDataItemList = @"itemList";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize dataType = _dataType;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize shade = _shade;
@synthesize title = _title;
@synthesize image = _image;
@synthesize count = _count;
@synthesize actionUrl = _actionUrl;
@synthesize adTrack = _adTrack;
@synthesize itemList = _itemList;


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
            self.dataType = [self objectOrNilForKey:kDataDataType fromDictionary:dict];
            self.dataIdentifier = [[self objectOrNilForKey:kDataId fromDictionary:dict] doubleValue];
            self.shade = [[self objectOrNilForKey:kDataShade fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kDataTitle fromDictionary:dict];
            self.image = [self objectOrNilForKey:kDataImage fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kDataCount fromDictionary:dict] doubleValue];
            self.actionUrl = [self objectOrNilForKey:kDataActionUrl fromDictionary:dict];
            self.adTrack = [self objectOrNilForKey:kDataAdTrack fromDictionary:dict];
            self.itemList = [self objectOrNilForKey:kDataItemList fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataType forKey:kDataDataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kDataId];
    [mutableDict setValue:[NSNumber numberWithBool:self.shade] forKey:kDataShade];
    [mutableDict setValue:self.title forKey:kDataTitle];
    [mutableDict setValue:self.image forKey:kDataImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kDataCount];
    [mutableDict setValue:self.actionUrl forKey:kDataActionUrl];
    [mutableDict setValue:self.adTrack forKey:kDataAdTrack];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemList] forKey:kDataItemList];

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

    self.dataType = [aDecoder decodeObjectForKey:kDataDataType];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kDataId];
    self.shade = [aDecoder decodeBoolForKey:kDataShade];
    self.title = [aDecoder decodeObjectForKey:kDataTitle];
    self.image = [aDecoder decodeObjectForKey:kDataImage];
    self.count = [aDecoder decodeDoubleForKey:kDataCount];
    self.actionUrl = [aDecoder decodeObjectForKey:kDataActionUrl];
    self.adTrack = [aDecoder decodeObjectForKey:kDataAdTrack];
    self.itemList = [aDecoder decodeObjectForKey:kDataItemList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataType forKey:kDataDataType];
    [aCoder encodeDouble:_dataIdentifier forKey:kDataId];
    [aCoder encodeBool:_shade forKey:kDataShade];
    [aCoder encodeObject:_title forKey:kDataTitle];
    [aCoder encodeObject:_image forKey:kDataImage];
    [aCoder encodeDouble:_count forKey:kDataCount];
    [aCoder encodeObject:_actionUrl forKey:kDataActionUrl];
    [aCoder encodeObject:_adTrack forKey:kDataAdTrack];
    [aCoder encodeObject:_itemList forKey:kDataItemList];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.dataType = [self.dataType copyWithZone:zone];
        copy.dataIdentifier = self.dataIdentifier;
        copy.shade = self.shade;
        copy.title = [self.title copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.count = self.count;
        copy.actionUrl = [self.actionUrl copyWithZone:zone];
        copy.adTrack = [self.adTrack copyWithZone:zone];
        copy.itemList = [self.itemList copyWithZone:zone];
    }
    
    return copy;
}


@end
