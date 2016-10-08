//
//  ReadMotivationBaseClass.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReadMotivationPage, ReadMotivationCurrentCat;

@interface ReadMotivationBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *screening;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, assign) BOOL isFilter;
@property (nonatomic, strong) NSArray *sortType;
@property (nonatomic, strong) ReadMotivationPage *page;
@property (nonatomic, assign) double waterfall;
@property (nonatomic, strong) NSString *webtemplate;
@property (nonatomic, strong) NSString *clientVersion;
@property (nonatomic, strong) ReadMotivationCurrentCat *currentCat;
@property (nonatomic, strong) NSArray *banner;
@property (nonatomic, strong) NSString *clientPlatform;
@property (nonatomic, strong) NSArray *parrentCat;
@property (nonatomic, strong) NSString *showQuickfilter;
@property (nonatomic, strong) NSArray *cmsProducts;
@property (nonatomic, strong) NSString *showcase;
@property (nonatomic, strong) NSArray *promotions;
@property (nonatomic, strong) NSArray *products;
@property (nonatomic, assign) id brands;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
