//
//  WeatherHeWeatherDataService30.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherHeWeatherDataService30.h"
#import "WeatherHourlyForecast.h"
#import "WeatherNow.h"
#import "WeatherDailyForecast.h"
#import "WeatherAqi.h"
#import "WeatherBasic.h"
#import "WeatherSuggestion.h"


NSString *const kWeatherHeWeatherDataService30Status = @"status";
NSString *const kWeatherHeWeatherDataService30HourlyForecast = @"hourly_forecast";
NSString *const kWeatherHeWeatherDataService30Now = @"now";
NSString *const kWeatherHeWeatherDataService30DailyForecast = @"daily_forecast";
NSString *const kWeatherHeWeatherDataService30Aqi = @"aqi";
NSString *const kWeatherHeWeatherDataService30Basic = @"basic";
NSString *const kWeatherHeWeatherDataService30Suggestion = @"suggestion";


@interface WeatherHeWeatherDataService30 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherHeWeatherDataService30

@synthesize status = _status;
@synthesize hourlyForecast = _hourlyForecast;
@synthesize now = _now;
@synthesize dailyForecast = _dailyForecast;
@synthesize aqi = _aqi;
@synthesize basic = _basic;
@synthesize suggestion = _suggestion;


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
            self.status = [self objectOrNilForKey:kWeatherHeWeatherDataService30Status fromDictionary:dict];
    NSObject *receivedWeatherHourlyForecast = [dict objectForKey:kWeatherHeWeatherDataService30HourlyForecast];
    NSMutableArray *parsedWeatherHourlyForecast = [NSMutableArray array];
    if ([receivedWeatherHourlyForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWeatherHourlyForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWeatherHourlyForecast addObject:[WeatherHourlyForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWeatherHourlyForecast isKindOfClass:[NSDictionary class]]) {
       [parsedWeatherHourlyForecast addObject:[WeatherHourlyForecast modelObjectWithDictionary:(NSDictionary *)receivedWeatherHourlyForecast]];
    }

    self.hourlyForecast = [NSArray arrayWithArray:parsedWeatherHourlyForecast];
            self.now = [WeatherNow modelObjectWithDictionary:[dict objectForKey:kWeatherHeWeatherDataService30Now]];
    NSObject *receivedWeatherDailyForecast = [dict objectForKey:kWeatherHeWeatherDataService30DailyForecast];
    NSMutableArray *parsedWeatherDailyForecast = [NSMutableArray array];
    if ([receivedWeatherDailyForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWeatherDailyForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWeatherDailyForecast addObject:[WeatherDailyForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWeatherDailyForecast isKindOfClass:[NSDictionary class]]) {
       [parsedWeatherDailyForecast addObject:[WeatherDailyForecast modelObjectWithDictionary:(NSDictionary *)receivedWeatherDailyForecast]];
    }

    self.dailyForecast = [NSArray arrayWithArray:parsedWeatherDailyForecast];
            self.aqi = [WeatherAqi modelObjectWithDictionary:[dict objectForKey:kWeatherHeWeatherDataService30Aqi]];
            self.basic = [WeatherBasic modelObjectWithDictionary:[dict objectForKey:kWeatherHeWeatherDataService30Basic]];
            self.suggestion = [WeatherSuggestion modelObjectWithDictionary:[dict objectForKey:kWeatherHeWeatherDataService30Suggestion]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kWeatherHeWeatherDataService30Status];
    NSMutableArray *tempArrayForHourlyForecast = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hourlyForecast) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHourlyForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHourlyForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHourlyForecast] forKey:kWeatherHeWeatherDataService30HourlyForecast];
    [mutableDict setValue:[self.now dictionaryRepresentation] forKey:kWeatherHeWeatherDataService30Now];
    NSMutableArray *tempArrayForDailyForecast = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dailyForecast) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDailyForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDailyForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDailyForecast] forKey:kWeatherHeWeatherDataService30DailyForecast];
    [mutableDict setValue:[self.aqi dictionaryRepresentation] forKey:kWeatherHeWeatherDataService30Aqi];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kWeatherHeWeatherDataService30Basic];
    [mutableDict setValue:[self.suggestion dictionaryRepresentation] forKey:kWeatherHeWeatherDataService30Suggestion];

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

    self.status = [aDecoder decodeObjectForKey:kWeatherHeWeatherDataService30Status];
    self.hourlyForecast = [aDecoder decodeObjectForKey:kWeatherHeWeatherDataService30HourlyForecast];
    self.now = [aDecoder decodeObjectForKey:kWeatherHeWeatherDataService30Now];
    self.dailyForecast = [aDecoder decodeObjectForKey:kWeatherHeWeatherDataService30DailyForecast];
    self.aqi = [aDecoder decodeObjectForKey:kWeatherHeWeatherDataService30Aqi];
    self.basic = [aDecoder decodeObjectForKey:kWeatherHeWeatherDataService30Basic];
    self.suggestion = [aDecoder decodeObjectForKey:kWeatherHeWeatherDataService30Suggestion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kWeatherHeWeatherDataService30Status];
    [aCoder encodeObject:_hourlyForecast forKey:kWeatherHeWeatherDataService30HourlyForecast];
    [aCoder encodeObject:_now forKey:kWeatherHeWeatherDataService30Now];
    [aCoder encodeObject:_dailyForecast forKey:kWeatherHeWeatherDataService30DailyForecast];
    [aCoder encodeObject:_aqi forKey:kWeatherHeWeatherDataService30Aqi];
    [aCoder encodeObject:_basic forKey:kWeatherHeWeatherDataService30Basic];
    [aCoder encodeObject:_suggestion forKey:kWeatherHeWeatherDataService30Suggestion];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherHeWeatherDataService30 *copy = [[WeatherHeWeatherDataService30 alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.hourlyForecast = [self.hourlyForecast copyWithZone:zone];
        copy.now = [self.now copyWithZone:zone];
        copy.dailyForecast = [self.dailyForecast copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.suggestion = [self.suggestion copyWithZone:zone];
    }
    
    return copy;
}


@end
