//
//  WeatherCity.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherCity.h"


NSString *const kWeatherCityQlty = @"qlty";
NSString *const kWeatherCityPm25 = @"pm25";
NSString *const kWeatherCityAqi = @"aqi";
NSString *const kWeatherCityCo = @"co";
NSString *const kWeatherCityO3 = @"o3";
NSString *const kWeatherCityPm10 = @"pm10";
NSString *const kWeatherCityNo2 = @"no2";
NSString *const kWeatherCitySo2 = @"so2";


@interface WeatherCity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherCity

@synthesize qlty = _qlty;
@synthesize pm25 = _pm25;
@synthesize aqi = _aqi;
@synthesize co = _co;
@synthesize o3 = _o3;
@synthesize pm10 = _pm10;
@synthesize no2 = _no2;
@synthesize so2 = _so2;


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
            self.qlty = [self objectOrNilForKey:kWeatherCityQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:kWeatherCityPm25 fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:kWeatherCityAqi fromDictionary:dict];
            self.co = [self objectOrNilForKey:kWeatherCityCo fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:kWeatherCityO3 fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:kWeatherCityPm10 fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:kWeatherCityNo2 fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:kWeatherCitySo2 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:kWeatherCityQlty];
    [mutableDict setValue:self.pm25 forKey:kWeatherCityPm25];
    [mutableDict setValue:self.aqi forKey:kWeatherCityAqi];
    [mutableDict setValue:self.co forKey:kWeatherCityCo];
    [mutableDict setValue:self.o3 forKey:kWeatherCityO3];
    [mutableDict setValue:self.pm10 forKey:kWeatherCityPm10];
    [mutableDict setValue:self.no2 forKey:kWeatherCityNo2];
    [mutableDict setValue:self.so2 forKey:kWeatherCitySo2];

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

    self.qlty = [aDecoder decodeObjectForKey:kWeatherCityQlty];
    self.pm25 = [aDecoder decodeObjectForKey:kWeatherCityPm25];
    self.aqi = [aDecoder decodeObjectForKey:kWeatherCityAqi];
    self.co = [aDecoder decodeObjectForKey:kWeatherCityCo];
    self.o3 = [aDecoder decodeObjectForKey:kWeatherCityO3];
    self.pm10 = [aDecoder decodeObjectForKey:kWeatherCityPm10];
    self.no2 = [aDecoder decodeObjectForKey:kWeatherCityNo2];
    self.so2 = [aDecoder decodeObjectForKey:kWeatherCitySo2];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:kWeatherCityQlty];
    [aCoder encodeObject:_pm25 forKey:kWeatherCityPm25];
    [aCoder encodeObject:_aqi forKey:kWeatherCityAqi];
    [aCoder encodeObject:_co forKey:kWeatherCityCo];
    [aCoder encodeObject:_o3 forKey:kWeatherCityO3];
    [aCoder encodeObject:_pm10 forKey:kWeatherCityPm10];
    [aCoder encodeObject:_no2 forKey:kWeatherCityNo2];
    [aCoder encodeObject:_so2 forKey:kWeatherCitySo2];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherCity *copy = [[WeatherCity alloc] init];
    
    if (copy) {

        copy.qlty = [self.qlty copyWithZone:zone];
        copy.pm25 = [self.pm25 copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.co = [self.co copyWithZone:zone];
        copy.o3 = [self.o3 copyWithZone:zone];
        copy.pm10 = [self.pm10 copyWithZone:zone];
        copy.no2 = [self.no2 copyWithZone:zone];
        copy.so2 = [self.so2 copyWithZone:zone];
    }
    
    return copy;
}


@end
