//
//  ReadHotPrice.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReadHotPrice : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dangdangPrice;
@property (nonatomic, strong) NSString *promotionPrice;
@property (nonatomic, strong) NSString *originalPrice;
@property (nonatomic, strong) NSString *exclusivePrice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
