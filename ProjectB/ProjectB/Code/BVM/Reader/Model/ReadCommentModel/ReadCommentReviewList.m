//
//  ReadCommentReviewList.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadCommentReviewList.h"
#import "ReadCommentStars.h"


NSString *const kReadCommentReviewListCustLev = @"cust_lev";
NSString *const kReadCommentReviewListBody = @"body";
NSString *const kReadCommentReviewListExperienceIds = @"experience_ids";
NSString *const kReadCommentReviewListCustLevelSimple = @"cust_level_simple";
NSString *const kReadCommentReviewListReviewId = @"review_id";
NSString *const kReadCommentReviewListTitle = @"title";
NSString *const kReadCommentReviewListCreationDate = @"creation_date";
NSString *const kReadCommentReviewListCustId = @"cust_id";
NSString *const kReadCommentReviewListProductId = @"product_id";
NSString *const kReadCommentReviewListCustImg = @"cust_img";
NSString *const kReadCommentReviewListStars = @"stars";
NSString *const kReadCommentReviewListTotalHelpfulNum = @"total_helpful_num";
NSString *const kReadCommentReviewListCustName = @"cust_name";
NSString *const kReadCommentReviewListTotalPoints = @"total_points";
NSString *const kReadCommentReviewListPointItems = @"point_items";
NSString *const kReadCommentReviewListScore = @"score";
NSString *const kReadCommentReviewListTotalFeedbackNum = @"total_feedback_num";


@interface ReadCommentReviewList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadCommentReviewList

@synthesize custLev = _custLev;
@synthesize body = _body;
@synthesize experienceIds = _experienceIds;
@synthesize custLevelSimple = _custLevelSimple;
@synthesize reviewId = _reviewId;
@synthesize title = _title;
@synthesize creationDate = _creationDate;
@synthesize custId = _custId;
@synthesize productId = _productId;
@synthesize custImg = _custImg;
@synthesize stars = _stars;
@synthesize totalHelpfulNum = _totalHelpfulNum;
@synthesize custName = _custName;
@synthesize totalPoints = _totalPoints;
@synthesize pointItems = _pointItems;
@synthesize score = _score;
@synthesize totalFeedbackNum = _totalFeedbackNum;


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
            self.custLev = [self objectOrNilForKey:kReadCommentReviewListCustLev fromDictionary:dict];
            self.body = [self objectOrNilForKey:kReadCommentReviewListBody fromDictionary:dict];
            self.experienceIds = [self objectOrNilForKey:kReadCommentReviewListExperienceIds fromDictionary:dict];
            self.custLevelSimple = [self objectOrNilForKey:kReadCommentReviewListCustLevelSimple fromDictionary:dict];
            self.reviewId = [self objectOrNilForKey:kReadCommentReviewListReviewId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kReadCommentReviewListTitle fromDictionary:dict];
            self.creationDate = [self objectOrNilForKey:kReadCommentReviewListCreationDate fromDictionary:dict];
            self.custId = [self objectOrNilForKey:kReadCommentReviewListCustId fromDictionary:dict];
            self.productId = [self objectOrNilForKey:kReadCommentReviewListProductId fromDictionary:dict];
            self.custImg = [self objectOrNilForKey:kReadCommentReviewListCustImg fromDictionary:dict];
            self.stars = [ReadCommentStars modelObjectWithDictionary:[dict objectForKey:kReadCommentReviewListStars]];
            self.totalHelpfulNum = [self objectOrNilForKey:kReadCommentReviewListTotalHelpfulNum fromDictionary:dict];
            self.custName = [self objectOrNilForKey:kReadCommentReviewListCustName fromDictionary:dict];
            self.totalPoints = [[self objectOrNilForKey:kReadCommentReviewListTotalPoints fromDictionary:dict] doubleValue];
            self.pointItems = [self objectOrNilForKey:kReadCommentReviewListPointItems fromDictionary:dict];
            self.score = [[self objectOrNilForKey:kReadCommentReviewListScore fromDictionary:dict] doubleValue];
            self.totalFeedbackNum = [self objectOrNilForKey:kReadCommentReviewListTotalFeedbackNum fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.custLev forKey:kReadCommentReviewListCustLev];
    [mutableDict setValue:self.body forKey:kReadCommentReviewListBody];
    NSMutableArray *tempArrayForExperienceIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.experienceIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForExperienceIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForExperienceIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForExperienceIds] forKey:kReadCommentReviewListExperienceIds];
    [mutableDict setValue:self.custLevelSimple forKey:kReadCommentReviewListCustLevelSimple];
    [mutableDict setValue:self.reviewId forKey:kReadCommentReviewListReviewId];
    [mutableDict setValue:self.title forKey:kReadCommentReviewListTitle];
    [mutableDict setValue:self.creationDate forKey:kReadCommentReviewListCreationDate];
    [mutableDict setValue:self.custId forKey:kReadCommentReviewListCustId];
    [mutableDict setValue:self.productId forKey:kReadCommentReviewListProductId];
    [mutableDict setValue:self.custImg forKey:kReadCommentReviewListCustImg];
    [mutableDict setValue:[self.stars dictionaryRepresentation] forKey:kReadCommentReviewListStars];
    [mutableDict setValue:self.totalHelpfulNum forKey:kReadCommentReviewListTotalHelpfulNum];
    [mutableDict setValue:self.custName forKey:kReadCommentReviewListCustName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPoints] forKey:kReadCommentReviewListTotalPoints];
    NSMutableArray *tempArrayForPointItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pointItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPointItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPointItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPointItems] forKey:kReadCommentReviewListPointItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kReadCommentReviewListScore];
    [mutableDict setValue:self.totalFeedbackNum forKey:kReadCommentReviewListTotalFeedbackNum];

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

    self.custLev = [aDecoder decodeObjectForKey:kReadCommentReviewListCustLev];
    self.body = [aDecoder decodeObjectForKey:kReadCommentReviewListBody];
    self.experienceIds = [aDecoder decodeObjectForKey:kReadCommentReviewListExperienceIds];
    self.custLevelSimple = [aDecoder decodeObjectForKey:kReadCommentReviewListCustLevelSimple];
    self.reviewId = [aDecoder decodeObjectForKey:kReadCommentReviewListReviewId];
    self.title = [aDecoder decodeObjectForKey:kReadCommentReviewListTitle];
    self.creationDate = [aDecoder decodeObjectForKey:kReadCommentReviewListCreationDate];
    self.custId = [aDecoder decodeObjectForKey:kReadCommentReviewListCustId];
    self.productId = [aDecoder decodeObjectForKey:kReadCommentReviewListProductId];
    self.custImg = [aDecoder decodeObjectForKey:kReadCommentReviewListCustImg];
    self.stars = [aDecoder decodeObjectForKey:kReadCommentReviewListStars];
    self.totalHelpfulNum = [aDecoder decodeObjectForKey:kReadCommentReviewListTotalHelpfulNum];
    self.custName = [aDecoder decodeObjectForKey:kReadCommentReviewListCustName];
    self.totalPoints = [aDecoder decodeDoubleForKey:kReadCommentReviewListTotalPoints];
    self.pointItems = [aDecoder decodeObjectForKey:kReadCommentReviewListPointItems];
    self.score = [aDecoder decodeDoubleForKey:kReadCommentReviewListScore];
    self.totalFeedbackNum = [aDecoder decodeObjectForKey:kReadCommentReviewListTotalFeedbackNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_custLev forKey:kReadCommentReviewListCustLev];
    [aCoder encodeObject:_body forKey:kReadCommentReviewListBody];
    [aCoder encodeObject:_experienceIds forKey:kReadCommentReviewListExperienceIds];
    [aCoder encodeObject:_custLevelSimple forKey:kReadCommentReviewListCustLevelSimple];
    [aCoder encodeObject:_reviewId forKey:kReadCommentReviewListReviewId];
    [aCoder encodeObject:_title forKey:kReadCommentReviewListTitle];
    [aCoder encodeObject:_creationDate forKey:kReadCommentReviewListCreationDate];
    [aCoder encodeObject:_custId forKey:kReadCommentReviewListCustId];
    [aCoder encodeObject:_productId forKey:kReadCommentReviewListProductId];
    [aCoder encodeObject:_custImg forKey:kReadCommentReviewListCustImg];
    [aCoder encodeObject:_stars forKey:kReadCommentReviewListStars];
    [aCoder encodeObject:_totalHelpfulNum forKey:kReadCommentReviewListTotalHelpfulNum];
    [aCoder encodeObject:_custName forKey:kReadCommentReviewListCustName];
    [aCoder encodeDouble:_totalPoints forKey:kReadCommentReviewListTotalPoints];
    [aCoder encodeObject:_pointItems forKey:kReadCommentReviewListPointItems];
    [aCoder encodeDouble:_score forKey:kReadCommentReviewListScore];
    [aCoder encodeObject:_totalFeedbackNum forKey:kReadCommentReviewListTotalFeedbackNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadCommentReviewList *copy = [[ReadCommentReviewList alloc] init];
    
    if (copy) {

        copy.custLev = [self.custLev copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
        copy.experienceIds = [self.experienceIds copyWithZone:zone];
        copy.custLevelSimple = [self.custLevelSimple copyWithZone:zone];
        copy.reviewId = [self.reviewId copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.creationDate = [self.creationDate copyWithZone:zone];
        copy.custId = [self.custId copyWithZone:zone];
        copy.productId = [self.productId copyWithZone:zone];
        copy.custImg = [self.custImg copyWithZone:zone];
        copy.stars = [self.stars copyWithZone:zone];
        copy.totalHelpfulNum = [self.totalHelpfulNum copyWithZone:zone];
        copy.custName = [self.custName copyWithZone:zone];
        copy.totalPoints = self.totalPoints;
        copy.pointItems = [self.pointItems copyWithZone:zone];
        copy.score = self.score;
        copy.totalFeedbackNum = [self.totalFeedbackNum copyWithZone:zone];
    }
    
    return copy;
}


@end
