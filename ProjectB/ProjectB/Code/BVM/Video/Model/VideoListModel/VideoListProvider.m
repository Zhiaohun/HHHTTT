//
//  VideoListProvider.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListProvider.h"


NSString *const kVideoListProviderName = @"name";
NSString *const kVideoListProviderAlias = @"alias";
NSString *const kVideoListProviderIcon = @"icon";


@interface VideoListProvider ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListProvider

@synthesize name = _name;
@synthesize alias = _alias;
@synthesize icon = _icon;


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
            self.name = [self objectOrNilForKey:kVideoListProviderName fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kVideoListProviderAlias fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kVideoListProviderIcon fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kVideoListProviderName];
    [mutableDict setValue:self.alias forKey:kVideoListProviderAlias];
    [mutableDict setValue:self.icon forKey:kVideoListProviderIcon];

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

    self.name = [aDecoder decodeObjectForKey:kVideoListProviderName];
    self.alias = [aDecoder decodeObjectForKey:kVideoListProviderAlias];
    self.icon = [aDecoder decodeObjectForKey:kVideoListProviderIcon];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kVideoListProviderName];
    [aCoder encodeObject:_alias forKey:kVideoListProviderAlias];
    [aCoder encodeObject:_icon forKey:kVideoListProviderIcon];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListProvider *copy = [[VideoListProvider alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
    }
    
    return copy;
}


@end
