//
//  NewsGameBaseClass.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsGameBaseClass.h"
#import "NewsGameT1348654151579.h"


NSString *const kNewsGameBaseClassT1348654151579 = @"T1348654151579";


@interface NewsGameBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsGameBaseClass

@synthesize t1348654151579 = _t1348654151579;


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
    NSObject *receivedNewsGameT1348654151579 = [dict objectForKey:kNewsGameBaseClassT1348654151579];
    NSMutableArray *parsedNewsGameT1348654151579 = [NSMutableArray array];
    if ([receivedNewsGameT1348654151579 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsGameT1348654151579) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsGameT1348654151579 addObject:[NewsGameT1348654151579 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsGameT1348654151579 isKindOfClass:[NSDictionary class]]) {
       [parsedNewsGameT1348654151579 addObject:[NewsGameT1348654151579 modelObjectWithDictionary:(NSDictionary *)receivedNewsGameT1348654151579]];
    }

    self.t1348654151579 = [NSArray arrayWithArray:parsedNewsGameT1348654151579];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForT1348654151579 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.t1348654151579) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForT1348654151579 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForT1348654151579 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForT1348654151579] forKey:kNewsGameBaseClassT1348654151579];

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

    self.t1348654151579 = [aDecoder decodeObjectForKey:kNewsGameBaseClassT1348654151579];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_t1348654151579 forKey:kNewsGameBaseClassT1348654151579];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsGameBaseClass *copy = [[NewsGameBaseClass alloc] init];
    
    if (copy) {

        copy.t1348654151579 = [self.t1348654151579 copyWithZone:zone];
    }
    
    return copy;
}


@end
