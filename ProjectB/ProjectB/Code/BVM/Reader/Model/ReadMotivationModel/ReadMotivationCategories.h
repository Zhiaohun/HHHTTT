//
//  ReadMotivationCategories.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadMotivationCategories : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *catPath;
@property (nonatomic, strong) NSString *iDProperty;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *catID;
@property (nonatomic, strong) NSString *count;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
