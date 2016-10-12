//
//  MainTextcardlist.h
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MainOriginbook, MainCreator;

@interface MainTextcardlist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *textcardid;
@property (nonatomic, strong) NSString *ava;
@property (nonatomic, strong) MainOriginbook *originbook;
@property (nonatomic, strong) NSString *commentcnt;
@property (nonatomic, strong) NSString *priv;
@property (nonatomic, strong) NSString *from;
@property (nonatomic, strong) NSString *picpath;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *original;
@property (nonatomic, strong) MainCreator *creator;
@property (nonatomic, strong) NSString *rec;
@property (nonatomic, strong) NSString *collectcnt;
@property (nonatomic, strong) NSString *commercialtag;
@property (nonatomic, strong) NSString *datetime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
