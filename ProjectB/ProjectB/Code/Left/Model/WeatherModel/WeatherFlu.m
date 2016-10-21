//
//  WeatherFlu.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherFlu.h"


NSString *const kWeatherFluBrf = @"brf";
NSString *const kWeatherFluTxt = @"txt";


@interface WeatherFlu ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherFlu

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
            self.brf = [self objectOrNilForKey:kWeatherFluBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kWeatherFluTxt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:kWeatherFluBrf];
    [mutableDict setValue:self.txt forKey:kWeatherFluTxt];

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

    self.brf = [aDecoder decodeObjectForKey:kWeatherFluBrf];
    self.txt = [aDecoder decodeObjectForKey:kWeatherFluTxt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:kWeatherFluBrf];
    [aCoder encodeObject:_txt forKey:kWeatherFluTxt];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherFlu *copy = [[WeatherFlu alloc] init];
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
    }
    
    return copy;
}


@end
