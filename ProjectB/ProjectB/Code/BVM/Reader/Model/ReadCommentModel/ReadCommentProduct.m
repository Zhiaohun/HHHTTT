//
//  ReadCommentProduct.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadCommentProduct.h"


NSString *const kReadCommentProductId = @"id";
NSString *const kReadCommentProductImageUrl = @"image_url";
NSString *const kReadCommentProductName = @"name";
NSString *const kReadCommentProductIsB2c = @"is_b2c";


@interface ReadCommentProduct ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadCommentProduct

@synthesize productIdentifier = _productIdentifier;
@synthesize imageUrl = _imageUrl;
@synthesize name = _name;
@synthesize isB2c = _isB2c;


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
            self.productIdentifier = [self objectOrNilForKey:kReadCommentProductId fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kReadCommentProductImageUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kReadCommentProductName fromDictionary:dict];
            self.isB2c = [[self objectOrNilForKey:kReadCommentProductIsB2c fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.productIdentifier forKey:kReadCommentProductId];
    [mutableDict setValue:self.imageUrl forKey:kReadCommentProductImageUrl];
    [mutableDict setValue:self.name forKey:kReadCommentProductName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isB2c] forKey:kReadCommentProductIsB2c];

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

    self.productIdentifier = [aDecoder decodeObjectForKey:kReadCommentProductId];
    self.imageUrl = [aDecoder decodeObjectForKey:kReadCommentProductImageUrl];
    self.name = [aDecoder decodeObjectForKey:kReadCommentProductName];
    self.isB2c = [aDecoder decodeBoolForKey:kReadCommentProductIsB2c];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_productIdentifier forKey:kReadCommentProductId];
    [aCoder encodeObject:_imageUrl forKey:kReadCommentProductImageUrl];
    [aCoder encodeObject:_name forKey:kReadCommentProductName];
    [aCoder encodeBool:_isB2c forKey:kReadCommentProductIsB2c];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadCommentProduct *copy = [[ReadCommentProduct alloc] init];
    
    if (copy) {

        copy.productIdentifier = [self.productIdentifier copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.isB2c = self.isB2c;
    }
    
    return copy;
}


@end
