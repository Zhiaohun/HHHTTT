//
//  ReadMotivationStars.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadMotivationStars.h"


NSString *const kReadMotivationStarsHasHalfStar = @"has_half_star";
NSString *const kReadMotivationStarsFullStar = @"full_star";


@interface ReadMotivationStars ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadMotivationStars

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
            self.hasHalfStar = [[self objectOrNilForKey:kReadMotivationStarsHasHalfStar fromDictionary:dict] boolValue];
            self.fullStar = [[self objectOrNilForKey:kReadMotivationStarsFullStar fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasHalfStar] forKey:kReadMotivationStarsHasHalfStar];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fullStar] forKey:kReadMotivationStarsFullStar];

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

    self.hasHalfStar = [aDecoder decodeBoolForKey:kReadMotivationStarsHasHalfStar];
    self.fullStar = [aDecoder decodeDoubleForKey:kReadMotivationStarsFullStar];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasHalfStar forKey:kReadMotivationStarsHasHalfStar];
    [aCoder encodeDouble:_fullStar forKey:kReadMotivationStarsFullStar];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadMotivationStars *copy = [[ReadMotivationStars alloc] init];
    
    if (copy) {

        copy.hasHalfStar = self.hasHalfStar;
        copy.fullStar = self.fullStar;
    }
    
    return copy;
}


@end
