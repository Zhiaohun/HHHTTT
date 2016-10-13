//
//  ReadHotPrice.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadHotPrice.h"


NSString *const kReadHotPriceDangdangPrice = @"dangdang_price";
NSString *const kReadHotPricePromotionPrice = @"promotion_price";
NSString *const kReadHotPriceOriginalPrice = @"original_price";
NSString *const kReadHotPriceExclusivePrice = @"exclusive_price";


@interface ReadHotPrice ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadHotPrice

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
            self.dangdangPrice = [self objectOrNilForKey:kReadHotPriceDangdangPrice fromDictionary:dict];
            self.promotionPrice = [self objectOrNilForKey:kReadHotPricePromotionPrice fromDictionary:dict];
            self.originalPrice = [self objectOrNilForKey:kReadHotPriceOriginalPrice fromDictionary:dict];
            self.exclusivePrice = [self objectOrNilForKey:kReadHotPriceExclusivePrice fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dangdangPrice forKey:kReadHotPriceDangdangPrice];
    [mutableDict setValue:self.promotionPrice forKey:kReadHotPricePromotionPrice];
    [mutableDict setValue:self.originalPrice forKey:kReadHotPriceOriginalPrice];
    [mutableDict setValue:self.exclusivePrice forKey:kReadHotPriceExclusivePrice];

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

    self.dangdangPrice = [aDecoder decodeObjectForKey:kReadHotPriceDangdangPrice];
    self.promotionPrice = [aDecoder decodeObjectForKey:kReadHotPricePromotionPrice];
    self.originalPrice = [aDecoder decodeObjectForKey:kReadHotPriceOriginalPrice];
    self.exclusivePrice = [aDecoder decodeObjectForKey:kReadHotPriceExclusivePrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dangdangPrice forKey:kReadHotPriceDangdangPrice];
    [aCoder encodeObject:_promotionPrice forKey:kReadHotPricePromotionPrice];
    [aCoder encodeObject:_originalPrice forKey:kReadHotPriceOriginalPrice];
    [aCoder encodeObject:_exclusivePrice forKey:kReadHotPriceExclusivePrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadHotPrice *copy = [[ReadHotPrice alloc] init];
    
    if (copy) {

        copy.dangdangPrice = [self.dangdangPrice copyWithZone:zone];
        copy.promotionPrice = [self.promotionPrice copyWithZone:zone];
        copy.originalPrice = [self.originalPrice copyWithZone:zone];
        copy.exclusivePrice = [self.exclusivePrice copyWithZone:zone];
    }
    
    return copy;
}


@end
