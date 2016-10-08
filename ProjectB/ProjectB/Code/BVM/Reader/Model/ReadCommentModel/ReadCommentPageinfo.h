//
//  ReadCommentPageinfo.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadCommentPageinfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double endProperty;
@property (nonatomic, assign) double start;
@property (nonatomic, assign) double next;
@property (nonatomic, strong) NSString *pagesize;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, assign) double page;
@property (nonatomic, assign) double pageCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
