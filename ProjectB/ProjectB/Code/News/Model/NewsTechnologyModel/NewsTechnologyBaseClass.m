//
//  NewsTechnologyBaseClass.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsTechnologyBaseClass.h"
#import "NewsTechnologyT1348649580692.h"


NSString *const kNewsTechnologyBaseClassT1348649580692 = @"T1348649580692";


@interface NewsTechnologyBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsTechnologyBaseClass

@synthesize t1348649580692 = _t1348649580692;


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
    NSObject *receivedNewsTechnologyT1348649580692 = [dict objectForKey:kNewsTechnologyBaseClassT1348649580692];
    NSMutableArray *parsedNewsTechnologyT1348649580692 = [NSMutableArray array];
    if ([receivedNewsTechnologyT1348649580692 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsTechnologyT1348649580692) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsTechnologyT1348649580692 addObject:[NewsTechnologyT1348649580692 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsTechnologyT1348649580692 isKindOfClass:[NSDictionary class]]) {
       [parsedNewsTechnologyT1348649580692 addObject:[NewsTechnologyT1348649580692 modelObjectWithDictionary:(NSDictionary *)receivedNewsTechnologyT1348649580692]];
    }

    self.t1348649580692 = [NSArray arrayWithArray:parsedNewsTechnologyT1348649580692];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForT1348649580692 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.t1348649580692) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForT1348649580692 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForT1348649580692 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForT1348649580692] forKey:kNewsTechnologyBaseClassT1348649580692];

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

    self.t1348649580692 = [aDecoder decodeObjectForKey:kNewsTechnologyBaseClassT1348649580692];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_t1348649580692 forKey:kNewsTechnologyBaseClassT1348649580692];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsTechnologyBaseClass *copy = [[NewsTechnologyBaseClass alloc] init];
    
    if (copy) {

        copy.t1348649580692 = [self.t1348649580692 copyWithZone:zone];
    }
    
    return copy;
}


@end
