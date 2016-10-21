//
//  WeatherSuggestion.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherSuggestion.h"
#import "WeatherDrsg.h"
#import "WeatherFlu.h"
#import "WeatherSport.h"
#import "WeatherComf.h"
#import "WeatherTrav.h"
#import "WeatherCw.h"
#import "WeatherUv.h"


NSString *const kWeatherSuggestionDrsg = @"drsg";
NSString *const kWeatherSuggestionFlu = @"flu";
NSString *const kWeatherSuggestionSport = @"sport";
NSString *const kWeatherSuggestionComf = @"comf";
NSString *const kWeatherSuggestionTrav = @"trav";
NSString *const kWeatherSuggestionCw = @"cw";
NSString *const kWeatherSuggestionUv = @"uv";


@interface WeatherSuggestion ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherSuggestion

@synthesize drsg = _drsg;
@synthesize flu = _flu;
@synthesize sport = _sport;
@synthesize comf = _comf;
@synthesize trav = _trav;
@synthesize cw = _cw;
@synthesize uv = _uv;


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
            self.drsg = [WeatherDrsg modelObjectWithDictionary:[dict objectForKey:kWeatherSuggestionDrsg]];
            self.flu = [WeatherFlu modelObjectWithDictionary:[dict objectForKey:kWeatherSuggestionFlu]];
            self.sport = [WeatherSport modelObjectWithDictionary:[dict objectForKey:kWeatherSuggestionSport]];
            self.comf = [WeatherComf modelObjectWithDictionary:[dict objectForKey:kWeatherSuggestionComf]];
            self.trav = [WeatherTrav modelObjectWithDictionary:[dict objectForKey:kWeatherSuggestionTrav]];
            self.cw = [WeatherCw modelObjectWithDictionary:[dict objectForKey:kWeatherSuggestionCw]];
            self.uv = [WeatherUv modelObjectWithDictionary:[dict objectForKey:kWeatherSuggestionUv]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.drsg dictionaryRepresentation] forKey:kWeatherSuggestionDrsg];
    [mutableDict setValue:[self.flu dictionaryRepresentation] forKey:kWeatherSuggestionFlu];
    [mutableDict setValue:[self.sport dictionaryRepresentation] forKey:kWeatherSuggestionSport];
    [mutableDict setValue:[self.comf dictionaryRepresentation] forKey:kWeatherSuggestionComf];
    [mutableDict setValue:[self.trav dictionaryRepresentation] forKey:kWeatherSuggestionTrav];
    [mutableDict setValue:[self.cw dictionaryRepresentation] forKey:kWeatherSuggestionCw];
    [mutableDict setValue:[self.uv dictionaryRepresentation] forKey:kWeatherSuggestionUv];

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

    self.drsg = [aDecoder decodeObjectForKey:kWeatherSuggestionDrsg];
    self.flu = [aDecoder decodeObjectForKey:kWeatherSuggestionFlu];
    self.sport = [aDecoder decodeObjectForKey:kWeatherSuggestionSport];
    self.comf = [aDecoder decodeObjectForKey:kWeatherSuggestionComf];
    self.trav = [aDecoder decodeObjectForKey:kWeatherSuggestionTrav];
    self.cw = [aDecoder decodeObjectForKey:kWeatherSuggestionCw];
    self.uv = [aDecoder decodeObjectForKey:kWeatherSuggestionUv];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_drsg forKey:kWeatherSuggestionDrsg];
    [aCoder encodeObject:_flu forKey:kWeatherSuggestionFlu];
    [aCoder encodeObject:_sport forKey:kWeatherSuggestionSport];
    [aCoder encodeObject:_comf forKey:kWeatherSuggestionComf];
    [aCoder encodeObject:_trav forKey:kWeatherSuggestionTrav];
    [aCoder encodeObject:_cw forKey:kWeatherSuggestionCw];
    [aCoder encodeObject:_uv forKey:kWeatherSuggestionUv];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherSuggestion *copy = [[WeatherSuggestion alloc] init];
    
    if (copy) {

        copy.drsg = [self.drsg copyWithZone:zone];
        copy.flu = [self.flu copyWithZone:zone];
        copy.sport = [self.sport copyWithZone:zone];
        copy.comf = [self.comf copyWithZone:zone];
        copy.trav = [self.trav copyWithZone:zone];
        copy.cw = [self.cw copyWithZone:zone];
        copy.uv = [self.uv copyWithZone:zone];
    }
    
    return copy;
}


@end
