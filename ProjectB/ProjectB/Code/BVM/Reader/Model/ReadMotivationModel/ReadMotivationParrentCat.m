//
//  ReadMotivationParrentCat.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadMotivationParrentCat.h"


NSString *const kReadMotivationParrentCatCatPath = @"CatPath";
NSString *const kReadMotivationParrentCatClassCode = @"ClassCode";
NSString *const kReadMotivationParrentCatName = @"Name";
NSString *const kReadMotivationParrentCatCatID = @"CatID";
NSString *const kReadMotivationParrentCatGuanId = @"guan_id";
NSString *const kReadMotivationParrentCatID = @"ID";


@interface ReadMotivationParrentCat ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadMotivationParrentCat

@synthesize catPath = _catPath;
@synthesize classCode = _classCode;
@synthesize name = _name;
@synthesize catID = _catID;
@synthesize guanId = _guanId;
@synthesize iDProperty = _iDProperty;


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
            self.catPath = [self objectOrNilForKey:kReadMotivationParrentCatCatPath fromDictionary:dict];
            self.classCode = [self objectOrNilForKey:kReadMotivationParrentCatClassCode fromDictionary:dict];
            self.name = [self objectOrNilForKey:kReadMotivationParrentCatName fromDictionary:dict];
            self.catID = [self objectOrNilForKey:kReadMotivationParrentCatCatID fromDictionary:dict];
            self.guanId = [self objectOrNilForKey:kReadMotivationParrentCatGuanId fromDictionary:dict];
            self.iDProperty = [self objectOrNilForKey:kReadMotivationParrentCatID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.catPath forKey:kReadMotivationParrentCatCatPath];
    [mutableDict setValue:self.classCode forKey:kReadMotivationParrentCatClassCode];
    [mutableDict setValue:self.name forKey:kReadMotivationParrentCatName];
    [mutableDict setValue:self.catID forKey:kReadMotivationParrentCatCatID];
    [mutableDict setValue:self.guanId forKey:kReadMotivationParrentCatGuanId];
    [mutableDict setValue:self.iDProperty forKey:kReadMotivationParrentCatID];

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

    self.catPath = [aDecoder decodeObjectForKey:kReadMotivationParrentCatCatPath];
    self.classCode = [aDecoder decodeObjectForKey:kReadMotivationParrentCatClassCode];
    self.name = [aDecoder decodeObjectForKey:kReadMotivationParrentCatName];
    self.catID = [aDecoder decodeObjectForKey:kReadMotivationParrentCatCatID];
    self.guanId = [aDecoder decodeObjectForKey:kReadMotivationParrentCatGuanId];
    self.iDProperty = [aDecoder decodeObjectForKey:kReadMotivationParrentCatID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_catPath forKey:kReadMotivationParrentCatCatPath];
    [aCoder encodeObject:_classCode forKey:kReadMotivationParrentCatClassCode];
    [aCoder encodeObject:_name forKey:kReadMotivationParrentCatName];
    [aCoder encodeObject:_catID forKey:kReadMotivationParrentCatCatID];
    [aCoder encodeObject:_guanId forKey:kReadMotivationParrentCatGuanId];
    [aCoder encodeObject:_iDProperty forKey:kReadMotivationParrentCatID];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadMotivationParrentCat *copy = [[ReadMotivationParrentCat alloc] init];
    
    if (copy) {

        copy.catPath = [self.catPath copyWithZone:zone];
        copy.classCode = [self.classCode copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.catID = [self.catID copyWithZone:zone];
        copy.guanId = [self.guanId copyWithZone:zone];
        copy.iDProperty = [self.iDProperty copyWithZone:zone];
    }
    
    return copy;
}


@end
