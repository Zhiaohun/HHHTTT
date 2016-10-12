//
//  MainCreator.h
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainCreator : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *smallavatar;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *fanscnt;
@property (nonatomic, strong) NSString *largeavatar;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
