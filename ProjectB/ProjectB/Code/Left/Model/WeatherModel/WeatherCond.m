//
//  WeatherCond.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeatherCond.h"


NSString *const kWeatherCondCode = @"code";
NSString *const kWeatherCondTxt = @"txt";
NSString *const kWeatherCondTxtD = @"txt_d";
NSString *const kWeatherCondCodeN = @"code_n";
NSString *const kWeatherCondCodeD = @"code_d";
NSString *const kWeatherCondTxtN = @"txt_n";


@interface WeatherCond ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherCond

@synthesize code = _code;
@synthesize txt = _txt;
@synthesize txtD = _txtD;
@synthesize codeN = _codeN;
@synthesize codeD = _codeD;
@synthesize txtN = _txtN;


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
            self.code = [self objectOrNilForKey:kWeatherCondCode fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kWeatherCondTxt fromDictionary:dict];
            self.txtD = [self objectOrNilForKey:kWeatherCondTxtD fromDictionary:dict];
            self.codeN = [self objectOrNilForKey:kWeatherCondCodeN fromDictionary:dict];
            self.codeD = [self objectOrNilForKey:kWeatherCondCodeD fromDictionary:dict];
            self.txtN = [self objectOrNilForKey:kWeatherCondTxtN fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kWeatherCondCode];
    [mutableDict setValue:self.txt forKey:kWeatherCondTxt];
    [mutableDict setValue:self.txtD forKey:kWeatherCondTxtD];
    [mutableDict setValue:self.codeN forKey:kWeatherCondCodeN];
    [mutableDict setValue:self.codeD forKey:kWeatherCondCodeD];
    [mutableDict setValue:self.txtN forKey:kWeatherCondTxtN];

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

    self.code = [aDecoder decodeObjectForKey:kWeatherCondCode];
    self.txt = [aDecoder decodeObjectForKey:kWeatherCondTxt];
    self.txtD = [aDecoder decodeObjectForKey:kWeatherCondTxtD];
    self.codeN = [aDecoder decodeObjectForKey:kWeatherCondCodeN];
    self.codeD = [aDecoder decodeObjectForKey:kWeatherCondCodeD];
    self.txtN = [aDecoder decodeObjectForKey:kWeatherCondTxtN];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kWeatherCondCode];
    [aCoder encodeObject:_txt forKey:kWeatherCondTxt];
    [aCoder encodeObject:_txtD forKey:kWeatherCondTxtD];
    [aCoder encodeObject:_codeN forKey:kWeatherCondCodeN];
    [aCoder encodeObject:_codeD forKey:kWeatherCondCodeD];
    [aCoder encodeObject:_txtN forKey:kWeatherCondTxtN];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherCond *copy = [[WeatherCond alloc] init];
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.txtD = [self.txtD copyWithZone:zone];
        copy.codeN = [self.codeN copyWithZone:zone];
        copy.codeD = [self.codeD copyWithZone:zone];
        copy.txtN = [self.txtN copyWithZone:zone];
    }
    
    return copy;
}


@end
