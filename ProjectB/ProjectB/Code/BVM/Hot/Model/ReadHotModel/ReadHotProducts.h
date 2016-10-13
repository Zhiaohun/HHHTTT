//
//  ReadHotProducts.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReadHotPrice;

@interface ReadHotProducts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *reviewTotal;
@property (nonatomic, strong) ReadHotPrice *price;
@property (nonatomic, assign) double rank;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *publishDate;
@property (nonatomic, strong) NSString *abstract;
@property (nonatomic, strong) NSString *productName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
