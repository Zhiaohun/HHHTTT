//
//  ReadCommentStars.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadCommentStars : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasHalfStar;
@property (nonatomic, assign) double fullStar;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
