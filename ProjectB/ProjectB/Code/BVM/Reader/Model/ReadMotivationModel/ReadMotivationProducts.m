//
//  ReadMotivationProducts.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadMotivationProducts.h"
#import "ReadMotivationStars.h"


NSString *const kReadMotivationProductsSubname = @"subname";
NSString *const kReadMotivationProductsShowDangdangsale = @"show_dangdangsale";
NSString *const kReadMotivationProductsPromotionFilt = @"promotion_filt";
NSString *const kReadMotivationProductsExclusivePrice = @"exclusive_price";
NSString *const kReadMotivationProductsId = @"id";
NSString *const kReadMotivationProductsHasEbook = @"has_ebook";
NSString *const kReadMotivationProductsEbookPrice = @"ebook_price";
NSString *const kReadMotivationProductsAuthorname = @"authorname";
NSString *const kReadMotivationProductsShowEbookFlag = @"show_ebook_flag";
NSString *const kReadMotivationProductsPromotype = @"promotype";
NSString *const kReadMotivationProductsDdSalePrice = @"dd_sale_price";
NSString *const kReadMotivationProductsOriginalPrice = @"original_price";
NSString *const kReadMotivationProductsExclusiveSparePrice = @"exclusive_spare_price";
NSString *const kReadMotivationProductsImageUrl = @"image_url";
NSString *const kReadMotivationProductsScore = @"score";
NSString *const kReadMotivationProductsEbookProductId = @"ebook_product_id";
NSString *const kReadMotivationProductsActivityType = @"activity_type";
NSString *const kReadMotivationProductsShopId = @"shop_id";
NSString *const kReadMotivationProductsEbookDdPrice = @"ebook_dd_price";
NSString *const kReadMotivationProductsPromoSalePrice = @"promo_sale_price";
NSString *const kReadMotivationProductsWordHighlightKeys = @"word_highlight_keys";
NSString *const kReadMotivationProductsName = @"name";
NSString *const kReadMotivationProductsReadable = @"readable";
NSString *const kReadMotivationProductsRealDdSalePrice = @"real_dd_sale_price";
NSString *const kReadMotivationProductsIsHasEbook = @"is_has_ebook";
NSString *const kReadMotivationProductsDiscountIconTitle = @"discount_icon_title";
NSString *const kReadMotivationProductsCatPaths = @"cat_paths";
NSString *const kReadMotivationProductsProductUrl = @"product_url";
NSString *const kReadMotivationProductsIsYbProduct = @"is_yb_product";
NSString *const kReadMotivationProductsPrice = @"price";
NSString *const kReadMotivationProductsPublishDate = @"publish_date";
NSString *const kReadMotivationProductsIsOverseas = @"is_overseas";
NSString *const kReadMotivationProductsIsEbook = @"is_ebook";
NSString *const kReadMotivationProductsStars = @"stars";
NSString *const kReadMotivationProductsPublisher = @"publisher";
NSString *const kReadMotivationProductsActivityPrice = @"activity_price";
NSString *const kReadMotivationProductsHighCommonRate = @"high_common_rate";
NSString *const kReadMotivationProductsTotalReviewCount = @"total_review_count";
NSString *const kReadMotivationProductsIsWished = @"is_wished";
NSString *const kReadMotivationProductsStock = @"stock";
NSString *const kReadMotivationProductsIsPublication = @"is_publication";


@interface ReadMotivationProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadMotivationProducts

@synthesize subname = _subname;
@synthesize showDangdangsale = _showDangdangsale;
@synthesize promotionFilt = _promotionFilt;
@synthesize exclusivePrice = _exclusivePrice;
@synthesize productsIdentifier = _productsIdentifier;
@synthesize hasEbook = _hasEbook;
@synthesize ebookPrice = _ebookPrice;
@synthesize authorname = _authorname;
@synthesize showEbookFlag = _showEbookFlag;
@synthesize promotype = _promotype;
@synthesize ddSalePrice = _ddSalePrice;
@synthesize originalPrice = _originalPrice;
@synthesize exclusiveSparePrice = _exclusiveSparePrice;
@synthesize imageUrl = _imageUrl;
@synthesize score = _score;
@synthesize ebookProductId = _ebookProductId;
@synthesize activityType = _activityType;
@synthesize shopId = _shopId;
@synthesize ebookDdPrice = _ebookDdPrice;
@synthesize promoSalePrice = _promoSalePrice;
@synthesize wordHighlightKeys = _wordHighlightKeys;
@synthesize name = _name;
@synthesize readable = _readable;
@synthesize realDdSalePrice = _realDdSalePrice;
@synthesize isHasEbook = _isHasEbook;
@synthesize discountIconTitle = _discountIconTitle;
@synthesize catPaths = _catPaths;
@synthesize productUrl = _productUrl;
@synthesize isYbProduct = _isYbProduct;
@synthesize price = _price;
@synthesize publishDate = _publishDate;
@synthesize isOverseas = _isOverseas;
@synthesize isEbook = _isEbook;
@synthesize stars = _stars;
@synthesize publisher = _publisher;
@synthesize activityPrice = _activityPrice;
@synthesize highCommonRate = _highCommonRate;
@synthesize totalReviewCount = _totalReviewCount;
@synthesize isWished = _isWished;
@synthesize stock = _stock;
@synthesize isPublication = _isPublication;


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
            self.subname = [self objectOrNilForKey:kReadMotivationProductsSubname fromDictionary:dict];
            self.showDangdangsale = [[self objectOrNilForKey:kReadMotivationProductsShowDangdangsale fromDictionary:dict] doubleValue];
            self.promotionFilt = [self objectOrNilForKey:kReadMotivationProductsPromotionFilt fromDictionary:dict];
            self.exclusivePrice = [self objectOrNilForKey:kReadMotivationProductsExclusivePrice fromDictionary:dict];
            self.productsIdentifier = [self objectOrNilForKey:kReadMotivationProductsId fromDictionary:dict];
            self.hasEbook = [[self objectOrNilForKey:kReadMotivationProductsHasEbook fromDictionary:dict] doubleValue];
            self.ebookPrice = [self objectOrNilForKey:kReadMotivationProductsEbookPrice fromDictionary:dict];
            self.authorname = [self objectOrNilForKey:kReadMotivationProductsAuthorname fromDictionary:dict];
            self.showEbookFlag = [self objectOrNilForKey:kReadMotivationProductsShowEbookFlag fromDictionary:dict];
            self.promotype = [self objectOrNilForKey:kReadMotivationProductsPromotype fromDictionary:dict];
            self.ddSalePrice = [self objectOrNilForKey:kReadMotivationProductsDdSalePrice fromDictionary:dict];
            self.originalPrice = [self objectOrNilForKey:kReadMotivationProductsOriginalPrice fromDictionary:dict];
            self.exclusiveSparePrice = [self objectOrNilForKey:kReadMotivationProductsExclusiveSparePrice fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kReadMotivationProductsImageUrl fromDictionary:dict];
            self.score = [[self objectOrNilForKey:kReadMotivationProductsScore fromDictionary:dict] doubleValue];
            self.ebookProductId = [self objectOrNilForKey:kReadMotivationProductsEbookProductId fromDictionary:dict];
            self.activityType = [[self objectOrNilForKey:kReadMotivationProductsActivityType fromDictionary:dict] doubleValue];
            self.shopId = [self objectOrNilForKey:kReadMotivationProductsShopId fromDictionary:dict];
            self.ebookDdPrice = [self objectOrNilForKey:kReadMotivationProductsEbookDdPrice fromDictionary:dict];
            self.promoSalePrice = [self objectOrNilForKey:kReadMotivationProductsPromoSalePrice fromDictionary:dict];
            self.wordHighlightKeys = [self objectOrNilForKey:kReadMotivationProductsWordHighlightKeys fromDictionary:dict];
            self.name = [self objectOrNilForKey:kReadMotivationProductsName fromDictionary:dict];
            self.readable = [[self objectOrNilForKey:kReadMotivationProductsReadable fromDictionary:dict] boolValue];
            self.realDdSalePrice = [self objectOrNilForKey:kReadMotivationProductsRealDdSalePrice fromDictionary:dict];
            self.isHasEbook = [self objectOrNilForKey:kReadMotivationProductsIsHasEbook fromDictionary:dict];
            self.discountIconTitle = [self objectOrNilForKey:kReadMotivationProductsDiscountIconTitle fromDictionary:dict];
            self.catPaths = [self objectOrNilForKey:kReadMotivationProductsCatPaths fromDictionary:dict];
            self.productUrl = [self objectOrNilForKey:kReadMotivationProductsProductUrl fromDictionary:dict];
            self.isYbProduct = [[self objectOrNilForKey:kReadMotivationProductsIsYbProduct fromDictionary:dict] boolValue];
            self.price = [self objectOrNilForKey:kReadMotivationProductsPrice fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kReadMotivationProductsPublishDate fromDictionary:dict];
            self.isOverseas = [self objectOrNilForKey:kReadMotivationProductsIsOverseas fromDictionary:dict];
            self.isEbook = [[self objectOrNilForKey:kReadMotivationProductsIsEbook fromDictionary:dict] doubleValue];
            self.stars = [ReadMotivationStars modelObjectWithDictionary:[dict objectForKey:kReadMotivationProductsStars]];
            self.publisher = [self objectOrNilForKey:kReadMotivationProductsPublisher fromDictionary:dict];
            self.activityPrice = [self objectOrNilForKey:kReadMotivationProductsActivityPrice fromDictionary:dict];
            self.highCommonRate = [self objectOrNilForKey:kReadMotivationProductsHighCommonRate fromDictionary:dict];
            self.totalReviewCount = [self objectOrNilForKey:kReadMotivationProductsTotalReviewCount fromDictionary:dict];
            self.isWished = [self objectOrNilForKey:kReadMotivationProductsIsWished fromDictionary:dict];
            self.stock = [self objectOrNilForKey:kReadMotivationProductsStock fromDictionary:dict];
            self.isPublication = [self objectOrNilForKey:kReadMotivationProductsIsPublication fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subname forKey:kReadMotivationProductsSubname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showDangdangsale] forKey:kReadMotivationProductsShowDangdangsale];
    [mutableDict setValue:self.promotionFilt forKey:kReadMotivationProductsPromotionFilt];
    [mutableDict setValue:self.exclusivePrice forKey:kReadMotivationProductsExclusivePrice];
    [mutableDict setValue:self.productsIdentifier forKey:kReadMotivationProductsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasEbook] forKey:kReadMotivationProductsHasEbook];
    [mutableDict setValue:self.ebookPrice forKey:kReadMotivationProductsEbookPrice];
    [mutableDict setValue:self.authorname forKey:kReadMotivationProductsAuthorname];
    [mutableDict setValue:self.showEbookFlag forKey:kReadMotivationProductsShowEbookFlag];
    [mutableDict setValue:self.promotype forKey:kReadMotivationProductsPromotype];
    [mutableDict setValue:self.ddSalePrice forKey:kReadMotivationProductsDdSalePrice];
    [mutableDict setValue:self.originalPrice forKey:kReadMotivationProductsOriginalPrice];
    [mutableDict setValue:self.exclusiveSparePrice forKey:kReadMotivationProductsExclusiveSparePrice];
    [mutableDict setValue:self.imageUrl forKey:kReadMotivationProductsImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kReadMotivationProductsScore];
    [mutableDict setValue:self.ebookProductId forKey:kReadMotivationProductsEbookProductId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityType] forKey:kReadMotivationProductsActivityType];
    [mutableDict setValue:self.shopId forKey:kReadMotivationProductsShopId];
    [mutableDict setValue:self.ebookDdPrice forKey:kReadMotivationProductsEbookDdPrice];
    [mutableDict setValue:self.promoSalePrice forKey:kReadMotivationProductsPromoSalePrice];
    NSMutableArray *tempArrayForWordHighlightKeys = [NSMutableArray array];
    for (NSObject *subArrayObject in self.wordHighlightKeys) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWordHighlightKeys addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWordHighlightKeys addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWordHighlightKeys] forKey:kReadMotivationProductsWordHighlightKeys];
    [mutableDict setValue:self.name forKey:kReadMotivationProductsName];
    [mutableDict setValue:[NSNumber numberWithBool:self.readable] forKey:kReadMotivationProductsReadable];
    [mutableDict setValue:self.realDdSalePrice forKey:kReadMotivationProductsRealDdSalePrice];
    [mutableDict setValue:self.isHasEbook forKey:kReadMotivationProductsIsHasEbook];
    [mutableDict setValue:self.discountIconTitle forKey:kReadMotivationProductsDiscountIconTitle];
    [mutableDict setValue:self.catPaths forKey:kReadMotivationProductsCatPaths];
    [mutableDict setValue:self.productUrl forKey:kReadMotivationProductsProductUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.isYbProduct] forKey:kReadMotivationProductsIsYbProduct];
    [mutableDict setValue:self.price forKey:kReadMotivationProductsPrice];
    [mutableDict setValue:self.publishDate forKey:kReadMotivationProductsPublishDate];
    [mutableDict setValue:self.isOverseas forKey:kReadMotivationProductsIsOverseas];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isEbook] forKey:kReadMotivationProductsIsEbook];
    [mutableDict setValue:[self.stars dictionaryRepresentation] forKey:kReadMotivationProductsStars];
    [mutableDict setValue:self.publisher forKey:kReadMotivationProductsPublisher];
    [mutableDict setValue:self.activityPrice forKey:kReadMotivationProductsActivityPrice];
    [mutableDict setValue:self.highCommonRate forKey:kReadMotivationProductsHighCommonRate];
    [mutableDict setValue:self.totalReviewCount forKey:kReadMotivationProductsTotalReviewCount];
    [mutableDict setValue:self.isWished forKey:kReadMotivationProductsIsWished];
    [mutableDict setValue:self.stock forKey:kReadMotivationProductsStock];
    [mutableDict setValue:self.isPublication forKey:kReadMotivationProductsIsPublication];

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

    self.subname = [aDecoder decodeObjectForKey:kReadMotivationProductsSubname];
    self.showDangdangsale = [aDecoder decodeDoubleForKey:kReadMotivationProductsShowDangdangsale];
    self.promotionFilt = [aDecoder decodeObjectForKey:kReadMotivationProductsPromotionFilt];
    self.exclusivePrice = [aDecoder decodeObjectForKey:kReadMotivationProductsExclusivePrice];
    self.productsIdentifier = [aDecoder decodeObjectForKey:kReadMotivationProductsId];
    self.hasEbook = [aDecoder decodeDoubleForKey:kReadMotivationProductsHasEbook];
    self.ebookPrice = [aDecoder decodeObjectForKey:kReadMotivationProductsEbookPrice];
    self.authorname = [aDecoder decodeObjectForKey:kReadMotivationProductsAuthorname];
    self.showEbookFlag = [aDecoder decodeObjectForKey:kReadMotivationProductsShowEbookFlag];
    self.promotype = [aDecoder decodeObjectForKey:kReadMotivationProductsPromotype];
    self.ddSalePrice = [aDecoder decodeObjectForKey:kReadMotivationProductsDdSalePrice];
    self.originalPrice = [aDecoder decodeObjectForKey:kReadMotivationProductsOriginalPrice];
    self.exclusiveSparePrice = [aDecoder decodeObjectForKey:kReadMotivationProductsExclusiveSparePrice];
    self.imageUrl = [aDecoder decodeObjectForKey:kReadMotivationProductsImageUrl];
    self.score = [aDecoder decodeDoubleForKey:kReadMotivationProductsScore];
    self.ebookProductId = [aDecoder decodeObjectForKey:kReadMotivationProductsEbookProductId];
    self.activityType = [aDecoder decodeDoubleForKey:kReadMotivationProductsActivityType];
    self.shopId = [aDecoder decodeObjectForKey:kReadMotivationProductsShopId];
    self.ebookDdPrice = [aDecoder decodeObjectForKey:kReadMotivationProductsEbookDdPrice];
    self.promoSalePrice = [aDecoder decodeObjectForKey:kReadMotivationProductsPromoSalePrice];
    self.wordHighlightKeys = [aDecoder decodeObjectForKey:kReadMotivationProductsWordHighlightKeys];
    self.name = [aDecoder decodeObjectForKey:kReadMotivationProductsName];
    self.readable = [aDecoder decodeBoolForKey:kReadMotivationProductsReadable];
    self.realDdSalePrice = [aDecoder decodeObjectForKey:kReadMotivationProductsRealDdSalePrice];
    self.isHasEbook = [aDecoder decodeObjectForKey:kReadMotivationProductsIsHasEbook];
    self.discountIconTitle = [aDecoder decodeObjectForKey:kReadMotivationProductsDiscountIconTitle];
    self.catPaths = [aDecoder decodeObjectForKey:kReadMotivationProductsCatPaths];
    self.productUrl = [aDecoder decodeObjectForKey:kReadMotivationProductsProductUrl];
    self.isYbProduct = [aDecoder decodeBoolForKey:kReadMotivationProductsIsYbProduct];
    self.price = [aDecoder decodeObjectForKey:kReadMotivationProductsPrice];
    self.publishDate = [aDecoder decodeObjectForKey:kReadMotivationProductsPublishDate];
    self.isOverseas = [aDecoder decodeObjectForKey:kReadMotivationProductsIsOverseas];
    self.isEbook = [aDecoder decodeDoubleForKey:kReadMotivationProductsIsEbook];
    self.stars = [aDecoder decodeObjectForKey:kReadMotivationProductsStars];
    self.publisher = [aDecoder decodeObjectForKey:kReadMotivationProductsPublisher];
    self.activityPrice = [aDecoder decodeObjectForKey:kReadMotivationProductsActivityPrice];
    self.highCommonRate = [aDecoder decodeObjectForKey:kReadMotivationProductsHighCommonRate];
    self.totalReviewCount = [aDecoder decodeObjectForKey:kReadMotivationProductsTotalReviewCount];
    self.isWished = [aDecoder decodeObjectForKey:kReadMotivationProductsIsWished];
    self.stock = [aDecoder decodeObjectForKey:kReadMotivationProductsStock];
    self.isPublication = [aDecoder decodeObjectForKey:kReadMotivationProductsIsPublication];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subname forKey:kReadMotivationProductsSubname];
    [aCoder encodeDouble:_showDangdangsale forKey:kReadMotivationProductsShowDangdangsale];
    [aCoder encodeObject:_promotionFilt forKey:kReadMotivationProductsPromotionFilt];
    [aCoder encodeObject:_exclusivePrice forKey:kReadMotivationProductsExclusivePrice];
    [aCoder encodeObject:_productsIdentifier forKey:kReadMotivationProductsId];
    [aCoder encodeDouble:_hasEbook forKey:kReadMotivationProductsHasEbook];
    [aCoder encodeObject:_ebookPrice forKey:kReadMotivationProductsEbookPrice];
    [aCoder encodeObject:_authorname forKey:kReadMotivationProductsAuthorname];
    [aCoder encodeObject:_showEbookFlag forKey:kReadMotivationProductsShowEbookFlag];
    [aCoder encodeObject:_promotype forKey:kReadMotivationProductsPromotype];
    [aCoder encodeObject:_ddSalePrice forKey:kReadMotivationProductsDdSalePrice];
    [aCoder encodeObject:_originalPrice forKey:kReadMotivationProductsOriginalPrice];
    [aCoder encodeObject:_exclusiveSparePrice forKey:kReadMotivationProductsExclusiveSparePrice];
    [aCoder encodeObject:_imageUrl forKey:kReadMotivationProductsImageUrl];
    [aCoder encodeDouble:_score forKey:kReadMotivationProductsScore];
    [aCoder encodeObject:_ebookProductId forKey:kReadMotivationProductsEbookProductId];
    [aCoder encodeDouble:_activityType forKey:kReadMotivationProductsActivityType];
    [aCoder encodeObject:_shopId forKey:kReadMotivationProductsShopId];
    [aCoder encodeObject:_ebookDdPrice forKey:kReadMotivationProductsEbookDdPrice];
    [aCoder encodeObject:_promoSalePrice forKey:kReadMotivationProductsPromoSalePrice];
    [aCoder encodeObject:_wordHighlightKeys forKey:kReadMotivationProductsWordHighlightKeys];
    [aCoder encodeObject:_name forKey:kReadMotivationProductsName];
    [aCoder encodeBool:_readable forKey:kReadMotivationProductsReadable];
    [aCoder encodeObject:_realDdSalePrice forKey:kReadMotivationProductsRealDdSalePrice];
    [aCoder encodeObject:_isHasEbook forKey:kReadMotivationProductsIsHasEbook];
    [aCoder encodeObject:_discountIconTitle forKey:kReadMotivationProductsDiscountIconTitle];
    [aCoder encodeObject:_catPaths forKey:kReadMotivationProductsCatPaths];
    [aCoder encodeObject:_productUrl forKey:kReadMotivationProductsProductUrl];
    [aCoder encodeBool:_isYbProduct forKey:kReadMotivationProductsIsYbProduct];
    [aCoder encodeObject:_price forKey:kReadMotivationProductsPrice];
    [aCoder encodeObject:_publishDate forKey:kReadMotivationProductsPublishDate];
    [aCoder encodeObject:_isOverseas forKey:kReadMotivationProductsIsOverseas];
    [aCoder encodeDouble:_isEbook forKey:kReadMotivationProductsIsEbook];
    [aCoder encodeObject:_stars forKey:kReadMotivationProductsStars];
    [aCoder encodeObject:_publisher forKey:kReadMotivationProductsPublisher];
    [aCoder encodeObject:_activityPrice forKey:kReadMotivationProductsActivityPrice];
    [aCoder encodeObject:_highCommonRate forKey:kReadMotivationProductsHighCommonRate];
    [aCoder encodeObject:_totalReviewCount forKey:kReadMotivationProductsTotalReviewCount];
    [aCoder encodeObject:_isWished forKey:kReadMotivationProductsIsWished];
    [aCoder encodeObject:_stock forKey:kReadMotivationProductsStock];
    [aCoder encodeObject:_isPublication forKey:kReadMotivationProductsIsPublication];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadMotivationProducts *copy = [[ReadMotivationProducts alloc] init];
    
    if (copy) {

        copy.subname = [self.subname copyWithZone:zone];
        copy.showDangdangsale = self.showDangdangsale;
        copy.promotionFilt = [self.promotionFilt copyWithZone:zone];
        copy.exclusivePrice = [self.exclusivePrice copyWithZone:zone];
        copy.productsIdentifier = [self.productsIdentifier copyWithZone:zone];
        copy.hasEbook = self.hasEbook;
        copy.ebookPrice = [self.ebookPrice copyWithZone:zone];
        copy.authorname = [self.authorname copyWithZone:zone];
        copy.showEbookFlag = [self.showEbookFlag copyWithZone:zone];
        copy.promotype = [self.promotype copyWithZone:zone];
        copy.ddSalePrice = [self.ddSalePrice copyWithZone:zone];
        copy.originalPrice = [self.originalPrice copyWithZone:zone];
        copy.exclusiveSparePrice = [self.exclusiveSparePrice copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.score = self.score;
        copy.ebookProductId = [self.ebookProductId copyWithZone:zone];
        copy.activityType = self.activityType;
        copy.shopId = [self.shopId copyWithZone:zone];
        copy.ebookDdPrice = [self.ebookDdPrice copyWithZone:zone];
        copy.promoSalePrice = [self.promoSalePrice copyWithZone:zone];
        copy.wordHighlightKeys = [self.wordHighlightKeys copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.readable = self.readable;
        copy.realDdSalePrice = [self.realDdSalePrice copyWithZone:zone];
        copy.isHasEbook = [self.isHasEbook copyWithZone:zone];
        copy.discountIconTitle = [self.discountIconTitle copyWithZone:zone];
        copy.catPaths = [self.catPaths copyWithZone:zone];
        copy.productUrl = [self.productUrl copyWithZone:zone];
        copy.isYbProduct = self.isYbProduct;
        copy.price = [self.price copyWithZone:zone];
        copy.publishDate = [self.publishDate copyWithZone:zone];
        copy.isOverseas = [self.isOverseas copyWithZone:zone];
        copy.isEbook = self.isEbook;
        copy.stars = [self.stars copyWithZone:zone];
        copy.publisher = [self.publisher copyWithZone:zone];
        copy.activityPrice = [self.activityPrice copyWithZone:zone];
        copy.highCommonRate = [self.highCommonRate copyWithZone:zone];
        copy.totalReviewCount = [self.totalReviewCount copyWithZone:zone];
        copy.isWished = [self.isWished copyWithZone:zone];
        copy.stock = [self.stock copyWithZone:zone];
        copy.isPublication = [self.isPublication copyWithZone:zone];
    }
    
    return copy;
}


@end
