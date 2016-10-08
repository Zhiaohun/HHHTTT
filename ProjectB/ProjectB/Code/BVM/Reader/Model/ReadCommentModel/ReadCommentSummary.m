//
//  ReadCommentSummary.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadCommentSummary.h"


NSString *const kReadCommentSummaryTotalDetestCount = @"total_detest_count";
NSString *const kReadCommentSummaryTotalAutoCount = @"total_auto_count";
NSString *const kReadCommentSummaryTotalScoreCount = @"total_score_count";
NSString *const kReadCommentSummaryTotalIndifferentCount = @"total_indifferent_count";
NSString *const kReadCommentSummaryProductId = @"product_id";
NSString *const kReadCommentSummaryTotalCrazyCount = @"total_crazy_count";


@interface ReadCommentSummary ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadCommentSummary

@synthesize totalDetestCount = _totalDetestCount;
@synthesize totalAutoCount = _totalAutoCount;
@synthesize totalScoreCount = _totalScoreCount;
@synthesize totalIndifferentCount = _totalIndifferentCount;
@synthesize productId = _productId;
@synthesize totalCrazyCount = _totalCrazyCount;


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
            self.totalDetestCount = [self objectOrNilForKey:kReadCommentSummaryTotalDetestCount fromDictionary:dict];
            self.totalAutoCount = [self objectOrNilForKey:kReadCommentSummaryTotalAutoCount fromDictionary:dict];
            self.totalScoreCount = [self objectOrNilForKey:kReadCommentSummaryTotalScoreCount fromDictionary:dict];
            self.totalIndifferentCount = [self objectOrNilForKey:kReadCommentSummaryTotalIndifferentCount fromDictionary:dict];
            self.productId = [self objectOrNilForKey:kReadCommentSummaryProductId fromDictionary:dict];
            self.totalCrazyCount = [self objectOrNilForKey:kReadCommentSummaryTotalCrazyCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.totalDetestCount forKey:kReadCommentSummaryTotalDetestCount];
    [mutableDict setValue:self.totalAutoCount forKey:kReadCommentSummaryTotalAutoCount];
    [mutableDict setValue:self.totalScoreCount forKey:kReadCommentSummaryTotalScoreCount];
    [mutableDict setValue:self.totalIndifferentCount forKey:kReadCommentSummaryTotalIndifferentCount];
    [mutableDict setValue:self.productId forKey:kReadCommentSummaryProductId];
    [mutableDict setValue:self.totalCrazyCount forKey:kReadCommentSummaryTotalCrazyCount];

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

    self.totalDetestCount = [aDecoder decodeObjectForKey:kReadCommentSummaryTotalDetestCount];
    self.totalAutoCount = [aDecoder decodeObjectForKey:kReadCommentSummaryTotalAutoCount];
    self.totalScoreCount = [aDecoder decodeObjectForKey:kReadCommentSummaryTotalScoreCount];
    self.totalIndifferentCount = [aDecoder decodeObjectForKey:kReadCommentSummaryTotalIndifferentCount];
    self.productId = [aDecoder decodeObjectForKey:kReadCommentSummaryProductId];
    self.totalCrazyCount = [aDecoder decodeObjectForKey:kReadCommentSummaryTotalCrazyCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_totalDetestCount forKey:kReadCommentSummaryTotalDetestCount];
    [aCoder encodeObject:_totalAutoCount forKey:kReadCommentSummaryTotalAutoCount];
    [aCoder encodeObject:_totalScoreCount forKey:kReadCommentSummaryTotalScoreCount];
    [aCoder encodeObject:_totalIndifferentCount forKey:kReadCommentSummaryTotalIndifferentCount];
    [aCoder encodeObject:_productId forKey:kReadCommentSummaryProductId];
    [aCoder encodeObject:_totalCrazyCount forKey:kReadCommentSummaryTotalCrazyCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadCommentSummary *copy = [[ReadCommentSummary alloc] init];
    
    if (copy) {

        copy.totalDetestCount = [self.totalDetestCount copyWithZone:zone];
        copy.totalAutoCount = [self.totalAutoCount copyWithZone:zone];
        copy.totalScoreCount = [self.totalScoreCount copyWithZone:zone];
        copy.totalIndifferentCount = [self.totalIndifferentCount copyWithZone:zone];
        copy.productId = [self.productId copyWithZone:zone];
        copy.totalCrazyCount = [self.totalCrazyCount copyWithZone:zone];
    }
    
    return copy;
}


@end
