//
//  ReadMotivationBaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReadMotivationBaseClass.h"
#import "ReadMotivationCategories.h"
#import "ReadMotivationPage.h"
#import "ReadMotivationCurrentCat.h"
#import "ReadMotivationParrentCat.h"
#import "ReadMotivationProducts.h"


NSString *const kReadMotivationBaseClassScreening = @"screening";
NSString *const kReadMotivationBaseClassCategories = @"categories";
NSString *const kReadMotivationBaseClassIsFilter = @"is_filter";
NSString *const kReadMotivationBaseClassSortType = @"sort_type";
NSString *const kReadMotivationBaseClassPage = @"page";
NSString *const kReadMotivationBaseClassWaterfall = @"waterfall";
NSString *const kReadMotivationBaseClassWebtemplate = @"webtemplate";
NSString *const kReadMotivationBaseClassClientVersion = @"client_version";
NSString *const kReadMotivationBaseClassCurrentCat = @"current_cat";
NSString *const kReadMotivationBaseClassBanner = @"banner";
NSString *const kReadMotivationBaseClassClientPlatform = @"client_platform";
NSString *const kReadMotivationBaseClassParrentCat = @"parrent_cat";
NSString *const kReadMotivationBaseClassShowQuickfilter = @"show_quickfilter";
NSString *const kReadMotivationBaseClassCmsProducts = @"cms_products";
NSString *const kReadMotivationBaseClassShowcase = @"showcase";
NSString *const kReadMotivationBaseClassPromotions = @"promotions";
NSString *const kReadMotivationBaseClassProducts = @"products";
NSString *const kReadMotivationBaseClassBrands = @"brands";


@interface ReadMotivationBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReadMotivationBaseClass

@synthesize screening = _screening;
@synthesize categories = _categories;
@synthesize isFilter = _isFilter;
@synthesize sortType = _sortType;
@synthesize page = _page;
@synthesize waterfall = _waterfall;
@synthesize webtemplate = _webtemplate;
@synthesize clientVersion = _clientVersion;
@synthesize currentCat = _currentCat;
@synthesize banner = _banner;
@synthesize clientPlatform = _clientPlatform;
@synthesize parrentCat = _parrentCat;
@synthesize showQuickfilter = _showQuickfilter;
@synthesize cmsProducts = _cmsProducts;
@synthesize showcase = _showcase;
@synthesize promotions = _promotions;
@synthesize products = _products;
@synthesize brands = _brands;


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
            self.screening = [self objectOrNilForKey:kReadMotivationBaseClassScreening fromDictionary:dict];
    NSObject *receivedReadMotivationCategories = [dict objectForKey:kReadMotivationBaseClassCategories];
    NSMutableArray *parsedReadMotivationCategories = [NSMutableArray array];
    if ([receivedReadMotivationCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadMotivationCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadMotivationCategories addObject:[ReadMotivationCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadMotivationCategories isKindOfClass:[NSDictionary class]]) {
       [parsedReadMotivationCategories addObject:[ReadMotivationCategories modelObjectWithDictionary:(NSDictionary *)receivedReadMotivationCategories]];
    }

    self.categories = [NSArray arrayWithArray:parsedReadMotivationCategories];
            self.isFilter = [[self objectOrNilForKey:kReadMotivationBaseClassIsFilter fromDictionary:dict] boolValue];
            self.sortType = [self objectOrNilForKey:kReadMotivationBaseClassSortType fromDictionary:dict];
            self.page = [ReadMotivationPage modelObjectWithDictionary:[dict objectForKey:kReadMotivationBaseClassPage]];
            self.waterfall = [[self objectOrNilForKey:kReadMotivationBaseClassWaterfall fromDictionary:dict] doubleValue];
            self.webtemplate = [self objectOrNilForKey:kReadMotivationBaseClassWebtemplate fromDictionary:dict];
            self.clientVersion = [self objectOrNilForKey:kReadMotivationBaseClassClientVersion fromDictionary:dict];
            self.currentCat = [ReadMotivationCurrentCat modelObjectWithDictionary:[dict objectForKey:kReadMotivationBaseClassCurrentCat]];
            self.banner = [self objectOrNilForKey:kReadMotivationBaseClassBanner fromDictionary:dict];
            self.clientPlatform = [self objectOrNilForKey:kReadMotivationBaseClassClientPlatform fromDictionary:dict];
    NSObject *receivedReadMotivationParrentCat = [dict objectForKey:kReadMotivationBaseClassParrentCat];
    NSMutableArray *parsedReadMotivationParrentCat = [NSMutableArray array];
    if ([receivedReadMotivationParrentCat isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadMotivationParrentCat) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadMotivationParrentCat addObject:[ReadMotivationParrentCat modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadMotivationParrentCat isKindOfClass:[NSDictionary class]]) {
       [parsedReadMotivationParrentCat addObject:[ReadMotivationParrentCat modelObjectWithDictionary:(NSDictionary *)receivedReadMotivationParrentCat]];
    }

    self.parrentCat = [NSArray arrayWithArray:parsedReadMotivationParrentCat];
            self.showQuickfilter = [self objectOrNilForKey:kReadMotivationBaseClassShowQuickfilter fromDictionary:dict];
            self.cmsProducts = [self objectOrNilForKey:kReadMotivationBaseClassCmsProducts fromDictionary:dict];
            self.showcase = [self objectOrNilForKey:kReadMotivationBaseClassShowcase fromDictionary:dict];
            self.promotions = [self objectOrNilForKey:kReadMotivationBaseClassPromotions fromDictionary:dict];
    NSObject *receivedReadMotivationProducts = [dict objectForKey:kReadMotivationBaseClassProducts];
    NSMutableArray *parsedReadMotivationProducts = [NSMutableArray array];
    if ([receivedReadMotivationProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReadMotivationProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReadMotivationProducts addObject:[ReadMotivationProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReadMotivationProducts isKindOfClass:[NSDictionary class]]) {
       [parsedReadMotivationProducts addObject:[ReadMotivationProducts modelObjectWithDictionary:(NSDictionary *)receivedReadMotivationProducts]];
    }

    self.products = [NSArray arrayWithArray:parsedReadMotivationProducts];
            self.brands = [self objectOrNilForKey:kReadMotivationBaseClassBrands fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForScreening = [NSMutableArray array];
    for (NSObject *subArrayObject in self.screening) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForScreening addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForScreening addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForScreening] forKey:kReadMotivationBaseClassScreening];
    NSMutableArray *tempArrayForCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.categories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCategories] forKey:kReadMotivationBaseClassCategories];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFilter] forKey:kReadMotivationBaseClassIsFilter];
    NSMutableArray *tempArrayForSortType = [NSMutableArray array];
    for (NSObject *subArrayObject in self.sortType) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSortType addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSortType addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSortType] forKey:kReadMotivationBaseClassSortType];
    [mutableDict setValue:[self.page dictionaryRepresentation] forKey:kReadMotivationBaseClassPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.waterfall] forKey:kReadMotivationBaseClassWaterfall];
    [mutableDict setValue:self.webtemplate forKey:kReadMotivationBaseClassWebtemplate];
    [mutableDict setValue:self.clientVersion forKey:kReadMotivationBaseClassClientVersion];
    [mutableDict setValue:[self.currentCat dictionaryRepresentation] forKey:kReadMotivationBaseClassCurrentCat];
    NSMutableArray *tempArrayForBanner = [NSMutableArray array];
    for (NSObject *subArrayObject in self.banner) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBanner addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBanner addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBanner] forKey:kReadMotivationBaseClassBanner];
    [mutableDict setValue:self.clientPlatform forKey:kReadMotivationBaseClassClientPlatform];
    NSMutableArray *tempArrayForParrentCat = [NSMutableArray array];
    for (NSObject *subArrayObject in self.parrentCat) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForParrentCat addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForParrentCat addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParrentCat] forKey:kReadMotivationBaseClassParrentCat];
    [mutableDict setValue:self.showQuickfilter forKey:kReadMotivationBaseClassShowQuickfilter];
    NSMutableArray *tempArrayForCmsProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cmsProducts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCmsProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCmsProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCmsProducts] forKey:kReadMotivationBaseClassCmsProducts];
    [mutableDict setValue:self.showcase forKey:kReadMotivationBaseClassShowcase];
    NSMutableArray *tempArrayForPromotions = [NSMutableArray array];
    for (NSObject *subArrayObject in self.promotions) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPromotions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPromotions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromotions] forKey:kReadMotivationBaseClassPromotions];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProducts] forKey:kReadMotivationBaseClassProducts];
    [mutableDict setValue:self.brands forKey:kReadMotivationBaseClassBrands];

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

    self.screening = [aDecoder decodeObjectForKey:kReadMotivationBaseClassScreening];
    self.categories = [aDecoder decodeObjectForKey:kReadMotivationBaseClassCategories];
    self.isFilter = [aDecoder decodeBoolForKey:kReadMotivationBaseClassIsFilter];
    self.sortType = [aDecoder decodeObjectForKey:kReadMotivationBaseClassSortType];
    self.page = [aDecoder decodeObjectForKey:kReadMotivationBaseClassPage];
    self.waterfall = [aDecoder decodeDoubleForKey:kReadMotivationBaseClassWaterfall];
    self.webtemplate = [aDecoder decodeObjectForKey:kReadMotivationBaseClassWebtemplate];
    self.clientVersion = [aDecoder decodeObjectForKey:kReadMotivationBaseClassClientVersion];
    self.currentCat = [aDecoder decodeObjectForKey:kReadMotivationBaseClassCurrentCat];
    self.banner = [aDecoder decodeObjectForKey:kReadMotivationBaseClassBanner];
    self.clientPlatform = [aDecoder decodeObjectForKey:kReadMotivationBaseClassClientPlatform];
    self.parrentCat = [aDecoder decodeObjectForKey:kReadMotivationBaseClassParrentCat];
    self.showQuickfilter = [aDecoder decodeObjectForKey:kReadMotivationBaseClassShowQuickfilter];
    self.cmsProducts = [aDecoder decodeObjectForKey:kReadMotivationBaseClassCmsProducts];
    self.showcase = [aDecoder decodeObjectForKey:kReadMotivationBaseClassShowcase];
    self.promotions = [aDecoder decodeObjectForKey:kReadMotivationBaseClassPromotions];
    self.products = [aDecoder decodeObjectForKey:kReadMotivationBaseClassProducts];
    self.brands = [aDecoder decodeObjectForKey:kReadMotivationBaseClassBrands];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_screening forKey:kReadMotivationBaseClassScreening];
    [aCoder encodeObject:_categories forKey:kReadMotivationBaseClassCategories];
    [aCoder encodeBool:_isFilter forKey:kReadMotivationBaseClassIsFilter];
    [aCoder encodeObject:_sortType forKey:kReadMotivationBaseClassSortType];
    [aCoder encodeObject:_page forKey:kReadMotivationBaseClassPage];
    [aCoder encodeDouble:_waterfall forKey:kReadMotivationBaseClassWaterfall];
    [aCoder encodeObject:_webtemplate forKey:kReadMotivationBaseClassWebtemplate];
    [aCoder encodeObject:_clientVersion forKey:kReadMotivationBaseClassClientVersion];
    [aCoder encodeObject:_currentCat forKey:kReadMotivationBaseClassCurrentCat];
    [aCoder encodeObject:_banner forKey:kReadMotivationBaseClassBanner];
    [aCoder encodeObject:_clientPlatform forKey:kReadMotivationBaseClassClientPlatform];
    [aCoder encodeObject:_parrentCat forKey:kReadMotivationBaseClassParrentCat];
    [aCoder encodeObject:_showQuickfilter forKey:kReadMotivationBaseClassShowQuickfilter];
    [aCoder encodeObject:_cmsProducts forKey:kReadMotivationBaseClassCmsProducts];
    [aCoder encodeObject:_showcase forKey:kReadMotivationBaseClassShowcase];
    [aCoder encodeObject:_promotions forKey:kReadMotivationBaseClassPromotions];
    [aCoder encodeObject:_products forKey:kReadMotivationBaseClassProducts];
    [aCoder encodeObject:_brands forKey:kReadMotivationBaseClassBrands];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReadMotivationBaseClass *copy = [[ReadMotivationBaseClass alloc] init];
    
    if (copy) {

        copy.screening = [self.screening copyWithZone:zone];
        copy.categories = [self.categories copyWithZone:zone];
        copy.isFilter = self.isFilter;
        copy.sortType = [self.sortType copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
        copy.waterfall = self.waterfall;
        copy.webtemplate = [self.webtemplate copyWithZone:zone];
        copy.clientVersion = [self.clientVersion copyWithZone:zone];
        copy.currentCat = [self.currentCat copyWithZone:zone];
        copy.banner = [self.banner copyWithZone:zone];
        copy.clientPlatform = [self.clientPlatform copyWithZone:zone];
        copy.parrentCat = [self.parrentCat copyWithZone:zone];
        copy.showQuickfilter = [self.showQuickfilter copyWithZone:zone];
        copy.cmsProducts = [self.cmsProducts copyWithZone:zone];
        copy.showcase = [self.showcase copyWithZone:zone];
        copy.promotions = [self.promotions copyWithZone:zone];
        copy.products = [self.products copyWithZone:zone];
        copy.brands = [self.brands copyWithZone:zone];
    }
    
    return copy;
}


@end
