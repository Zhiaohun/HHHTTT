//
//  ReadMotivationCategories.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadMotivationCategories.h"


NSString *const kReadMotivationCategoriesCatPath = @"CatPath";
NSString *const kReadMotivationCategoriesID = @"ID";
NSString *const kReadMotivationCategoriesName = @"Name";
NSString *const kReadMotivationCategoriesCatID = @"CatID";
NSString *const kReadMotivationCategoriesCount = @"Count";


@interface ReadMotivationCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadMotivationCategories

@synthesize catPath = _catPath;
@synthesize iDProperty = _iDProperty;
@synthesize name = _name;
@synthesize catID = _catID;
@synthesize count = _count;


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
            self.catPath = [self objectOrNilForKey:kReadMotivationCategoriesCatPath fromDictionary:dict];
            self.iDProperty = [self objectOrNilForKey:kReadMotivationCategoriesID fromDictionary:dict];
            self.name = [self objectOrNilForKey:kReadMotivationCategoriesName fromDictionary:dict];
            self.catID = [self objectOrNilForKey:kReadMotivationCategoriesCatID fromDictionary:dict];
            self.count = [self objectOrNilForKey:kReadMotivationCategoriesCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.catPath forKey:kReadMotivationCategoriesCatPath];
    [mutableDict setValue:self.iDProperty forKey:kReadMotivationCategoriesID];
    [mutableDict setValue:self.name forKey:kReadMotivationCategoriesName];
    [mutableDict setValue:self.catID forKey:kReadMotivationCategoriesCatID];
    [mutableDict setValue:self.count forKey:kReadMotivationCategoriesCount];

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

    self.catPath = [aDecoder decodeObjectForKey:kReadMotivationCategoriesCatPath];
    self.iDProperty = [aDecoder decodeObjectForKey:kReadMotivationCategoriesID];
    self.name = [aDecoder decodeObjectForKey:kReadMotivationCategoriesName];
    self.catID = [aDecoder decodeObjectForKey:kReadMotivationCategoriesCatID];
    self.count = [aDecoder decodeObjectForKey:kReadMotivationCategoriesCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_catPath forKey:kReadMotivationCategoriesCatPath];
    [aCoder encodeObject:_iDProperty forKey:kReadMotivationCategoriesID];
    [aCoder encodeObject:_name forKey:kReadMotivationCategoriesName];
    [aCoder encodeObject:_catID forKey:kReadMotivationCategoriesCatID];
    [aCoder encodeObject:_count forKey:kReadMotivationCategoriesCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadMotivationCategories *copy = [[ReadMotivationCategories alloc] init];
    
    if (copy) {

        copy.catPath = [self.catPath copyWithZone:zone];
        copy.iDProperty = [self.iDProperty copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.catID = [self.catID copyWithZone:zone];
        copy.count = [self.count copyWithZone:zone];
    }
    
    return copy;
}


@end
