//
//  ReadRankListPrice.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadRankListPrice.h"


NSString *const kReadRankListPriceDangdangPrice = @"dangdang_price";
NSString *const kReadRankListPricePromotionPrice = @"promotion_price";
NSString *const kReadRankListPriceOriginalPrice = @"original_price";
NSString *const kReadRankListPriceExclusivePrice = @"exclusive_price";


@interface ReadRankListPrice ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadRankListPrice

@synthesize dangdangPrice = _dangdangPrice;
@synthesize promotionPrice = _promotionPrice;
@synthesize originalPrice = _originalPrice;
@synthesize exclusivePrice = _exclusivePrice;


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
            self.dangdangPrice = [self objectOrNilForKey:kReadRankListPriceDangdangPrice fromDictionary:dict];
            self.promotionPrice = [self objectOrNilForKey:kReadRankListPricePromotionPrice fromDictionary:dict];
            self.originalPrice = [self objectOrNilForKey:kReadRankListPriceOriginalPrice fromDictionary:dict];
            self.exclusivePrice = [self objectOrNilForKey:kReadRankListPriceExclusivePrice fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dangdangPrice forKey:kReadRankListPriceDangdangPrice];
    [mutableDict setValue:self.promotionPrice forKey:kReadRankListPricePromotionPrice];
    [mutableDict setValue:self.originalPrice forKey:kReadRankListPriceOriginalPrice];
    [mutableDict setValue:self.exclusivePrice forKey:kReadRankListPriceExclusivePrice];

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

    self.dangdangPrice = [aDecoder decodeObjectForKey:kReadRankListPriceDangdangPrice];
    self.promotionPrice = [aDecoder decodeObjectForKey:kReadRankListPricePromotionPrice];
    self.originalPrice = [aDecoder decodeObjectForKey:kReadRankListPriceOriginalPrice];
    self.exclusivePrice = [aDecoder decodeObjectForKey:kReadRankListPriceExclusivePrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dangdangPrice forKey:kReadRankListPriceDangdangPrice];
    [aCoder encodeObject:_promotionPrice forKey:kReadRankListPricePromotionPrice];
    [aCoder encodeObject:_originalPrice forKey:kReadRankListPriceOriginalPrice];
    [aCoder encodeObject:_exclusivePrice forKey:kReadRankListPriceExclusivePrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadRankListPrice *copy = [[ReadRankListPrice alloc] init];
    
    if (copy) {

        copy.dangdangPrice = [self.dangdangPrice copyWithZone:zone];
        copy.promotionPrice = [self.promotionPrice copyWithZone:zone];
        copy.originalPrice = [self.originalPrice copyWithZone:zone];
        copy.exclusivePrice = [self.exclusivePrice copyWithZone:zone];
    }
    
    return copy;
}


@end
