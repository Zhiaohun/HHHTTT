//
//  WeatherWind.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherWind : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dir;
@property (nonatomic, strong) NSString *deg;
@property (nonatomic, strong) NSString *sc;
@property (nonatomic, strong) NSString *spd;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
