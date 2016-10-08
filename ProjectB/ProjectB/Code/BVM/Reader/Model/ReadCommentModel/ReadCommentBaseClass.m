//
//  ReadCommentBaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadCommentBaseClass.h"
#import "ReadCommentReviewList.h"
#import "ReadCommentProduct.h"
#import "ReadCommentPageinfo.h"
#import "ReadCommentSummary.h"


NSString *const kReadCommentBaseClassReviewList = @"review_list";
NSString *const kReadCommentBaseClassErrorCode = @"errorCode";
NSString *const kReadCommentBaseClassProduct = @"product";
NSString *const kReadCommentBaseClassPageinfo = @"pageinfo";
NSString *const kReadCommentBaseClassSummary = @"summary";


@interface ReadCommentBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadCommentBaseClass

@synthesize reviewList = _reviewList;
@synthesize errorCode = _errorCode;
@synthesize product = _product;
@synthesize pageinfo = _pageinfo;
@synthesize summary = _summary;


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
    NSObject *receivedReadCommentReviewList = [dict objectForKey:kReadCommentBaseClassReviewList];
    NSMutableArray *parsedReadCommentReviewList = [NSMutableArray array];
    if ([receivedReadCommentReviewList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadCommentReviewList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadCommentReviewList addObject:[ReadCommentReviewList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadCommentReviewList isKindOfClass:[NSDictionary class]]) {
       [parsedReadCommentReviewList addObject:[ReadCommentReviewList modelObjectWithDictionary:(NSDictionary *)receivedReadCommentReviewList]];
    }

    self.reviewList = [NSArray arrayWithArray:parsedReadCommentReviewList];
            self.errorCode = [[self objectOrNilForKey:kReadCommentBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.product = [ReadCommentProduct modelObjectWithDictionary:[dict objectForKey:kReadCommentBaseClassProduct]];
            self.pageinfo = [ReadCommentPageinfo modelObjectWithDictionary:[dict objectForKey:kReadCommentBaseClassPageinfo]];
            self.summary = [ReadCommentSummary modelObjectWithDictionary:[dict objectForKey:kReadCommentBaseClassSummary]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForReviewList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.reviewList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReviewList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReviewList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReviewList] forKey:kReadCommentBaseClassReviewList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kReadCommentBaseClassErrorCode];
    [mutableDict setValue:[self.product dictionaryRepresentation] forKey:kReadCommentBaseClassProduct];
    [mutableDict setValue:[self.pageinfo dictionaryRepresentation] forKey:kReadCommentBaseClassPageinfo];
    [mutableDict setValue:[self.summary dictionaryRepresentation] forKey:kReadCommentBaseClassSummary];

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

    self.reviewList = [aDecoder decodeObjectForKey:kReadCommentBaseClassReviewList];
    self.errorCode = [aDecoder decodeDoubleForKey:kReadCommentBaseClassErrorCode];
    self.product = [aDecoder decodeObjectForKey:kReadCommentBaseClassProduct];
    self.pageinfo = [aDecoder decodeObjectForKey:kReadCommentBaseClassPageinfo];
    self.summary = [aDecoder decodeObjectForKey:kReadCommentBaseClassSummary];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_reviewList forKey:kReadCommentBaseClassReviewList];
    [aCoder encodeDouble:_errorCode forKey:kReadCommentBaseClassErrorCode];
    [aCoder encodeObject:_product forKey:kReadCommentBaseClassProduct];
    [aCoder encodeObject:_pageinfo forKey:kReadCommentBaseClassPageinfo];
    [aCoder encodeObject:_summary forKey:kReadCommentBaseClassSummary];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadCommentBaseClass *copy = [[ReadCommentBaseClass alloc] init];
    
    if (copy) {

        copy.reviewList = [self.reviewList copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.product = [self.product copyWithZone:zone];
        copy.pageinfo = [self.pageinfo copyWithZone:zone];
        copy.summary = [self.summary copyWithZone:zone];
    }
    
    return copy;
}


@end
