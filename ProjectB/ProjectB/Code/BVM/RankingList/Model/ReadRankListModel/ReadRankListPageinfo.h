//
//  ReadRankListPageinfo.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadRankListPageinfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double endProperty;
@property (nonatomic, assign) double prev;
@property (nonatomic, assign) double start;
@property (nonatomic, assign) double next;
@property (nonatomic, strong) NSString *pagesize;
@property (nonatomic, assign) double total;
@property (nonatomic, strong) NSString *page;
@property (nonatomic, assign) double pageCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
