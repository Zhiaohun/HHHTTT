//
//  ReadMotivationCurrentCat.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadMotivationCurrentCat.h"


NSString *const kReadMotivationCurrentCatClassCode = @"ClassCode";
NSString *const kReadMotivationCurrentCatCatID = @"CatID";
NSString *const kReadMotivationCurrentCatClassName = @"ClassName";
NSString *const kReadMotivationCurrentCatName = @"Name";
NSString *const kReadMotivationCurrentCatCatPath = @"CatPath";
NSString *const kReadMotivationCurrentCatGuanId = @"guan_id";
NSString *const kReadMotivationCurrentCatID = @"ID";


@interface ReadMotivationCurrentCat ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadMotivationCurrentCat

@synthesize classCode = _classCode;
@synthesize catID = _catID;
@synthesize className = _className;
@synthesize name = _name;
@synthesize catPath = _catPath;
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
            self.classCode = [self objectOrNilForKey:kReadMotivationCurrentCatClassCode fromDictionary:dict];
            self.catID = [self objectOrNilForKey:kReadMotivationCurrentCatCatID fromDictionary:dict];
            self.className = [self objectOrNilForKey:kReadMotivationCurrentCatClassName fromDictionary:dict];
            self.name = [self objectOrNilForKey:kReadMotivationCurrentCatName fromDictionary:dict];
            self.catPath = [self objectOrNilForKey:kReadMotivationCurrentCatCatPath fromDictionary:dict];
            self.guanId = [self objectOrNilForKey:kReadMotivationCurrentCatGuanId fromDictionary:dict];
            self.iDProperty = [self objectOrNilForKey:kReadMotivationCurrentCatID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.classCode forKey:kReadMotivationCurrentCatClassCode];
    [mutableDict setValue:self.catID forKey:kReadMotivationCurrentCatCatID];
    [mutableDict setValue:self.className forKey:kReadMotivationCurrentCatClassName];
    [mutableDict setValue:self.name forKey:kReadMotivationCurrentCatName];
    [mutableDict setValue:self.catPath forKey:kReadMotivationCurrentCatCatPath];
    [mutableDict setValue:self.guanId forKey:kReadMotivationCurrentCatGuanId];
    [mutableDict setValue:self.iDProperty forKey:kReadMotivationCurrentCatID];

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

    self.classCode = [aDecoder decodeObjectForKey:kReadMotivationCurrentCatClassCode];
    self.catID = [aDecoder decodeObjectForKey:kReadMotivationCurrentCatCatID];
    self.className = [aDecoder decodeObjectForKey:kReadMotivationCurrentCatClassName];
    self.name = [aDecoder decodeObjectForKey:kReadMotivationCurrentCatName];
    self.catPath = [aDecoder decodeObjectForKey:kReadMotivationCurrentCatCatPath];
    self.guanId = [aDecoder decodeObjectForKey:kReadMotivationCurrentCatGuanId];
    self.iDProperty = [aDecoder decodeObjectForKey:kReadMotivationCurrentCatID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_classCode forKey:kReadMotivationCurrentCatClassCode];
    [aCoder encodeObject:_catID forKey:kReadMotivationCurrentCatCatID];
    [aCoder encodeObject:_className forKey:kReadMotivationCurrentCatClassName];
    [aCoder encodeObject:_name forKey:kReadMotivationCurrentCatName];
    [aCoder encodeObject:_catPath forKey:kReadMotivationCurrentCatCatPath];
    [aCoder encodeObject:_guanId forKey:kReadMotivationCurrentCatGuanId];
    [aCoder encodeObject:_iDProperty forKey:kReadMotivationCurrentCatID];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadMotivationCurrentCat *copy = [[ReadMotivationCurrentCat alloc] init];
    
    if (copy) {

        copy.classCode = [self.classCode copyWithZone:zone];
        copy.catID = [self.catID copyWithZone:zone];
        copy.className = [self.className copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.catPath = [self.catPath copyWithZone:zone];
        copy.guanId = [self.guanId copyWithZone:zone];
        copy.iDProperty = [self.iDProperty copyWithZone:zone];
    }
    
    return copy;
}


@end
