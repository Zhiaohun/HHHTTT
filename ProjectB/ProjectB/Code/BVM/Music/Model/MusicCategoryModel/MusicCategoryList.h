//
//  MusicCategoryList.h
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MusicCategoryList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *displayDiscountedPrice;
@property (nonatomic, assign) double serialState;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *displayPrice;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) double score;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double tracks;
@property (nonatomic, strong) NSString *trackTitle;
@property (nonatomic, assign) double priceTypeId;
@property (nonatomic, assign) double isFinished;
@property (nonatomic, assign) double trackId;
@property (nonatomic, assign) double discountedPrice;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *albumCoverUrl290;
@property (nonatomic, assign) double priceTypeEnum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
