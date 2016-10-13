//
//  ReadRankListBaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadRankListBaseClass.h"
#import "ReadRankListPageinfo.h"
#import "ReadRankListProducts.h"


NSString *const kReadRankListBaseClassPageinfo = @"pageinfo";
NSString *const kReadRankListBaseClassProducts = @"products";


@interface ReadRankListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadRankListBaseClass

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
            self.pageinfo = [ReadRankListPageinfo modelObjectWithDictionary:[dict objectForKey:kReadRankListBaseClassPageinfo]];
    NSObject *receivedReadRankListProducts = [dict objectForKey:kReadRankListBaseClassProducts];
    NSMutableArray *parsedReadRankListProducts = [NSMutableArray array];
    if ([receivedReadRankListProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadRankListProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadRankListProducts addObject:[ReadRankListProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadRankListProducts isKindOfClass:[NSDictionary class]]) {
       [parsedReadRankListProducts addObject:[ReadRankListProducts modelObjectWithDictionary:(NSDictionary *)receivedReadRankListProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedReadRankListProducts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pageinfo dictionaryRepresentation] forKey:kReadRankListBaseClassPageinfo];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kReadRankListBaseClassProducts];

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

    self.pageinfo = [aDecoder decodeObjectForKey:kReadRankListBaseClassPageinfo];
    self.products = [aDecoder decodeObjectForKey:kReadRankListBaseClassProducts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageinfo forKey:kReadRankListBaseClassPageinfo];
    [aCoder encodeObject:_products forKey:kReadRankListBaseClassProducts];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadRankListBaseClass *copy = [[ReadRankListBaseClass alloc] init];
    
    if (copy) {

        copy.pageinfo = [self.pageinfo copyWithZone:zone];
        copy.products = [self.products copyWithZone:zone];
    }
    
    return copy;
}


@end
