//
//  WeatherUpdate.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherUpdate : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *loc;
@property (nonatomic, strong) NSString *utc;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
