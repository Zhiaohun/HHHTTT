//
//  NewsConcentrationBaseClass.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsConcentrationBaseClass.h"
#import "NewsConcentrationT1467284926140.h"


NSString *const kNewsConcentrationBaseClassT1467284926140 = @"T1467284926140";


@interface NewsConcentrationBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsConcentrationBaseClass

@synthesize t1467284926140 = _t1467284926140;


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
    NSObject *receivedNewsConcentrationT1467284926140 = [dict objectForKey:kNewsConcentrationBaseClassT1467284926140];
    NSMutableArray *parsedNewsConcentrationT1467284926140 = [NSMutableArray array];
    if ([receivedNewsConcentrationT1467284926140 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsConcentrationT1467284926140) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsConcentrationT1467284926140 addObject:[NewsConcentrationT1467284926140 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsConcentrationT1467284926140 isKindOfClass:[NSDictionary class]]) {
       [parsedNewsConcentrationT1467284926140 addObject:[NewsConcentrationT1467284926140 modelObjectWithDictionary:(NSDictionary *)receivedNewsConcentrationT1467284926140]];
    }

    self.t1467284926140 = [NSArray arrayWithArray:parsedNewsConcentrationT1467284926140];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForT1467284926140 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.t1467284926140) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForT1467284926140 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForT1467284926140 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForT1467284926140] forKey:kNewsConcentrationBaseClassT1467284926140];

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

    self.t1467284926140 = [aDecoder decodeObjectForKey:kNewsConcentrationBaseClassT1467284926140];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_t1467284926140 forKey:kNewsConcentrationBaseClassT1467284926140];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsConcentrationBaseClass *copy = [[NewsConcentrationBaseClass alloc] init];
    
    if (copy) {

        copy.t1467284926140 = [self.t1467284926140 copyWithZone:zone];
    }
    
    return copy;
}


@end
