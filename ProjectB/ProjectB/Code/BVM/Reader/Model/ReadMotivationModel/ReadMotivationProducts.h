//
//  ReadMotivationProducts.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReadMotivationStars;

@interface ReadMotivationProducts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *subname;
@property (nonatomic, assign) double showDangdangsale;
@property (nonatomic, strong) NSString *promotionFilt;
@property (nonatomic, strong) NSString *exclusivePrice;
@property (nonatomic, strong) NSString *productsIdentifier;
@property (nonatomic, assign) double hasEbook;
@property (nonatomic, strong) NSString *ebookPrice;
@property (nonatomic, strong) NSString *authorname;
@property (nonatomic, strong) NSString *showEbookFlag;
@property (nonatomic, strong) NSString *promotype;
@property (nonatomic, strong) NSString *ddSalePrice;
@property (nonatomic, strong) NSString *originalPrice;
@property (nonatomic, strong) NSString *exclusiveSparePrice;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) double score;
@property (nonatomic, strong) NSString *ebookProductId;
@property (nonatomic, assign) double activityType;
@property (nonatomic, strong) NSString *shopId;
@property (nonatomic, strong) NSString *ebookDdPrice;
@property (nonatomic, strong) NSString *promoSalePrice;
@property (nonatomic, strong) NSArray *wordHighlightKeys;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL readable;
@property (nonatomic, strong) NSString *realDdSalePrice;
@property (nonatomic, strong) NSString *isHasEbook;
@property (nonatomic, strong) NSString *discountIconTitle;
@property (nonatomic, strong) NSString *catPaths;
@property (nonatomic, strong) NSString *productUrl;
@property (nonatomic, assign) BOOL isYbProduct;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *publishDate;
@property (nonatomic, strong) NSString *isOverseas;
@property (nonatomic, assign) double isEbook;
@property (nonatomic, strong) ReadMotivationStars *stars;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *activityPrice;
@property (nonatomic, strong) NSString *highCommonRate;
@property (nonatomic, strong) NSString *totalReviewCount;
@property (nonatomic, strong) NSString *isWished;
@property (nonatomic, strong) NSString *stock;
@property (nonatomic, strong) NSString *isPublication;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
