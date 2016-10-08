//
//  MusicCategoryBaseClass.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicCategoryBaseClass.h"
#import "MusicCategoryList.h"


NSString *const kMusicCategoryBaseClassPageSize = @"pageSize";
NSString *const kMusicCategoryBaseClassPageId = @"pageId";
NSString *const kMusicCategoryBaseClassTotalCount = @"totalCount";
NSString *const kMusicCategoryBaseClassMaxPageId = @"maxPageId";
NSString *const kMusicCategoryBaseClassMsg = @"msg";
NSString *const kMusicCategoryBaseClassList = @"list";
NSString *const kMusicCategoryBaseClassRet = @"ret";


@interface MusicCategoryBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicCategoryBaseClass

@synthesize pageSize = _pageSize;
@synthesize pageId = _pageId;
@synthesize totalCount = _totalCount;
@synthesize maxPageId = _maxPageId;
@synthesize msg = _msg;
@synthesize list = _list;
@synthesize ret = _ret;


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
            self.pageSize = [[self objectOrNilForKey:kMusicCategoryBaseClassPageSize fromDictionary:dict] doubleValue];
            self.pageId = [[self objectOrNilForKey:kMusicCategoryBaseClassPageId fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kMusicCategoryBaseClassTotalCount fromDictionary:dict] doubleValue];
            self.maxPageId = [[self objectOrNilForKey:kMusicCategoryBaseClassMaxPageId fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kMusicCategoryBaseClassMsg fromDictionary:dict];
    NSObject *receivedMusicCategoryList = [dict objectForKey:kMusicCategoryBaseClassList];
    NSMutableArray *parsedMusicCategoryList = [NSMutableArray array];
    if ([receivedMusicCategoryList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMusicCategoryList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMusicCategoryList addObject:[MusicCategoryList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMusicCategoryList isKindOfClass:[NSDictionary class]]) {
       [parsedMusicCategoryList addObject:[MusicCategoryList modelObjectWithDictionary:(NSDictionary *)receivedMusicCategoryList]];
    }

    self.list = [NSArray arrayWithArray:parsedMusicCategoryList];
            self.ret = [[self objectOrNilForKey:kMusicCategoryBaseClassRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kMusicCategoryBaseClassPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kMusicCategoryBaseClassPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kMusicCategoryBaseClassTotalCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kMusicCategoryBaseClassMaxPageId];
    [mutableDict setValue:self.msg forKey:kMusicCategoryBaseClassMsg];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kMusicCategoryBaseClassList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kMusicCategoryBaseClassRet];

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

    self.pageSize = [aDecoder decodeDoubleForKey:kMusicCategoryBaseClassPageSize];
    self.pageId = [aDecoder decodeDoubleForKey:kMusicCategoryBaseClassPageId];
    self.totalCount = [aDecoder decodeDoubleForKey:kMusicCategoryBaseClassTotalCount];
    self.maxPageId = [aDecoder decodeDoubleForKey:kMusicCategoryBaseClassMaxPageId];
    self.msg = [aDecoder decodeObjectForKey:kMusicCategoryBaseClassMsg];
    self.list = [aDecoder decodeObjectForKey:kMusicCategoryBaseClassList];
    self.ret = [aDecoder decodeDoubleForKey:kMusicCategoryBaseClassRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageSize forKey:kMusicCategoryBaseClassPageSize];
    [aCoder encodeDouble:_pageId forKey:kMusicCategoryBaseClassPageId];
    [aCoder encodeDouble:_totalCount forKey:kMusicCategoryBaseClassTotalCount];
    [aCoder encodeDouble:_maxPageId forKey:kMusicCategoryBaseClassMaxPageId];
    [aCoder encodeObject:_msg forKey:kMusicCategoryBaseClassMsg];
    [aCoder encodeObject:_list forKey:kMusicCategoryBaseClassList];
    [aCoder encodeDouble:_ret forKey:kMusicCategoryBaseClassRet];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicCategoryBaseClass *copy = [[MusicCategoryBaseClass alloc] init];
    
    if (copy) {

        copy.pageSize = self.pageSize;
        copy.pageId = self.pageId;
        copy.totalCount = self.totalCount;
        copy.maxPageId = self.maxPageId;
        copy.msg = [self.msg copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
