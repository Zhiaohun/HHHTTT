//
//  MainBaseClass.m
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainBaseClass.h"
#import "MainTextcardlist.h"


NSString *const kMainBaseClassTextcardlist = @"textcardlist";


@interface MainBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainBaseClass

@synthesize textcardlist = _textcardlist;


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
    NSObject *receivedMainTextcardlist = [dict objectForKey:kMainBaseClassTextcardlist];
    NSMutableArray *parsedMainTextcardlist = [NSMutableArray array];
    if ([receivedMainTextcardlist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMainTextcardlist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMainTextcardlist addObject:[MainTextcardlist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMainTextcardlist isKindOfClass:[NSDictionary class]]) {
       [parsedMainTextcardlist addObject:[MainTextcardlist modelObjectWithDictionary:(NSDictionary *)receivedMainTextcardlist]];
    }

    self.textcardlist = [NSArray arrayWithArray:parsedMainTextcardlist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForTextcardlist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.textcardlist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTextcardlist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTextcardlist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextcardlist] forKey:kMainBaseClassTextcardlist];

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

    self.textcardlist = [aDecoder decodeObjectForKey:kMainBaseClassTextcardlist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_textcardlist forKey:kMainBaseClassTextcardlist];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainBaseClass *copy = [[MainBaseClass alloc] init];
    
    if (copy) {

        copy.textcardlist = [self.textcardlist copyWithZone:zone];
    }
    
    return copy;
}


@end
