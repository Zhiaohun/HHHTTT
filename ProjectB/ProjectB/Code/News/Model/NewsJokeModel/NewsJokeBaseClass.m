//
//  NewsJokeBaseClass.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsJokeBaseClass.h"
#import "NewsJokeInternalBaseClass1.h"


NSString *const kNewsJokeBaseClass = @"段子";


@interface NewsJokeBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsJokeBaseClass

@synthesize myProperty1 = _myProperty1;


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
    NSObject *receivedNewsJokeInternalBaseClass1 = [dict objectForKey:kNewsJokeBaseClass];
    NSMutableArray *parsedNewsJokeInternalBaseClass1 = [NSMutableArray array];
    if ([receivedNewsJokeInternalBaseClass1 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsJokeInternalBaseClass1) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsJokeInternalBaseClass1 addObject:[NewsJokeInternalBaseClass1 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsJokeInternalBaseClass1 isKindOfClass:[NSDictionary class]]) {
       [parsedNewsJokeInternalBaseClass1 addObject:[NewsJokeInternalBaseClass1 modelObjectWithDictionary:(NSDictionary *)receivedNewsJokeInternalBaseClass1]];
    }

    self.myProperty1 = [NSArray arrayWithArray:parsedNewsJokeInternalBaseClass1];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForMyProperty1 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.myProperty1) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMyProperty1 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMyProperty1 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMyProperty1] forKey:kNewsJokeBaseClass];

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

    self.myProperty1 = [aDecoder decodeObjectForKey:kNewsJokeBaseClass];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_myProperty1 forKey:kNewsJokeBaseClass];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsJokeBaseClass *copy = [[NewsJokeBaseClass alloc] init];
    
    if (copy) {

        copy.myProperty1 = [self.myProperty1 copyWithZone:zone];
    }
    
    return copy;
}


@end
