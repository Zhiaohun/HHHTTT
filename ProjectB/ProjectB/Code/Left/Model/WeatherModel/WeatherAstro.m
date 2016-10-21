//
//  WeatherAstro.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherAstro.h"


NSString *const kWeatherAstroSs = @"ss";
NSString *const kWeatherAstroSr = @"sr";


@interface WeatherAstro ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherAstro

@synthesize ss = _ss;
@synthesize sr = _sr;


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
            self.ss = [self objectOrNilForKey:kWeatherAstroSs fromDictionary:dict];
            self.sr = [self objectOrNilForKey:kWeatherAstroSr fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ss forKey:kWeatherAstroSs];
    [mutableDict setValue:self.sr forKey:kWeatherAstroSr];

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

    self.ss = [aDecoder decodeObjectForKey:kWeatherAstroSs];
    self.sr = [aDecoder decodeObjectForKey:kWeatherAstroSr];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ss forKey:kWeatherAstroSs];
    [aCoder encodeObject:_sr forKey:kWeatherAstroSr];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherAstro *copy = [[WeatherAstro alloc] init];
    
    if (copy) {

        copy.ss = [self.ss copyWithZone:zone];
        copy.sr = [self.sr copyWithZone:zone];
    }
    
    return copy;
}


@end
