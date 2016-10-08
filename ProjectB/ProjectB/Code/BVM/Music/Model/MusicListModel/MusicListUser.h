//
//  MusicListUser.h
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MusicListUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *nickname;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
