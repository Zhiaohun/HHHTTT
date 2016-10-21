//
//  WeatherSuggestion.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherDrsg, WeatherFlu, WeatherSport, WeatherComf, WeatherTrav, WeatherCw, WeatherUv;

@interface WeatherSuggestion : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) WeatherDrsg *drsg;
@property (nonatomic, strong) WeatherFlu *flu;
@property (nonatomic, strong) WeatherSport *sport;
@property (nonatomic, strong) WeatherComf *comf;
@property (nonatomic, strong) WeatherTrav *trav;
@property (nonatomic, strong) WeatherCw *cw;
@property (nonatomic, strong) WeatherUv *uv;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
