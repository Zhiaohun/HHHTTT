//
//  ReadHotBaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadHotBaseClass.h"
#import "ReadHotPageinfo.h"
#import "ReadHotProducts.h"


NSString *const kReadHotBaseClassPageinfo = @"pageinfo";
NSString *const kReadHotBaseClassProducts = @"products";


@interface ReadHotBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadHotBaseClass

@synthesize pageinfo = _pageinfo;
@synthesize products = _products;


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
            self.pageinfo = [ReadHotPageinfo modelObjectWithDictionary:[dict objectForKey:kReadHotBaseClassPageinfo]];
    NSObject *receivedReadHotProducts = [dict objectForKey:kReadHotBaseClassProducts];
    NSMutableArray *parsedReadHotProducts = [NSMutableArray array];
    if ([receivedReadHotProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadHotProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadHotProducts addObject:[ReadHotProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadHotProducts isKindOfClass:[NSDictionary class]]) {
       [parsedReadHotProducts addObject:[ReadHotProducts modelObjectWithDictionary:(NSDictionary *)receivedReadHotProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedReadHotProducts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageinfo dictionaryRepresentation] forKey:kReadHotBaseClassPageinfo];
    NSMutableArray *tempArrayForProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.products) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kReadHotBaseClassProducts];

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

    self.pageinfo = [aDecoder decodeObjectForKey:kReadHotBaseClassPageinfo];
    self.products = [aDecoder decodeObjectForKey:kReadHotBaseClassProducts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageinfo forKey:kReadHotBaseClassPageinfo];
    [aCoder encodeObject:_products forKey:kReadHotBaseClassProducts];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadHotBaseClass *copy = [[ReadHotBaseClass alloc] init];
    
    if (copy) {

        copy.pageinfo = [self.pageinfo copyWithZone:zone];
        copy.products = [self.products copyWithZone:zone];
    }
    
    return copy;
}


@end
