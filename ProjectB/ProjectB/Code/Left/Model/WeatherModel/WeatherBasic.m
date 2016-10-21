//
//  WeatherBasic.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherBasic.h"
#import "WeatherUpdate.h"


NSString *const kWeatherBasicId = @"id";
NSString *const kWeatherBasicLat = @"lat";
NSString *const kWeatherBasicCnty = @"cnty";
NSString *const kWeatherBasicCity = @"city";
NSString *const kWeatherBasicLon = @"lon";
NSString *const kWeatherBasicUpdate = @"update";


@interface WeatherBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherBasic

@synthesize basicIdentifier = _basicIdentifier;
@synthesize lat = _lat;
@synthesize cnty = _cnty;
@synthesize city = _city;
@synthesize lon = _lon;
@synthesize update = _update;


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
            self.basicIdentifier = [self objectOrNilForKey:kWeatherBasicId fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kWeatherBasicLat fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:kWeatherBasicCnty fromDictionary:dict];
            self.city = [self objectOrNilForKey:kWeatherBasicCity fromDictionary:dict];
            self.lon = [self objectOrNilForKey:kWeatherBasicLon fromDictionary:dict];
            self.update = [WeatherUpdate modelObjectWithDictionary:[dict objectForKey:kWeatherBasicUpdate]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.basicIdentifier forKey:kWeatherBasicId];
    [mutableDict setValue:self.lat forKey:kWeatherBasicLat];
    [mutableDict setValue:self.cnty forKey:kWeatherBasicCnty];
    [mutableDict setValue:self.city forKey:kWeatherBasicCity];
    [mutableDict setValue:self.lon forKey:kWeatherBasicLon];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:kWeatherBasicUpdate];

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

    self.basicIdentifier = [aDecoder decodeObjectForKey:kWeatherBasicId];
    self.lat = [aDecoder decodeObjectForKey:kWeatherBasicLat];
    self.cnty = [aDecoder decodeObjectForKey:kWeatherBasicCnty];
    self.city = [aDecoder decodeObjectForKey:kWeatherBasicCity];
    self.lon = [aDecoder decodeObjectForKey:kWeatherBasicLon];
    self.update = [aDecoder decodeObjectForKey:kWeatherBasicUpdate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basicIdentifier forKey:kWeatherBasicId];
    [aCoder encodeObject:_lat forKey:kWeatherBasicLat];
    [aCoder encodeObject:_cnty forKey:kWeatherBasicCnty];
    [aCoder encodeObject:_city forKey:kWeatherBasicCity];
    [aCoder encodeObject:_lon forKey:kWeatherBasicLon];
    [aCoder encodeObject:_update forKey:kWeatherBasicUpdate];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherBasic *copy = [[WeatherBasic alloc] init];
    
    if (copy) {

        copy.basicIdentifier = [self.basicIdentifier copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.cnty = [self.cnty copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
