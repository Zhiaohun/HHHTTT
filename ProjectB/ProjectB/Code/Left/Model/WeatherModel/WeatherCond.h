//
//  WeatherCond.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherCond : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *txt;
@property (nonatomic, strong) NSString *txtD;
@property (nonatomic, strong) NSString *codeN;
@property (nonatomic, strong) NSString *codeD;
@property (nonatomic, strong) NSString *txtN;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
