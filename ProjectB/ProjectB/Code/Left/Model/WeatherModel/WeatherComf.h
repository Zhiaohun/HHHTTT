//
//  WeatherComf.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherComf : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *brf;
@property (nonatomic, strong) NSString *txt;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
