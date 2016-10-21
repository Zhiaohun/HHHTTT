//
//  WeatherHeWeatherDataService30.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherNow, WeatherAqi, WeatherBasic, WeatherSuggestion;

@interface WeatherHeWeatherDataService30 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *hourlyForecast;
@property (nonatomic, strong) WeatherNow *now;
@property (nonatomic, strong) NSArray *dailyForecast;
@property (nonatomic, strong) WeatherAqi *aqi;
@property (nonatomic, strong) WeatherBasic *basic;
@property (nonatomic, strong) WeatherSuggestion *suggestion;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
