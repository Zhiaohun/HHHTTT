//
//  WeatherBaseClass.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherBaseClass.h"
#import "WeatherHeWeatherDataService30.h"


NSString *const kWeatherBaseClassHeWeatherDataService30 = @"HeWeather data service 3.0";


@interface WeatherBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherBaseClass

@synthesize heWeatherDataService30 = _heWeatherDataService30;


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
    NSObject *receivedWeatherHeWeatherDataService30 = [dict objectForKey:kWeatherBaseClassHeWeatherDataService30];
    NSMutableArray *parsedWeatherHeWeatherDataService30 = [NSMutableArray array];
    if ([receivedWeatherHeWeatherDataService30 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWeatherHeWeatherDataService30) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWeatherHeWeatherDataService30 addObject:[WeatherHeWeatherDataService30 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWeatherHeWeatherDataService30 isKindOfClass:[NSDictionary class]]) {
       [parsedWeatherHeWeatherDataService30 addObject:[WeatherHeWeatherDataService30 modelObjectWithDictionary:(NSDictionary *)receivedWeatherHeWeatherDataService30]];
    }

    self.heWeatherDataService30 = [NSArray arrayWithArray:parsedWeatherHeWeatherDataService30];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForHeWeatherDataService30 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.heWeatherDataService30) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHeWeatherDataService30 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHeWeatherDataService30 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHeWeatherDataService30] forKey:kWeatherBaseClassHeWeatherDataService30];

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

    self.heWeatherDataService30 = [aDecoder decodeObjectForKey:kWeatherBaseClassHeWeatherDataService30];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_heWeatherDataService30 forKey:kWeatherBaseClassHeWeatherDataService30];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherBaseClass *copy = [[WeatherBaseClass alloc] init];
    
    if (copy) {

        copy.heWeatherDataService30 = [self.heWeatherDataService30 copyWithZone:zone];
    }
    
    return copy;
}


@end
