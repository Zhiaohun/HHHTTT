//
//  ReadRankListBaseClass.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReadRankListPageinfo;

@interface ReadRankListBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ReadRankListPageinfo *pageinfo;
@property (nonatomic, strong) NSArray *products;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
