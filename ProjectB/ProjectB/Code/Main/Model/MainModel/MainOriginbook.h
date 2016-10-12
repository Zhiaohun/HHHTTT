//
//  MainOriginbook.h
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainOriginbook : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cardcnt;
@property (nonatomic, strong) NSString *picpath;
@property (nonatomic, strong) NSString *ava;
@property (nonatomic, strong) NSString *bookname;
@property (nonatomic, strong) NSString *bookid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
