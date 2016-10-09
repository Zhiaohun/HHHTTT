//
//  NewsTechnologyImgextra.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsTechnologyImgextra.h"


NSString *const kNewsTechnologyImgextraImgsrc = @"imgsrc";


@interface NewsTechnologyImgextra ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsTechnologyImgextra

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
            self.imgsrc = [self objectOrNilForKey:kNewsTechnologyImgextraImgsrc fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgsrc forKey:kNewsTechnologyImgextraImgsrc];

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

    self.imgsrc = [aDecoder decodeObjectForKey:kNewsTechnologyImgextraImgsrc];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgsrc forKey:kNewsTechnologyImgextraImgsrc];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsTechnologyImgextra *copy = [[NewsTechnologyImgextra alloc] init];
    
    if (copy) {

        copy.imgsrc = [self.imgsrc copyWithZone:zone];
    }
    
    return copy;
}


@end
