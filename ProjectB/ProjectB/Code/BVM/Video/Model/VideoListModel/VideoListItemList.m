//
//  VideoListItemList.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListItemList.h"
#import "VideoListData.h"


NSString *const kVideoListItemListType = @"type";
NSString *const kVideoListItemListData = @"data";


@interface VideoListItemList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListItemList

@synthesize type = _type;
@synthesize data = _data;


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
            self.type = [self objectOrNilForKey:kVideoListItemListType fromDictionary:dict];
            self.data = [VideoListData modelObjectWithDictionary:[dict objectForKey:kVideoListItemListData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kVideoListItemListType];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kVideoListItemListData];

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

    self.type = [aDecoder decodeObjectForKey:kVideoListItemListType];
    self.data = [aDecoder decodeObjectForKey:kVideoListItemListData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kVideoListItemListType];
    [aCoder encodeObject:_data forKey:kVideoListItemListData];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListItemList *copy = [[VideoListItemList alloc] init];
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}




@end
