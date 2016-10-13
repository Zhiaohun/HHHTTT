//
//  ReadHotProducts.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadHotProducts.h"
#import "ReadHotPrice.h"


NSString *const kReadHotProductsProductId = @"product_id";
NSString *const kReadHotProductsAuthor = @"author";
NSString *const kReadHotProductsScore = @"score";
NSString *const kReadHotProductsReviewTotal = @"review_total";
NSString *const kReadHotProductsPrice = @"price";
NSString *const kReadHotProductsRank = @"rank";
NSString *const kReadHotProductsPublisher = @"publisher";
NSString *const kReadHotProductsImgUrl = @"img_url";
NSString *const kReadHotProductsPublishDate = @"publish_date";
NSString *const kReadHotProductsAbstract = @"abstract";
NSString *const kReadHotProductsProductName = @"product_name";


@interface ReadHotProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadHotProducts

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
            self.productId = [self objectOrNilForKey:kReadHotProductsProductId fromDictionary:dict];
            self.author = [self objectOrNilForKey:kReadHotProductsAuthor fromDictionary:dict];
            self.score = [self objectOrNilForKey:kReadHotProductsScore fromDictionary:dict];
            self.reviewTotal = [self objectOrNilForKey:kReadHotProductsReviewTotal fromDictionary:dict];
            self.price = [ReadHotPrice modelObjectWithDictionary:[dict objectForKey:kReadHotProductsPrice]];
            self.rank = [[self objectOrNilForKey:kReadHotProductsRank fromDictionary:dict] doubleValue];
            self.publisher = [self objectOrNilForKey:kReadHotProductsPublisher fromDictionary:dict];
            self.imgUrl = [self objectOrNilForKey:kReadHotProductsImgUrl fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kReadHotProductsPublishDate fromDictionary:dict];
            self.abstract = [self objectOrNilForKey:kReadHotProductsAbstract fromDictionary:dict];
            self.productName = [self objectOrNilForKey:kReadHotProductsProductName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.productId forKey:kReadHotProductsProductId];
    [mutableDict setValue:self.author forKey:kReadHotProductsAuthor];
    [mutableDict setValue:self.score forKey:kReadHotProductsScore];
    [mutableDict setValue:self.reviewTotal forKey:kReadHotProductsReviewTotal];
    [mutableDict setValue:[self.price dictionaryRepresentation] forKey:kReadHotProductsPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rank] forKey:kReadHotProductsRank];
    [mutableDict setValue:self.publisher forKey:kReadHotProductsPublisher];
    [mutableDict setValue:self.imgUrl forKey:kReadHotProductsImgUrl];
    [mutableDict setValue:self.publishDate forKey:kReadHotProductsPublishDate];
    [mutableDict setValue:self.abstract forKey:kReadHotProductsAbstract];
    [mutableDict setValue:self.productName forKey:kReadHotProductsProductName];

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

    self.productId = [aDecoder decodeObjectForKey:kReadHotProductsProductId];
    self.author = [aDecoder decodeObjectForKey:kReadHotProductsAuthor];
    self.score = [aDecoder decodeObjectForKey:kReadHotProductsScore];
    self.reviewTotal = [aDecoder decodeObjectForKey:kReadHotProductsReviewTotal];
    self.price = [aDecoder decodeObjectForKey:kReadHotProductsPrice];
    self.rank = [aDecoder decodeDoubleForKey:kReadHotProductsRank];
    self.publisher = [aDecoder decodeObjectForKey:kReadHotProductsPublisher];
    self.imgUrl = [aDecoder decodeObjectForKey:kReadHotProductsImgUrl];
    self.publishDate = [aDecoder decodeObjectForKey:kReadHotProductsPublishDate];
    self.abstract = [aDecoder decodeObjectForKey:kReadHotProductsAbstract];
    self.productName = [aDecoder decodeObjectForKey:kReadHotProductsProductName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_productId forKey:kReadHotProductsProductId];
    [aCoder encodeObject:_author forKey:kReadHotProductsAuthor];
    [aCoder encodeObject:_score forKey:kReadHotProductsScore];
    [aCoder encodeObject:_reviewTotal forKey:kReadHotProductsReviewTotal];
    [aCoder encodeObject:_price forKey:kReadHotProductsPrice];
    [aCoder encodeDouble:_rank forKey:kReadHotProductsRank];
    [aCoder encodeObject:_publisher forKey:kReadHotProductsPublisher];
    [aCoder encodeObject:_imgUrl forKey:kReadHotProductsImgUrl];
    [aCoder encodeObject:_publishDate forKey:kReadHotProductsPublishDate];
    [aCoder encodeObject:_abstract forKey:kReadHotProductsAbstract];
    [aCoder encodeObject:_productName forKey:kReadHotProductsProductName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadHotProducts *copy = [[ReadHotProducts alloc] init];
    
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
