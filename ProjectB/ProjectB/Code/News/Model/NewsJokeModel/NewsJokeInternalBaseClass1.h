//
//  NewsJokeInternalBaseClass1.h
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NewsJokeInternalBaseClass1 : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double recType;
@property (nonatomic, strong) NSString *replyid;
@property (nonatomic, strong) NSString *pixel;
@property (nonatomic, strong) NSString *digest;
@property (nonatomic, assign) double picCount;
@property (nonatomic, strong) NSString *prompt;
@property (nonatomic, assign) double downTimes;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, assign) double adtype;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *boardid;
@property (nonatomic, assign) double upTimes;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *docid;
@property (nonatomic, assign) double imgType;
@property (nonatomic, strong) NSString *program;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, assign) double clkNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
