//
//  ReadCommentSummary.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadCommentSummary : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *totalDetestCount;
@property (nonatomic, strong) NSString *totalAutoCount;
@property (nonatomic, strong) NSString *totalScoreCount;
@property (nonatomic, strong) NSString *totalIndifferentCount;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *totalCrazyCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
