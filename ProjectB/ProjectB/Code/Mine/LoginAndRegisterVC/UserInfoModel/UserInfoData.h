//
//  UserInfoData.h
//
//  Created by lanou  on 16/9/20
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserInfoData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, strong) NSString *auth;
@property (nonatomic, strong) NSString *coverimg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
