//
//  WeatherBasic.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherUpdate;

@interface WeatherBasic : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *basicIdentifier;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *cnty;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) WeatherUpdate *update;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
