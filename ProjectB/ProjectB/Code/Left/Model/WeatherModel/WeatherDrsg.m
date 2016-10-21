//
//  WeatherDrsg.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherDrsg.h"


NSString *const kWeatherDrsgBrf = @"brf";
NSString *const kWeatherDrsgTxt = @"txt";


@interface WeatherDrsg ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherDrsg

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
            self.brf = [self objectOrNilForKey:kWeatherDrsgBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kWeatherDrsgTxt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:kWeatherDrsgBrf];
    [mutableDict setValue:self.txt forKey:kWeatherDrsgTxt];

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

    self.brf = [aDecoder decodeObjectForKey:kWeatherDrsgBrf];
    self.txt = [aDecoder decodeObjectForKey:kWeatherDrsgTxt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:kWeatherDrsgBrf];
    [aCoder encodeObject:_txt forKey:kWeatherDrsgTxt];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherDrsg *copy = [[WeatherDrsg alloc] init];
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
    }
    
    return copy;
}


@end
