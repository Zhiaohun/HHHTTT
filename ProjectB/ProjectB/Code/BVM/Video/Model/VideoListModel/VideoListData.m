//
//  VideoListData.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListData.h"
#import "VideoListAuthor.h"
#import "VideoListPlayInfo.h"
#import "VideoListTags.h"
#import "VideoListCover.h"
#import "VideoListConsumption.h"
#import "VideoListLabel.h"
#import "VideoListProvider.h"
#import "VideoListWebUrl.h"


NSString *const kVideoListDataAuthor = @"author";
NSString *const kVideoListDataDescription = @"description";
NSString *const kVideoListDataReleaseTime = @"releaseTime";
NSString *const kVideoListDataDataType = @"dataType";
NSString *const kVideoListDataTitle = @"title";
NSString *const kVideoListDataWebAdTrack = @"webAdTrack";
NSString *const kVideoListDataPlayInfo = @"playInfo";
NSString *const kVideoListDataTags = @"tags";
NSString *const kVideoListDataDuration = @"duration";
NSString *const kVideoListDataIdx = @"idx";
NSString *const kVideoListDataFavoriteAdTrack = @"favoriteAdTrack";
NSString *const kVideoListDataCollected = @"collected";
NSString *const kVideoListDataCategory = @"category";
NSString *const kVideoListDataCover = @"cover";
NSString *const kVideoListDataConsumption = @"consumption";
NSString *const kVideoListDataType = @"type";
NSString *const kVideoListDataWaterMarks = @"waterMarks";
NSString *const kVideoListDataId = @"id";
NSString *const kVideoListDataDate = @"date";
NSString *const kVideoListDataLabel = @"label";
NSString *const kVideoListDataPlayUrl = @"playUrl";
NSString *const kVideoListDataPromotion = @"promotion";
NSString *const kVideoListDataProvider = @"provider";
NSString *const kVideoListDataAdTrack = @"adTrack";
NSString *const kVideoListDataCampaign = @"campaign";
NSString *const kVideoListDataShareAdTrack = @"shareAdTrack";
NSString *const kVideoListDataWebUrl = @"webUrl";


@interface VideoListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListData

@synthesize author = _author;
@synthesize dataDescription = _dataDescription;
@synthesize releaseTime = _releaseTime;
@synthesize dataType = _dataType;
@synthesize title = _title;
@synthesize webAdTrack = _webAdTrack;
@synthesize playInfo = _playInfo;
@synthesize tags = _tags;
@synthesize duration = _duration;
@synthesize idx = _idx;
@synthesize favoriteAdTrack = _favoriteAdTrack;
@synthesize collected = _collected;
@synthesize category = _category;
@synthesize cover = _cover;
@synthesize consumption = _consumption;
@synthesize type = _type;
@synthesize waterMarks = _waterMarks;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize date = _date;
@synthesize label = _label;
@synthesize playUrl = _playUrl;
@synthesize promotion = _promotion;
@synthesize provider = _provider;
@synthesize adTrack = _adTrack;
@synthesize campaign = _campaign;
@synthesize shareAdTrack = _shareAdTrack;
@synthesize webUrl = _webUrl;


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
            self.author = [VideoListAuthor modelObjectWithDictionary:[dict objectForKey:kVideoListDataAuthor]];
            self.dataDescription = [self objectOrNilForKey:kVideoListDataDescription fromDictionary:dict];
            self.releaseTime = [[self objectOrNilForKey:kVideoListDataReleaseTime fromDictionary:dict] doubleValue];
            self.dataType = [self objectOrNilForKey:kVideoListDataDataType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kVideoListDataTitle fromDictionary:dict];
            self.webAdTrack = [self objectOrNilForKey:kVideoListDataWebAdTrack fromDictionary:dict];
    NSObject *receivedVideoListPlayInfo = [dict objectForKey:kVideoListDataPlayInfo];
    NSMutableArray *parsedVideoListPlayInfo = [NSMutableArray array];
    if ([receivedVideoListPlayInfo isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVideoListPlayInfo) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVideoListPlayInfo addObject:[VideoListPlayInfo modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVideoListPlayInfo isKindOfClass:[NSDictionary class]]) {
       [parsedVideoListPlayInfo addObject:[VideoListPlayInfo modelObjectWithDictionary:(NSDictionary *)receivedVideoListPlayInfo]];
    }

    self.playInfo = [NSArray arrayWithArray:parsedVideoListPlayInfo];
    NSObject *receivedVideoListTags = [dict objectForKey:kVideoListDataTags];
    NSMutableArray *parsedVideoListTags = [NSMutableArray array];
    if ([receivedVideoListTags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVideoListTags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVideoListTags addObject:[VideoListTags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVideoListTags isKindOfClass:[NSDictionary class]]) {
       [parsedVideoListTags addObject:[VideoListTags modelObjectWithDictionary:(NSDictionary *)receivedVideoListTags]];
    }

    self.tags = [NSArray arrayWithArray:parsedVideoListTags];
            self.duration = [[self objectOrNilForKey:kVideoListDataDuration fromDictionary:dict] doubleValue];
            self.idx = [[self objectOrNilForKey:kVideoListDataIdx fromDictionary:dict] doubleValue];
            self.favoriteAdTrack = [self objectOrNilForKey:kVideoListDataFavoriteAdTrack fromDictionary:dict];
            self.collected = [[self objectOrNilForKey:kVideoListDataCollected fromDictionary:dict] boolValue];
            self.category = [self objectOrNilForKey:kVideoListDataCategory fromDictionary:dict];
            self.cover = [VideoListCover modelObjectWithDictionary:[dict objectForKey:kVideoListDataCover]];
            self.consumption = [VideoListConsumption modelObjectWithDictionary:[dict objectForKey:kVideoListDataConsumption]];
            self.type = [self objectOrNilForKey:kVideoListDataType fromDictionary:dict];
            self.waterMarks = [self objectOrNilForKey:kVideoListDataWaterMarks fromDictionary:dict];
            self.dataIdentifier = [[self objectOrNilForKey:kVideoListDataId fromDictionary:dict] doubleValue];
            self.date = [[self objectOrNilForKey:kVideoListDataDate fromDictionary:dict] doubleValue];
            self.label = [VideoListLabel modelObjectWithDictionary:[dict objectForKey:kVideoListDataLabel]];
            self.playUrl = [self objectOrNilForKey:kVideoListDataPlayUrl fromDictionary:dict];
            self.promotion = [self objectOrNilForKey:kVideoListDataPromotion fromDictionary:dict];
            self.provider = [VideoListProvider modelObjectWithDictionary:[dict objectForKey:kVideoListDataProvider]];
            self.adTrack = [self objectOrNilForKey:kVideoListDataAdTrack fromDictionary:dict];
            self.campaign = [self objectOrNilForKey:kVideoListDataCampaign fromDictionary:dict];
            self.shareAdTrack = [self objectOrNilForKey:kVideoListDataShareAdTrack fromDictionary:dict];
            self.webUrl = [VideoListWebUrl modelObjectWithDictionary:[dict objectForKey:kVideoListDataWebUrl]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kVideoListDataAuthor];
    [mutableDict setValue:self.dataDescription forKey:kVideoListDataDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.releaseTime] forKey:kVideoListDataReleaseTime];
    [mutableDict setValue:self.dataType forKey:kVideoListDataDataType];
    [mutableDict setValue:self.title forKey:kVideoListDataTitle];
    [mutableDict setValue:self.webAdTrack forKey:kVideoListDataWebAdTrack];
    NSMutableArray *tempArrayForPlayInfo = [NSMutableArray array];
    for (NSObject *subArrayObject in self.playInfo) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPlayInfo addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPlayInfo addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPlayInfo] forKey:kVideoListDataPlayInfo];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kVideoListDataTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kVideoListDataDuration];
    [mutableDict setValue:[NSNumber numberWithDouble:self.idx] forKey:kVideoListDataIdx];
    [mutableDict setValue:self.favoriteAdTrack forKey:kVideoListDataFavoriteAdTrack];
    [mutableDict setValue:[NSNumber numberWithBool:self.collected] forKey:kVideoListDataCollected];
    [mutableDict setValue:self.category forKey:kVideoListDataCategory];
    [mutableDict setValue:[self.cover dictionaryRepresentation] forKey:kVideoListDataCover];
    [mutableDict setValue:[self.consumption dictionaryRepresentation] forKey:kVideoListDataConsumption];
    [mutableDict setValue:self.type forKey:kVideoListDataType];
    [mutableDict setValue:self.waterMarks forKey:kVideoListDataWaterMarks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kVideoListDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.date] forKey:kVideoListDataDate];
    [mutableDict setValue:[self.label dictionaryRepresentation] forKey:kVideoListDataLabel];
    [mutableDict setValue:self.playUrl forKey:kVideoListDataPlayUrl];
    [mutableDict setValue:self.promotion forKey:kVideoListDataPromotion];
    [mutableDict setValue:[self.provider dictionaryRepresentation] forKey:kVideoListDataProvider];
    [mutableDict setValue:self.adTrack forKey:kVideoListDataAdTrack];
    [mutableDict setValue:self.campaign forKey:kVideoListDataCampaign];
    [mutableDict setValue:self.shareAdTrack forKey:kVideoListDataShareAdTrack];
    [mutableDict setValue:[self.webUrl dictionaryRepresentation] forKey:kVideoListDataWebUrl];

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

    self.author = [aDecoder decodeObjectForKey:kVideoListDataAuthor];
    self.dataDescription = [aDecoder decodeObjectForKey:kVideoListDataDescription];
    self.releaseTime = [aDecoder decodeDoubleForKey:kVideoListDataReleaseTime];
    self.dataType = [aDecoder decodeObjectForKey:kVideoListDataDataType];
    self.title = [aDecoder decodeObjectForKey:kVideoListDataTitle];
    self.webAdTrack = [aDecoder decodeObjectForKey:kVideoListDataWebAdTrack];
    self.playInfo = [aDecoder decodeObjectForKey:kVideoListDataPlayInfo];
    self.tags = [aDecoder decodeObjectForKey:kVideoListDataTags];
    self.duration = [aDecoder decodeDoubleForKey:kVideoListDataDuration];
    self.idx = [aDecoder decodeDoubleForKey:kVideoListDataIdx];
    self.favoriteAdTrack = [aDecoder decodeObjectForKey:kVideoListDataFavoriteAdTrack];
    self.collected = [aDecoder decodeBoolForKey:kVideoListDataCollected];
    self.category = [aDecoder decodeObjectForKey:kVideoListDataCategory];
    self.cover = [aDecoder decodeObjectForKey:kVideoListDataCover];
    self.consumption = [aDecoder decodeObjectForKey:kVideoListDataConsumption];
    self.type = [aDecoder decodeObjectForKey:kVideoListDataType];
    self.waterMarks = [aDecoder decodeObjectForKey:kVideoListDataWaterMarks];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kVideoListDataId];
    self.date = [aDecoder decodeDoubleForKey:kVideoListDataDate];
    self.label = [aDecoder decodeObjectForKey:kVideoListDataLabel];
    self.playUrl = [aDecoder decodeObjectForKey:kVideoListDataPlayUrl];
    self.promotion = [aDecoder decodeObjectForKey:kVideoListDataPromotion];
    self.provider = [aDecoder decodeObjectForKey:kVideoListDataProvider];
    self.adTrack = [aDecoder decodeObjectForKey:kVideoListDataAdTrack];
    self.campaign = [aDecoder decodeObjectForKey:kVideoListDataCampaign];
    self.shareAdTrack = [aDecoder decodeObjectForKey:kVideoListDataShareAdTrack];
    self.webUrl = [aDecoder decodeObjectForKey:kVideoListDataWebUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_author forKey:kVideoListDataAuthor];
    [aCoder encodeObject:_dataDescription forKey:kVideoListDataDescription];
    [aCoder encodeDouble:_releaseTime forKey:kVideoListDataReleaseTime];
    [aCoder encodeObject:_dataType forKey:kVideoListDataDataType];
    [aCoder encodeObject:_title forKey:kVideoListDataTitle];
    [aCoder encodeObject:_webAdTrack forKey:kVideoListDataWebAdTrack];
    [aCoder encodeObject:_playInfo forKey:kVideoListDataPlayInfo];
    [aCoder encodeObject:_tags forKey:kVideoListDataTags];
    [aCoder encodeDouble:_duration forKey:kVideoListDataDuration];
    [aCoder encodeDouble:_idx forKey:kVideoListDataIdx];
    [aCoder encodeObject:_favoriteAdTrack forKey:kVideoListDataFavoriteAdTrack];
    [aCoder encodeBool:_collected forKey:kVideoListDataCollected];
    [aCoder encodeObject:_category forKey:kVideoListDataCategory];
    [aCoder encodeObject:_cover forKey:kVideoListDataCover];
    [aCoder encodeObject:_consumption forKey:kVideoListDataConsumption];
    [aCoder encodeObject:_type forKey:kVideoListDataType];
    [aCoder encodeObject:_waterMarks forKey:kVideoListDataWaterMarks];
    [aCoder encodeDouble:_dataIdentifier forKey:kVideoListDataId];
    [aCoder encodeDouble:_date forKey:kVideoListDataDate];
    [aCoder encodeObject:_label forKey:kVideoListDataLabel];
    [aCoder encodeObject:_playUrl forKey:kVideoListDataPlayUrl];
    [aCoder encodeObject:_promotion forKey:kVideoListDataPromotion];
    [aCoder encodeObject:_provider forKey:kVideoListDataProvider];
    [aCoder encodeObject:_adTrack forKey:kVideoListDataAdTrack];
    [aCoder encodeObject:_campaign forKey:kVideoListDataCampaign];
    [aCoder encodeObject:_shareAdTrack forKey:kVideoListDataShareAdTrack];
    [aCoder encodeObject:_webUrl forKey:kVideoListDataWebUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListData *copy = [[VideoListData alloc] init];
    
    if (copy) {

        copy.author = [self.author copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.releaseTime = self.releaseTime;
        copy.dataType = [self.dataType copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.webAdTrack = [self.webAdTrack copyWithZone:zone];
        copy.playInfo = [self.playInfo copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.duration = self.duration;
        copy.idx = self.idx;
        copy.favoriteAdTrack = [self.favoriteAdTrack copyWithZone:zone];
        copy.collected = self.collected;
        copy.category = [self.category copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.consumption = [self.consumption copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.waterMarks = [self.waterMarks copyWithZone:zone];
        copy.dataIdentifier = self.dataIdentifier;
        copy.date = self.date;
        copy.label = [self.label copyWithZone:zone];
        copy.playUrl = [self.playUrl copyWithZone:zone];
        copy.promotion = [self.promotion copyWithZone:zone];
        copy.provider = [self.provider copyWithZone:zone];
        copy.adTrack = [self.adTrack copyWithZone:zone];
        copy.campaign = [self.campaign copyWithZone:zone];
        copy.shareAdTrack = [self.shareAdTrack copyWithZone:zone];
        copy.webUrl = [self.webUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
