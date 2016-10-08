//
//  ReadMotivationCurrentCat.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadMotivationCurrentCat : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *classCode;
@property (nonatomic, strong) NSString *catID;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *catPath;
@property (nonatomic, strong) NSString *guanId;
@property (nonatomic, strong) NSString *iDProperty;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
