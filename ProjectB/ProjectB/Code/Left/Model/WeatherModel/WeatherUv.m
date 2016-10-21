//
//  WeatherUv.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherUv.h"


NSString *const kWeatherUvBrf = @"brf";
NSString *const kWeatherUvTxt = @"txt";


@interface WeatherUv ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherUv

@synthesize brf = _brf;
@synthesize txt = _txt;


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
            self.brf = [self objectOrNilForKey:kWeatherUvBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kWeatherUvTxt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:kWeatherUvBrf];
    [mutableDict setValue:self.txt forKey:kWeatherUvTxt];

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

    self.brf = [aDecoder decodeObjectForKey:kWeatherUvBrf];
    self.txt = [aDecoder decodeObjectForKey:kWeatherUvTxt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:kWeatherUvBrf];
    [aCoder encodeObject:_txt forKey:kWeatherUvTxt];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherUv *copy = [[WeatherUv alloc] init];
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
    }
    
    return copy;
}


@end
