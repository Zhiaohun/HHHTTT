//
//  WeatherWind.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherWind.h"


NSString *const kWeatherWindDir = @"dir";
NSString *const kWeatherWindDeg = @"deg";
NSString *const kWeatherWindSc = @"sc";
NSString *const kWeatherWindSpd = @"spd";


@interface WeatherWind ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherWind

@synthesize dir = _dir;
@synthesize deg = _deg;
@synthesize sc = _sc;
@synthesize spd = _spd;


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
            self.dir = [self objectOrNilForKey:kWeatherWindDir fromDictionary:dict];
            self.deg = [self objectOrNilForKey:kWeatherWindDeg fromDictionary:dict];
            self.sc = [self objectOrNilForKey:kWeatherWindSc fromDictionary:dict];
            self.spd = [self objectOrNilForKey:kWeatherWindSpd fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dir forKey:kWeatherWindDir];
    [mutableDict setValue:self.deg forKey:kWeatherWindDeg];
    [mutableDict setValue:self.sc forKey:kWeatherWindSc];
    [mutableDict setValue:self.spd forKey:kWeatherWindSpd];

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

    self.dir = [aDecoder decodeObjectForKey:kWeatherWindDir];
    self.deg = [aDecoder decodeObjectForKey:kWeatherWindDeg];
    self.sc = [aDecoder decodeObjectForKey:kWeatherWindSc];
    self.spd = [aDecoder decodeObjectForKey:kWeatherWindSpd];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dir forKey:kWeatherWindDir];
    [aCoder encodeObject:_deg forKey:kWeatherWindDeg];
    [aCoder encodeObject:_sc forKey:kWeatherWindSc];
    [aCoder encodeObject:_spd forKey:kWeatherWindSpd];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherWind *copy = [[WeatherWind alloc] init];
    
    if (copy) {

        copy.dir = [self.dir copyWithZone:zone];
        copy.deg = [self.deg copyWithZone:zone];
        copy.sc = [self.sc copyWithZone:zone];
        copy.spd = [self.spd copyWithZone:zone];
    }
    
    return copy;
}


@end
