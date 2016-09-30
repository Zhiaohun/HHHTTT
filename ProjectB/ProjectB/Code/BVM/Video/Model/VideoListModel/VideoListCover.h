//
//  VideoListCover.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VideoListCover : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *blurred;
@property (nonatomic, assign) id sharing;
@property (nonatomic, strong) NSString *feed;
@property (nonatomic, strong) NSString *detail;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
