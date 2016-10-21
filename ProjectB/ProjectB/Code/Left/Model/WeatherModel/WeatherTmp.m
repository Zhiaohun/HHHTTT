//
//  WeatherTmp.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherTmp.h"


NSString *const kWeatherTmpMax = @"max";
NSString *const kWeatherTmpMin = @"min";


@interface WeatherTmp ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherTmp

@synthesize max = _max;
@synthesize min = _min;


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
            self.max = [self objectOrNilForKey:kWeatherTmpMax fromDictionary:dict];
            self.min = [self objectOrNilForKey:kWeatherTmpMin fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.max forKey:kWeatherTmpMax];
    [mutableDict setValue:self.min forKey:kWeatherTmpMin];

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

    self.max = [aDecoder decodeObjectForKey:kWeatherTmpMax];
    self.min = [aDecoder decodeObjectForKey:kWeatherTmpMin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_max forKey:kWeatherTmpMax];
    [aCoder encodeObject:_min forKey:kWeatherTmpMin];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherTmp *copy = [[WeatherTmp alloc] init];
    
    if (copy) {

        copy.max = [self.max copyWithZone:zone];
        copy.min = [self.min copyWithZone:zone];
    }
    
    return copy;
}


@end
