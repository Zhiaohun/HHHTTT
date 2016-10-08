//
//  ReadMotivationPage.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadMotivationPage : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *total;
@property (nonatomic, assign) double pagecount;
@property (nonatomic, strong) NSString *pagesize;
@property (nonatomic, strong) NSString *pageindex;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
