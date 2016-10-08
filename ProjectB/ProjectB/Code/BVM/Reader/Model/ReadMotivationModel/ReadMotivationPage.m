//
//  ReadMotivationPage.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadMotivationPage.h"


NSString *const kReadMotivationPageTotal = @"total";
NSString *const kReadMotivationPagePagecount = @"pagecount";
NSString *const kReadMotivationPagePagesize = @"pagesize";
NSString *const kReadMotivationPagePageindex = @"pageindex";


@interface ReadMotivationPage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadMotivationPage

@synthesize total = _total;
@synthesize pagecount = _pagecount;
@synthesize pagesize = _pagesize;
@synthesize pageindex = _pageindex;


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
            self.total = [self objectOrNilForKey:kReadMotivationPageTotal fromDictionary:dict];
            self.pagecount = [[self objectOrNilForKey:kReadMotivationPagePagecount fromDictionary:dict] doubleValue];
            self.pagesize = [self objectOrNilForKey:kReadMotivationPagePagesize fromDictionary:dict];
            self.pageindex = [self objectOrNilForKey:kReadMotivationPagePageindex fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.total forKey:kReadMotivationPageTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pagecount] forKey:kReadMotivationPagePagecount];
    [mutableDict setValue:self.pagesize forKey:kReadMotivationPagePagesize];
    [mutableDict setValue:self.pageindex forKey:kReadMotivationPagePageindex];

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

    self.total = [aDecoder decodeObjectForKey:kReadMotivationPageTotal];
    self.pagecount = [aDecoder decodeDoubleForKey:kReadMotivationPagePagecount];
    self.pagesize = [aDecoder decodeObjectForKey:kReadMotivationPagePagesize];
    self.pageindex = [aDecoder decodeObjectForKey:kReadMotivationPagePageindex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_total forKey:kReadMotivationPageTotal];
    [aCoder encodeDouble:_pagecount forKey:kReadMotivationPagePagecount];
    [aCoder encodeObject:_pagesize forKey:kReadMotivationPagePagesize];
    [aCoder encodeObject:_pageindex forKey:kReadMotivationPagePageindex];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadMotivationPage *copy = [[ReadMotivationPage alloc] init];
    
    if (copy) {

        copy.total = [self.total copyWithZone:zone];
        copy.pagecount = self.pagecount;
        copy.pagesize = [self.pagesize copyWithZone:zone];
        copy.pageindex = [self.pageindex copyWithZone:zone];
    }
    
    return copy;
}


@end
