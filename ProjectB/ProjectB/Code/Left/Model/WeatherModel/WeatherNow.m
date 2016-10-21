//
//  WeatherNow.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherNow.h"
#import "WeatherWind.h"
#import "WeatherCond.h"


NSString *const kWeatherNowWind = @"wind";
NSString *const kWeatherNowPres = @"pres";
NSString *const kWeatherNowFl = @"fl";
NSString *const kWeatherNowHum = @"hum";
NSString *const kWeatherNowVis = @"vis";
NSString *const kWeatherNowCond = @"cond";
NSString *const kWeatherNowPcpn = @"pcpn";
NSString *const kWeatherNowTmp = @"tmp";


@interface WeatherNow ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherNow

@synthesize wind = _wind;
@synthesize pres = _pres;
@synthesize fl = _fl;
@synthesize hum = _hum;
@synthesize vis = _vis;
@synthesize cond = _cond;
@synthesize pcpn = _pcpn;
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
            self.wind = [WeatherWind modelObjectWithDictionary:[dict objectForKey:kWeatherNowWind]];
            self.pres = [self objectOrNilForKey:kWeatherNowPres fromDictionary:dict];
            self.fl = [self objectOrNilForKey:kWeatherNowFl fromDictionary:dict];
            self.hum = [self objectOrNilForKey:kWeatherNowHum fromDictionary:dict];
            self.vis = [self objectOrNilForKey:kWeatherNowVis fromDictionary:dict];
            self.cond = [WeatherCond modelObjectWithDictionary:[dict objectForKey:kWeatherNowCond]];
            self.pcpn = [self objectOrNilForKey:kWeatherNowPcpn fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:kWeatherNowTmp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.wind dictionaryRepresentation] forKey:kWeatherNowWind];
    [mutableDict setValue:self.pres forKey:kWeatherNowPres];
    [mutableDict setValue:self.fl forKey:kWeatherNowFl];
    [mutableDict setValue:self.hum forKey:kWeatherNowHum];
    [mutableDict setValue:self.vis forKey:kWeatherNowVis];
    [mutableDict setValue:[self.cond dictionaryRepresentation] forKey:kWeatherNowCond];
    [mutableDict setValue:self.pcpn forKey:kWeatherNowPcpn];
    [mutableDict setValue:self.tmp forKey:kWeatherNowTmp];

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

    self.wind = [aDecoder decodeObjectForKey:kWeatherNowWind];
    self.pres = [aDecoder decodeObjectForKey:kWeatherNowPres];
    self.fl = [aDecoder decodeObjectForKey:kWeatherNowFl];
    self.hum = [aDecoder decodeObjectForKey:kWeatherNowHum];
    self.vis = [aDecoder decodeObjectForKey:kWeatherNowVis];
    self.cond = [aDecoder decodeObjectForKey:kWeatherNowCond];
    self.pcpn = [aDecoder decodeObjectForKey:kWeatherNowPcpn];
    self.tmp = [aDecoder decodeObjectForKey:kWeatherNowTmp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wind forKey:kWeatherNowWind];
    [aCoder encodeObject:_pres forKey:kWeatherNowPres];
    [aCoder encodeObject:_fl forKey:kWeatherNowFl];
    [aCoder encodeObject:_hum forKey:kWeatherNowHum];
    [aCoder encodeObject:_vis forKey:kWeatherNowVis];
    [aCoder encodeObject:_cond forKey:kWeatherNowCond];
    [aCoder encodeObject:_pcpn forKey:kWeatherNowPcpn];
    [aCoder encodeObject:_tmp forKey:kWeatherNowTmp];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherNow *copy = [[WeatherNow alloc] init];
    
    if (copy) {

        copy.wind = [self.wind copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.fl = [self.fl copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.vis = [self.vis copyWithZone:zone];
        copy.cond = [self.cond copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
    }
    
    return copy;
}


@end
