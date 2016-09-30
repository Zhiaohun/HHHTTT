//
//  VideoListConsumption.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListConsumption.h"


NSString *const kVideoListConsumptionReplyCount = @"replyCount";
NSString *const kVideoListConsumptionShareCount = @"shareCount";
NSString *const kVideoListConsumptionCollectionCount = @"collectionCount";


@interface VideoListConsumption ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListConsumption

@synthesize replyCount = _replyCount;
@synthesize shareCount = _shareCount;
@synthesize collectionCount = _collectionCount;


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
            self.replyCount = [[self objectOrNilForKey:kVideoListConsumptionReplyCount fromDictionary:dict] doubleValue];
            self.shareCount = [[self objectOrNilForKey:kVideoListConsumptionShareCount fromDictionary:dict] doubleValue];
            self.collectionCount = [[self objectOrNilForKey:kVideoListConsumptionCollectionCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kVideoListConsumptionReplyCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shareCount] forKey:kVideoListConsumptionShareCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collectionCount] forKey:kVideoListConsumptionCollectionCount];

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

    self.replyCount = [aDecoder decodeDoubleForKey:kVideoListConsumptionReplyCount];
    self.shareCount = [aDecoder decodeDoubleForKey:kVideoListConsumptionShareCount];
    self.collectionCount = [aDecoder decodeDoubleForKey:kVideoListConsumptionCollectionCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_replyCount forKey:kVideoListConsumptionReplyCount];
    [aCoder encodeDouble:_shareCount forKey:kVideoListConsumptionShareCount];
    [aCoder encodeDouble:_collectionCount forKey:kVideoListConsumptionCollectionCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListConsumption *copy = [[VideoListConsumption alloc] init];
    
    if (copy) {

        copy.replyCount = self.replyCount;
        copy.shareCount = self.shareCount;
        copy.collectionCount = self.collectionCount;
    }
    
    return copy;
}


@end
