//
//  WeatherDailyForecast.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherDailyForecast.h"
#import "WeatherWind.h"
#import "WeatherAstro.h"
#import "WeatherCond.h"
#import "WeatherTmp.h"


NSString *const kWeatherDailyForecastWind = @"wind";
NSString *const kWeatherDailyForecastAstro = @"astro";
NSString *const kWeatherDailyForecastPres = @"pres";
NSString *const kWeatherDailyForecastPcpn = @"pcpn";
NSString *const kWeatherDailyForecastHum = @"hum";
NSString *const kWeatherDailyForecastDate = @"date";
NSString *const kWeatherDailyForecastVis = @"vis";
NSString *const kWeatherDailyForecastPop = @"pop";
NSString *const kWeatherDailyForecastCond = @"cond";
NSString *const kWeatherDailyForecastTmp = @"tmp";


@interface WeatherDailyForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherDailyForecast

@synthesize wind = _wind;
@synthesize astro = _astro;
@synthesize pres = _pres;
@synthesize pcpn = _pcpn;
@synthesize hum = _hum;
@synthesize date = _date;
@synthesize vis = _vis;
@synthesize pop = _pop;
@synthesize cond = _cond;
@synthesize tmp = _tmp;


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
            self.wind = [WeatherWind modelObjectWithDictionary:[dict objectForKey:kWeatherDailyForecastWind]];
            self.astro = [WeatherAstro modelObjectWithDictionary:[dict objectForKey:kWeatherDailyForecastAstro]];
            self.pres = [self objectOrNilForKey:kWeatherDailyForecastPres fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:kWeatherDailyForecastPcpn fromDictionary:dict];
            self.hum = [self objectOrNilForKey:kWeatherDailyForecastHum fromDictionary:dict];
            self.date = [self objectOrNilForKey:kWeatherDailyForecastDate fromDictionary:dict];
            self.vis = [self objectOrNilForKey:kWeatherDailyForecastVis fromDictionary:dict];
            self.pop = [self objectOrNilForKey:kWeatherDailyForecastPop fromDictionary:dict];
            self.cond = [WeatherCond modelObjectWithDictionary:[dict objectForKey:kWeatherDailyForecastCond]];
            self.tmp = [WeatherTmp modelObjectWithDictionary:[dict objectForKey:kWeatherDailyForecastTmp]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.wind dictionaryRepresentation] forKey:kWeatherDailyForecastWind];
    [mutableDict setValue:[self.astro dictionaryRepresentation] forKey:kWeatherDailyForecastAstro];
    [mutableDict setValue:self.pres forKey:kWeatherDailyForecastPres];
    [mutableDict setValue:self.pcpn forKey:kWeatherDailyForecastPcpn];
    [mutableDict setValue:self.hum forKey:kWeatherDailyForecastHum];
    [mutableDict setValue:self.date forKey:kWeatherDailyForecastDate];
    [mutableDict setValue:self.vis forKey:kWeatherDailyForecastVis];
    [mutableDict setValue:self.pop forKey:kWeatherDailyForecastPop];
    [mutableDict setValue:[self.cond dictionaryRepresentation] forKey:kWeatherDailyForecastCond];
    [mutableDict setValue:[self.tmp dictionaryRepresentation] forKey:kWeatherDailyForecastTmp];

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

    self.wind = [aDecoder decodeObjectForKey:kWeatherDailyForecastWind];
    self.astro = [aDecoder decodeObjectForKey:kWeatherDailyForecastAstro];
    self.pres = [aDecoder decodeObjectForKey:kWeatherDailyForecastPres];
    self.pcpn = [aDecoder decodeObjectForKey:kWeatherDailyForecastPcpn];
    self.hum = [aDecoder decodeObjectForKey:kWeatherDailyForecastHum];
    self.date = [aDecoder decodeObjectForKey:kWeatherDailyForecastDate];
    self.vis = [aDecoder decodeObjectForKey:kWeatherDailyForecastVis];
    self.pop = [aDecoder decodeObjectForKey:kWeatherDailyForecastPop];
    self.cond = [aDecoder decodeObjectForKey:kWeatherDailyForecastCond];
    self.tmp = [aDecoder decodeObjectForKey:kWeatherDailyForecastTmp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wind forKey:kWeatherDailyForecastWind];
    [aCoder encodeObject:_astro forKey:kWeatherDailyForecastAstro];
    [aCoder encodeObject:_pres forKey:kWeatherDailyForecastPres];
    [aCoder encodeObject:_pcpn forKey:kWeatherDailyForecastPcpn];
    [aCoder encodeObject:_hum forKey:kWeatherDailyForecastHum];
    [aCoder encodeObject:_date forKey:kWeatherDailyForecastDate];
    [aCoder encodeObject:_vis forKey:kWeatherDailyForecastVis];
    [aCoder encodeObject:_pop forKey:kWeatherDailyForecastPop];
    [aCoder encodeObject:_cond forKey:kWeatherDailyForecastCond];
    [aCoder encodeObject:_tmp forKey:kWeatherDailyForecastTmp];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherDailyForecast *copy = [[WeatherDailyForecast alloc] init];
    
    if (copy) {

        copy.wind = [self.wind copyWithZone:zone];
        copy.astro = [self.astro copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.vis = [self.vis copyWithZone:zone];
        copy.pop = [self.pop copyWithZone:zone];
        copy.cond = [self.cond copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
    }
    
    return copy;
}


@end
