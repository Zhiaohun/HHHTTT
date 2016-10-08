//
//  ReadCommentBaseClass.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ReadCommentProduct, ReadCommentPageinfo, ReadCommentSummary;

@interface ReadCommentBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *reviewList;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) ReadCommentProduct *product;
@property (nonatomic, strong) ReadCommentPageinfo *pageinfo;
@property (nonatomic, strong) ReadCommentSummary *summary;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
