//
//  ReadCommentReviewList.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReadCommentStars;

@interface ReadCommentReviewList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *custLev;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSArray *experienceIds;
@property (nonatomic, strong) NSString *custLevelSimple;
@property (nonatomic, strong) NSString *reviewId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *creationDate;
@property (nonatomic, strong) NSString *custId;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *custImg;
@property (nonatomic, strong) ReadCommentStars *stars;
@property (nonatomic, strong) NSString *totalHelpfulNum;
@property (nonatomic, strong) NSString *custName;
@property (nonatomic, assign) double totalPoints;
@property (nonatomic, strong) NSArray *pointItems;
@property (nonatomic, assign) double score;
@property (nonatomic, strong) NSString *totalFeedbackNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
