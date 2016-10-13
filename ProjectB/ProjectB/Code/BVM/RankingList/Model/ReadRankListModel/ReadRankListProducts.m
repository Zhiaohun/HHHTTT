//
//  ReadRankListProducts.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadRankListProducts.h"
#import "ReadRankListPrice.h"


NSString *const kReadRankListProductsProductId = @"product_id";
NSString *const kReadRankListProductsAuthor = @"author";
NSString *const kReadRankListProductsScore = @"score";
NSString *const kReadRankListProductsReviewTotal = @"review_total";
NSString *const kReadRankListProductsPrice = @"price";
NSString *const kReadRankListProductsRank = @"rank";
NSString *const kReadRankListProductsPublisher = @"publisher";
NSString *const kReadRankListProductsImgUrl = @"img_url";
NSString *const kReadRankListProductsPublishDate = @"publish_date";
NSString *const kReadRankListProductsAbstract = @"abstract";
NSString *const kReadRankListProductsProductName = @"product_name";


@interface ReadRankListProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadRankListProducts

@synthesize productId = _productId;
@synthesize author = _author;
@synthesize score = _score;
@synthesize reviewTotal = _reviewTotal;
@synthesize price = _price;
@synthesize rank = _rank;
@synthesize publisher = _publisher;
@synthesize imgUrl = _imgUrl;
@synthesize publishDate = _publishDate;
@synthesize abstract = _abstract;
@synthesize productName = _productName;


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
            self.productId = [self objectOrNilForKey:kReadRankListProductsProductId fromDictionary:dict];
            self.author = [self objectOrNilForKey:kReadRankListProductsAuthor fromDictionary:dict];
            self.score = [self objectOrNilForKey:kReadRankListProductsScore fromDictionary:dict];
            self.reviewTotal = [self objectOrNilForKey:kReadRankListProductsReviewTotal fromDictionary:dict];
            self.price = [ReadRankListPrice modelObjectWithDictionary:[dict objectForKey:kReadRankListProductsPrice]];
            self.rank = [[self objectOrNilForKey:kReadRankListProductsRank fromDictionary:dict] doubleValue];
            self.publisher = [self objectOrNilForKey:kReadRankListProductsPublisher fromDictionary:dict];
            self.imgUrl = [self objectOrNilForKey:kReadRankListProductsImgUrl fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kReadRankListProductsPublishDate fromDictionary:dict];
            self.abstract = [self objectOrNilForKey:kReadRankListProductsAbstract fromDictionary:dict];
            self.productName = [self objectOrNilForKey:kReadRankListProductsProductName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.productId forKey:kReadRankListProductsProductId];
    [mutableDict setValue:self.author forKey:kReadRankListProductsAuthor];
    [mutableDict setValue:self.score forKey:kReadRankListProductsScore];
    [mutableDict setValue:self.reviewTotal forKey:kReadRankListProductsReviewTotal];
    [mutableDict setValue:[self.price dictionaryRepresentation] forKey:kReadRankListProductsPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rank] forKey:kReadRankListProductsRank];
    [mutableDict setValue:self.publisher forKey:kReadRankListProductsPublisher];
    [mutableDict setValue:self.imgUrl forKey:kReadRankListProductsImgUrl];
    [mutableDict setValue:self.publishDate forKey:kReadRankListProductsPublishDate];
    [mutableDict setValue:self.abstract forKey:kReadRankListProductsAbstract];
    [mutableDict setValue:self.productName forKey:kReadRankListProductsProductName];

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

    self.productId = [aDecoder decodeObjectForKey:kReadRankListProductsProductId];
    self.author = [aDecoder decodeObjectForKey:kReadRankListProductsAuthor];
    self.score = [aDecoder decodeObjectForKey:kReadRankListProductsScore];
    self.reviewTotal = [aDecoder decodeObjectForKey:kReadRankListProductsReviewTotal];
    self.price = [aDecoder decodeObjectForKey:kReadRankListProductsPrice];
    self.rank = [aDecoder decodeDoubleForKey:kReadRankListProductsRank];
    self.publisher = [aDecoder decodeObjectForKey:kReadRankListProductsPublisher];
    self.imgUrl = [aDecoder decodeObjectForKey:kReadRankListProductsImgUrl];
    self.publishDate = [aDecoder decodeObjectForKey:kReadRankListProductsPublishDate];
    self.abstract = [aDecoder decodeObjectForKey:kReadRankListProductsAbstract];
    self.productName = [aDecoder decodeObjectForKey:kReadRankListProductsProductName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_productId forKey:kReadRankListProductsProductId];
    [aCoder encodeObject:_author forKey:kReadRankListProductsAuthor];
    [aCoder encodeObject:_score forKey:kReadRankListProductsScore];
    [aCoder encodeObject:_reviewTotal forKey:kReadRankListProductsReviewTotal];
    [aCoder encodeObject:_price forKey:kReadRankListProductsPrice];
    [aCoder encodeDouble:_rank forKey:kReadRankListProductsRank];
    [aCoder encodeObject:_publisher forKey:kReadRankListProductsPublisher];
    [aCoder encodeObject:_imgUrl forKey:kReadRankListProductsImgUrl];
    [aCoder encodeObject:_publishDate forKey:kReadRankListProductsPublishDate];
    [aCoder encodeObject:_abstract forKey:kReadRankListProductsAbstract];
    [aCoder encodeObject:_productName forKey:kReadRankListProductsProductName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadRankListProducts *copy = [[ReadRankListProducts alloc] init];
    
    if (copy) {

        copy.productId = [self.productId copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.score = [self.score copyWithZone:zone];
        copy.reviewTotal = [self.reviewTotal copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.rank = self.rank;
        copy.publisher = [self.publisher copyWithZone:zone];
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.publishDate = [self.publishDate copyWithZone:zone];
        copy.abstract = [self.abstract copyWithZone:zone];
        copy.productName = [self.productName copyWithZone:zone];
    }
    
    return copy;
}


@end
