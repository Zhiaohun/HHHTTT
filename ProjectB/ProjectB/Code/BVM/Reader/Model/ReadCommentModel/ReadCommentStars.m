//
//  ReadCommentStars.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadCommentStars.h"


NSString *const kReadCommentStarsHasHalfStar = @"has_half_star";
NSString *const kReadCommentStarsFullStar = @"full_star";


@interface ReadCommentStars ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadCommentStars

@synthesize hasHalfStar = _hasHalfStar;
@synthesize fullStar = _fullStar;


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
            self.hasHalfStar = [[self objectOrNilForKey:kReadCommentStarsHasHalfStar fromDictionary:dict] boolValue];
            self.fullStar = [[self objectOrNilForKey:kReadCommentStarsFullStar fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasHalfStar] forKey:kReadCommentStarsHasHalfStar];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fullStar] forKey:kReadCommentStarsFullStar];

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

    self.hasHalfStar = [aDecoder decodeBoolForKey:kReadCommentStarsHasHalfStar];
    self.fullStar = [aDecoder decodeDoubleForKey:kReadCommentStarsFullStar];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasHalfStar forKey:kReadCommentStarsHasHalfStar];
    [aCoder encodeDouble:_fullStar forKey:kReadCommentStarsFullStar];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadCommentStars *copy = [[ReadCommentStars alloc] init];
    
    if (copy) {

        copy.hasHalfStar = self.hasHalfStar;
        copy.fullStar = self.fullStar;
    }
    
    return copy;
}


@end
