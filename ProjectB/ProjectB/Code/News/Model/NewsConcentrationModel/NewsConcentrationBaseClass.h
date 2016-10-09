//
//  NewsConcentrationBaseClass.h
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NewsConcentrationBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *t1467284926140;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
