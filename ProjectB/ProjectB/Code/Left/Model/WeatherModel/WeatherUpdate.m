//
//  WeatherUpdate.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherUpdate.h"


NSString *const kWeatherUpdateLoc = @"loc";
NSString *const kWeatherUpdateUtc = @"utc";


@interface WeatherUpdate ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherUpdate

@synthesize loc = _loc;
@synthesize utc = _utc;


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
            self.loc = [self objectOrNilForKey:kWeatherUpdateLoc fromDictionary:dict];
            self.utc = [self objectOrNilForKey:kWeatherUpdateUtc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.loc forKey:kWeatherUpdateLoc];
    [mutableDict setValue:self.utc forKey:kWeatherUpdateUtc];

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

    self.loc = [aDecoder decodeObjectForKey:kWeatherUpdateLoc];
    self.utc = [aDecoder decodeObjectForKey:kWeatherUpdateUtc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_loc forKey:kWeatherUpdateLoc];
    [aCoder encodeObject:_utc forKey:kWeatherUpdateUtc];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherUpdate *copy = [[WeatherUpdate alloc] init];
    
    if (copy) {

        copy.loc = [self.loc copyWithZone:zone];
        copy.utc = [self.utc copyWithZone:zone];
    }
    
    return copy;
}


@end
