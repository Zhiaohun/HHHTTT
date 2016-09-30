//
//  VideoListLabel.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListLabel.h"


NSString *const kVideoListLabelText = @"text";


@interface VideoListLabel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListLabel

@synthesize text = _text;


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
            self.text = [self objectOrNilForKey:kVideoListLabelText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.text forKey:kVideoListLabelText];

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

    self.text = [aDecoder decodeObjectForKey:kVideoListLabelText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_text forKey:kVideoListLabelText];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListLabel *copy = [[VideoListLabel alloc] init];
    
    if (copy) {

        copy.text = [self.text copyWithZone:zone];
    }
    
    return copy;
}


@end
