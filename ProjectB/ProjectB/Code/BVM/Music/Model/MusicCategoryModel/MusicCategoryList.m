//
//  MusicCategoryList.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicCategoryList.h"


NSString *const kMusicCategoryListTitle = @"title";
NSString *const kMusicCategoryListTags = @"tags";
NSString *const kMusicCategoryListDisplayDiscountedPrice = @"displayDiscountedPrice";
NSString *const kMusicCategoryListSerialState = @"serialState";
NSString *const kMusicCategoryListNickname = @"nickname";
NSString *const kMusicCategoryListDisplayPrice = @"displayPrice";
NSString *const kMusicCategoryListCoverMiddle = @"coverMiddle";
NSString *const kMusicCategoryListPlaysCounts = @"playsCounts";
NSString *const kMusicCategoryListIntro = @"intro";
NSString *const kMusicCategoryListIsPaid = @"isPaid";
NSString *const kMusicCategoryListCommentsCount = @"commentsCount";
NSString *const kMusicCategoryListScore = @"score";
NSString *const kMusicCategoryListAlbumId = @"albumId";
NSString *const kMusicCategoryListId = @"id";
NSString *const kMusicCategoryListCoverSmall = @"coverSmall";
NSString *const kMusicCategoryListCoverLarge = @"coverLarge";
NSString *const kMusicCategoryListUid = @"uid";
NSString *const kMusicCategoryListTracks = @"tracks";
NSString *const kMusicCategoryListTrackTitle = @"trackTitle";
NSString *const kMusicCategoryListPriceTypeId = @"priceTypeId";
NSString *const kMusicCategoryListIsFinished = @"isFinished";
NSString *const kMusicCategoryListTrackId = @"trackId";
NSString *const kMusicCategoryListDiscountedPrice = @"discountedPrice";
NSString *const kMusicCategoryListPrice = @"price";
NSString *const kMusicCategoryListAlbumCoverUrl290 = @"albumCoverUrl290";
NSString *const kMusicCategoryListPriceTypeEnum = @"priceTypeEnum";


@interface MusicCategoryList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicCategoryList

@synthesize title = _title;
@synthesize tags = _tags;
@synthesize displayDiscountedPrice = _displayDiscountedPrice;
@synthesize serialState = _serialState;
@synthesize nickname = _nickname;
@synthesize displayPrice = _displayPrice;
@synthesize coverMiddle = _coverMiddle;
@synthesize playsCounts = _playsCounts;
@synthesize intro = _intro;
@synthesize isPaid = _isPaid;
@synthesize commentsCount = _commentsCount;
@synthesize score = _score;
@synthesize albumId = _albumId;
@synthesize listIdentifier = _listIdentifier;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize uid = _uid;
@synthesize tracks = _tracks;
@synthesize trackTitle = _trackTitle;
@synthesize priceTypeId = _priceTypeId;
@synthesize isFinished = _isFinished;
@synthesize trackId = _trackId;
@synthesize discountedPrice = _discountedPrice;
@synthesize price = _price;
@synthesize albumCoverUrl290 = _albumCoverUrl290;
@synthesize priceTypeEnum = _priceTypeEnum;


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
            self.title = [self objectOrNilForKey:kMusicCategoryListTitle fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kMusicCategoryListTags fromDictionary:dict];
            self.displayDiscountedPrice = [self objectOrNilForKey:kMusicCategoryListDisplayDiscountedPrice fromDictionary:dict];
            self.serialState = [[self objectOrNilForKey:kMusicCategoryListSerialState fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kMusicCategoryListNickname fromDictionary:dict];
            self.displayPrice = [self objectOrNilForKey:kMusicCategoryListDisplayPrice fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kMusicCategoryListCoverMiddle fromDictionary:dict];
            self.playsCounts = [[self objectOrNilForKey:kMusicCategoryListPlaysCounts fromDictionary:dict] doubleValue];
            self.intro = [self objectOrNilForKey:kMusicCategoryListIntro fromDictionary:dict];
            self.isPaid = [[self objectOrNilForKey:kMusicCategoryListIsPaid fromDictionary:dict] boolValue];
            self.commentsCount = [[self objectOrNilForKey:kMusicCategoryListCommentsCount fromDictionary:dict] doubleValue];
            self.score = [[self objectOrNilForKey:kMusicCategoryListScore fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kMusicCategoryListAlbumId fromDictionary:dict] doubleValue];
            self.listIdentifier = [[self objectOrNilForKey:kMusicCategoryListId fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kMusicCategoryListCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kMusicCategoryListCoverLarge fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kMusicCategoryListUid fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kMusicCategoryListTracks fromDictionary:dict] doubleValue];
            self.trackTitle = [self objectOrNilForKey:kMusicCategoryListTrackTitle fromDictionary:dict];
            self.priceTypeId = [[self objectOrNilForKey:kMusicCategoryListPriceTypeId fromDictionary:dict] doubleValue];
            self.isFinished = [[self objectOrNilForKey:kMusicCategoryListIsFinished fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kMusicCategoryListTrackId fromDictionary:dict] doubleValue];
            self.discountedPrice = [[self objectOrNilForKey:kMusicCategoryListDiscountedPrice fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kMusicCategoryListPrice fromDictionary:dict] doubleValue];
            self.albumCoverUrl290 = [self objectOrNilForKey:kMusicCategoryListAlbumCoverUrl290 fromDictionary:dict];
            self.priceTypeEnum = [[self objectOrNilForKey:kMusicCategoryListPriceTypeEnum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kMusicCategoryListTitle];
    [mutableDict setValue:self.tags forKey:kMusicCategoryListTags];
    [mutableDict setValue:self.displayDiscountedPrice forKey:kMusicCategoryListDisplayDiscountedPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kMusicCategoryListSerialState];
    [mutableDict setValue:self.nickname forKey:kMusicCategoryListNickname];
    [mutableDict setValue:self.displayPrice forKey:kMusicCategoryListDisplayPrice];
    [mutableDict setValue:self.coverMiddle forKey:kMusicCategoryListCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kMusicCategoryListPlaysCounts];
    [mutableDict setValue:self.intro forKey:kMusicCategoryListIntro];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kMusicCategoryListIsPaid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kMusicCategoryListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kMusicCategoryListScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kMusicCategoryListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kMusicCategoryListId];
    [mutableDict setValue:self.coverSmall forKey:kMusicCategoryListCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kMusicCategoryListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kMusicCategoryListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kMusicCategoryListTracks];
    [mutableDict setValue:self.trackTitle forKey:kMusicCategoryListTrackTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kMusicCategoryListPriceTypeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinished] forKey:kMusicCategoryListIsFinished];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kMusicCategoryListTrackId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discountedPrice] forKey:kMusicCategoryListDiscountedPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kMusicCategoryListPrice];
    [mutableDict setValue:self.albumCoverUrl290 forKey:kMusicCategoryListAlbumCoverUrl290];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeEnum] forKey:kMusicCategoryListPriceTypeEnum];

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

    self.title = [aDecoder decodeObjectForKey:kMusicCategoryListTitle];
    self.tags = [aDecoder decodeObjectForKey:kMusicCategoryListTags];
    self.displayDiscountedPrice = [aDecoder decodeObjectForKey:kMusicCategoryListDisplayDiscountedPrice];
    self.serialState = [aDecoder decodeDoubleForKey:kMusicCategoryListSerialState];
    self.nickname = [aDecoder decodeObjectForKey:kMusicCategoryListNickname];
    self.displayPrice = [aDecoder decodeObjectForKey:kMusicCategoryListDisplayPrice];
    self.coverMiddle = [aDecoder decodeObjectForKey:kMusicCategoryListCoverMiddle];
    self.playsCounts = [aDecoder decodeDoubleForKey:kMusicCategoryListPlaysCounts];
    self.intro = [aDecoder decodeObjectForKey:kMusicCategoryListIntro];
    self.isPaid = [aDecoder decodeBoolForKey:kMusicCategoryListIsPaid];
    self.commentsCount = [aDecoder decodeDoubleForKey:kMusicCategoryListCommentsCount];
    self.score = [aDecoder decodeDoubleForKey:kMusicCategoryListScore];
    self.albumId = [aDecoder decodeDoubleForKey:kMusicCategoryListAlbumId];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kMusicCategoryListId];
    self.coverSmall = [aDecoder decodeObjectForKey:kMusicCategoryListCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kMusicCategoryListCoverLarge];
    self.uid = [aDecoder decodeDoubleForKey:kMusicCategoryListUid];
    self.tracks = [aDecoder decodeDoubleForKey:kMusicCategoryListTracks];
    self.trackTitle = [aDecoder decodeObjectForKey:kMusicCategoryListTrackTitle];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kMusicCategoryListPriceTypeId];
    self.isFinished = [aDecoder decodeDoubleForKey:kMusicCategoryListIsFinished];
    self.trackId = [aDecoder decodeDoubleForKey:kMusicCategoryListTrackId];
    self.discountedPrice = [aDecoder decodeDoubleForKey:kMusicCategoryListDiscountedPrice];
    self.price = [aDecoder decodeDoubleForKey:kMusicCategoryListPrice];
    self.albumCoverUrl290 = [aDecoder decodeObjectForKey:kMusicCategoryListAlbumCoverUrl290];
    self.priceTypeEnum = [aDecoder decodeDoubleForKey:kMusicCategoryListPriceTypeEnum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kMusicCategoryListTitle];
    [aCoder encodeObject:_tags forKey:kMusicCategoryListTags];
    [aCoder encodeObject:_displayDiscountedPrice forKey:kMusicCategoryListDisplayDiscountedPrice];
    [aCoder encodeDouble:_serialState forKey:kMusicCategoryListSerialState];
    [aCoder encodeObject:_nickname forKey:kMusicCategoryListNickname];
    [aCoder encodeObject:_displayPrice forKey:kMusicCategoryListDisplayPrice];
    [aCoder encodeObject:_coverMiddle forKey:kMusicCategoryListCoverMiddle];
    [aCoder encodeDouble:_playsCounts forKey:kMusicCategoryListPlaysCounts];
    [aCoder encodeObject:_intro forKey:kMusicCategoryListIntro];
    [aCoder encodeBool:_isPaid forKey:kMusicCategoryListIsPaid];
    [aCoder encodeDouble:_commentsCount forKey:kMusicCategoryListCommentsCount];
    [aCoder encodeDouble:_score forKey:kMusicCategoryListScore];
    [aCoder encodeDouble:_albumId forKey:kMusicCategoryListAlbumId];
    [aCoder encodeDouble:_listIdentifier forKey:kMusicCategoryListId];
    [aCoder encodeObject:_coverSmall forKey:kMusicCategoryListCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kMusicCategoryListCoverLarge];
    [aCoder encodeDouble:_uid forKey:kMusicCategoryListUid];
    [aCoder encodeDouble:_tracks forKey:kMusicCategoryListTracks];
    [aCoder encodeObject:_trackTitle forKey:kMusicCategoryListTrackTitle];
    [aCoder encodeDouble:_priceTypeId forKey:kMusicCategoryListPriceTypeId];
    [aCoder encodeDouble:_isFinished forKey:kMusicCategoryListIsFinished];
    [aCoder encodeDouble:_trackId forKey:kMusicCategoryListTrackId];
    [aCoder encodeDouble:_discountedPrice forKey:kMusicCategoryListDiscountedPrice];
    [aCoder encodeDouble:_price forKey:kMusicCategoryListPrice];
    [aCoder encodeObject:_albumCoverUrl290 forKey:kMusicCategoryListAlbumCoverUrl290];
    [aCoder encodeDouble:_priceTypeEnum forKey:kMusicCategoryListPriceTypeEnum];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicCategoryList *copy = [[MusicCategoryList alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.displayDiscountedPrice = [self.displayDiscountedPrice copyWithZone:zone];
        copy.serialState = self.serialState;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.displayPrice = [self.displayPrice copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.playsCounts = self.playsCounts;
        copy.intro = [self.intro copyWithZone:zone];
        copy.isPaid = self.isPaid;
        copy.commentsCount = self.commentsCount;
        copy.score = self.score;
        copy.albumId = self.albumId;
        copy.listIdentifier = self.listIdentifier;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.uid = self.uid;
        copy.tracks = self.tracks;
        copy.trackTitle = [self.trackTitle copyWithZone:zone];
        copy.priceTypeId = self.priceTypeId;
        copy.isFinished = self.isFinished;
        copy.trackId = self.trackId;
        copy.discountedPrice = self.discountedPrice;
        copy.price = self.price;
        copy.albumCoverUrl290 = [self.albumCoverUrl290 copyWithZone:zone];
        copy.priceTypeEnum = self.priceTypeEnum;
    }
    
    return copy;
}


@end
