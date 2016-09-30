//
//  VideoListWebUrl.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VideoListWebUrl : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *raw;
@property (nonatomic, strong) NSString *forWeibo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
