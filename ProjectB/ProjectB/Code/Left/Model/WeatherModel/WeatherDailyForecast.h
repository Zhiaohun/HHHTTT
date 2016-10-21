//
//  WeatherDailyForecast.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherWind, WeatherAstro, WeatherCond, WeatherTmp;

@interface WeatherDailyForecast : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) WeatherWind *wind;
@property (nonatomic, strong) WeatherAstro *astro;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *vis;
@property (nonatomic, strong) NSString *pop;
@property (nonatomic, strong) WeatherCond *cond;
@property (nonatomic, strong) WeatherTmp *tmp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
