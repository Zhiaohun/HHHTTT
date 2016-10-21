//
//  WeatherComf.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherComf.h"


NSString *const kWeatherComfBrf = @"brf";
NSString *const kWeatherComfTxt = @"txt";


@interface WeatherComf ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherComf

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
            self.brf = [self objectOrNilForKey:kWeatherComfBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kWeatherComfTxt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:kWeatherComfBrf];
    [mutableDict setValue:self.txt forKey:kWeatherComfTxt];

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

    self.brf = [aDecoder decodeObjectForKey:kWeatherComfBrf];
    self.txt = [aDecoder decodeObjectForKey:kWeatherComfTxt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:kWeatherComfBrf];
    [aCoder encodeObject:_txt forKey:kWeatherComfTxt];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherComf *copy = [[WeatherComf alloc] init];
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
    }
    
    return copy;
}


@end
