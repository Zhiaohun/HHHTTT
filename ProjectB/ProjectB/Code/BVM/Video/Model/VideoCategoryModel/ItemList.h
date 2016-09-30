//
//  ItemList.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@interface ItemList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) Data *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
