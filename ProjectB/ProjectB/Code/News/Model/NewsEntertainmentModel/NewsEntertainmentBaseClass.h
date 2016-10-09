//
//  NewsEntertainmentBaseClass.h
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NewsEntertainmentBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *t1348648517839;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
