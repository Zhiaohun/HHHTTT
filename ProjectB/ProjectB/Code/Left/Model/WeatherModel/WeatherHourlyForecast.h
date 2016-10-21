//
//  WeatherHourlyForecast.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherWind;

@interface WeatherHourlyForecast : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pop;
@property (nonatomic, strong) WeatherWind *wind;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *tmp;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *date;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
