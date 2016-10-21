//
//  WeatherHourlyForecast.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherHourlyForecast.h"
#import "WeatherWind.h"


NSString *const kWeatherHourlyForecastPop = @"pop";
NSString *const kWeatherHourlyForecastWind = @"wind";
NSString *const kWeatherHourlyForecastHum = @"hum";
NSString *const kWeatherHourlyForecastTmp = @"tmp";
NSString *const kWeatherHourlyForecastPres = @"pres";
NSString *const kWeatherHourlyForecastDate = @"date";


@interface WeatherHourlyForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHourlyForecast

@synthesize pop = _pop;
@synthesize wind = _wind;
@synthesize hum = _hum;
@synthesize tmp = _tmp;
@synthesize pres = _pres;
@synthesize date = _date;


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
            self.pop = [self objectOrNilForKey:kWeatherHourlyForecastPop fromDictionary:dict];
            self.wind = [WeatherWind modelObjectWithDictionary:[dict objectForKey:kWeatherHourlyForecastWind]];
            self.hum = [self objectOrNilForKey:kWeatherHourlyForecastHum fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kWeatherHourlyForecastTmp fromDictionary:dict];
            self.pres = [self objectOrNilForKey:kWeatherHourlyForecastPres fromDictionary:dict];
            self.date = [self objectOrNilForKey:kWeatherHourlyForecastDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pop forKey:kWeatherHourlyForecastPop];
    [mutableDict setValue:[self.wind dictionaryRepresentation] forKey:kWeatherHourlyForecastWind];
    [mutableDict setValue:self.hum forKey:kWeatherHourlyForecastHum];
    [mutableDict setValue:self.tmp forKey:kWeatherHourlyForecastTmp];
    [mutableDict setValue:self.pres forKey:kWeatherHourlyForecastPres];
    [mutableDict setValue:self.date forKey:kWeatherHourlyForecastDate];

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

    self.pop = [aDecoder decodeObjectForKey:kWeatherHourlyForecastPop];
    self.wind = [aDecoder decodeObjectForKey:kWeatherHourlyForecastWind];
    self.hum = [aDecoder decodeObjectForKey:kWeatherHourlyForecastHum];
    self.tmp = [aDecoder decodeObjectForKey:kWeatherHourlyForecastTmp];
    self.pres = [aDecoder decodeObjectForKey:kWeatherHourlyForecastPres];
    self.date = [aDecoder decodeObjectForKey:kWeatherHourlyForecastDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pop forKey:kWeatherHourlyForecastPop];
    [aCoder encodeObject:_wind forKey:kWeatherHourlyForecastWind];
    [aCoder encodeObject:_hum forKey:kWeatherHourlyForecastHum];
    [aCoder encodeObject:_tmp forKey:kWeatherHourlyForecastTmp];
    [aCoder encodeObject:_pres forKey:kWeatherHourlyForecastPres];
    [aCoder encodeObject:_date forKey:kWeatherHourlyForecastDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherHourlyForecast *copy = [[WeatherHourlyForecast alloc] init];
    
    if (copy) {

        copy.pop = [self.pop copyWithZone:zone];
        copy.wind = [self.wind copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
    }
    
    return copy;
}


@end
