//
//  NewsEntertainmentBaseClass.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsEntertainmentBaseClass.h"
#import "NewsEntertainmentT1348648517839.h"


NSString *const kNewsEntertainmentBaseClassT1348648517839 = @"T1348648517839";


@interface NewsEntertainmentBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsEntertainmentBaseClass

@synthesize t1348648517839 = _t1348648517839;


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
    NSObject *receivedNewsEntertainmentT1348648517839 = [dict objectForKey:kNewsEntertainmentBaseClassT1348648517839];
    NSMutableArray *parsedNewsEntertainmentT1348648517839 = [NSMutableArray array];
    if ([receivedNewsEntertainmentT1348648517839 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsEntertainmentT1348648517839) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsEntertainmentT1348648517839 addObject:[NewsEntertainmentT1348648517839 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsEntertainmentT1348648517839 isKindOfClass:[NSDictionary class]]) {
       [parsedNewsEntertainmentT1348648517839 addObject:[NewsEntertainmentT1348648517839 modelObjectWithDictionary:(NSDictionary *)receivedNewsEntertainmentT1348648517839]];
    }

    self.t1348648517839 = [NSArray arrayWithArray:parsedNewsEntertainmentT1348648517839];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForT1348648517839 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.t1348648517839) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForT1348648517839 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForT1348648517839 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForT1348648517839] forKey:kNewsEntertainmentBaseClassT1348648517839];

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

    self.t1348648517839 = [aDecoder decodeObjectForKey:kNewsEntertainmentBaseClassT1348648517839];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_t1348648517839 forKey:kNewsEntertainmentBaseClassT1348648517839];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsEntertainmentBaseClass *copy = [[NewsEntertainmentBaseClass alloc] init];
    
    if (copy) {

        copy.t1348648517839 = [self.t1348648517839 copyWithZone:zone];
    }
    
    return copy;
}


@end
