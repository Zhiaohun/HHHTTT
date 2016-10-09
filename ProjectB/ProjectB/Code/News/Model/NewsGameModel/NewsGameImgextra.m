//
//  NewsGameImgextra.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsGameImgextra.h"


NSString *const kNewsGameImgextraImgsrc = @"imgsrc";


@interface NewsGameImgextra ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsGameImgextra

@synthesize imgsrc = _imgsrc;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.imgsrc = [self objectOrNilForKey:kNewsGameImgextraImgsrc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgsrc forKey:kNewsGameImgextraImgsrc];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.imgsrc = [aDecoder decodeObjectForKey:kNewsGameImgextraImgsrc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgsrc forKey:kNewsGameImgextraImgsrc];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsGameImgextra *copy = [[NewsGameImgextra alloc] init];
    
    if (copy) {

        copy.imgsrc = [self.imgsrc copyWithZone:zone];
    }
    
    return copy;
}


@end
