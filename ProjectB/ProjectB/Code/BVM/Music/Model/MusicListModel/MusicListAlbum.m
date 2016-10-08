//
//  MusicListAlbum.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicListAlbum.h"


NSString *const kMusicListAlbumStatus = @"status";
NSString *const kMusicListAlbumTitle = @"title";
NSString *const kMusicListAlbumTags = @"tags";
NSString *const kMusicListAlbumSerialState = @"serialState";
NSString *const kMusicListAlbumCategoryName = @"categoryName";
NSString *const kMusicListAlbumCoverWebLarge = @"coverWebLarge";
NSString *const kMusicListAlbumCoverMiddle = @"coverMiddle";
NSString *const kMusicListAlbumHasNew = @"hasNew";
NSString *const kMusicListAlbumIsPaid = @"isPaid";
NSString *const kMusicListAlbumIntro = @"intro";
NSString *const kMusicListAlbumNickname = @"nickname";
NSString *const kMusicListAlbumIsVerified = @"isVerified";
NSString *const kMusicListAlbumIsRecordDesc = @"isRecordDesc";
NSString *const kMusicListAlbumShares = @"shares";
NSString *const kMusicListAlbumAvatarPath = @"avatarPath";
NSString *const kMusicListAlbumCreatedAt = @"createdAt";
NSString *const kMusicListAlbumLastUptrackAt = @"lastUptrackAt";
NSString *const kMusicListAlbumUpdatedAt = @"updatedAt";
NSString *const kMusicListAlbumAlbumId = @"albumId";
NSString *const kMusicListAlbumDetailCoverPath = @"detailCoverPath";
NSString *const kMusicListAlbumCoverSmall = @"coverSmall";
NSString *const kMusicListAlbumCoverLarge = @"coverLarge";
NSString *const kMusicListAlbumCoverOrigin = @"coverOrigin";
NSString *const kMusicListAlbumUid = @"uid";
NSString *const kMusicListAlbumIntroRich = @"introRich";
NSString *const kMusicListAlbumTracks = @"tracks";
NSString *const kMusicListAlbumPlayTrackId = @"playTrackId";
NSString *const kMusicListAlbumIsFavorite = @"isFavorite";
NSString *const kMusicListAlbumCoverLargePop = @"coverLargePop";
NSString *const kMusicListAlbumSerializeStatus = @"serializeStatus";
NSString *const kMusicListAlbumCategoryId = @"categoryId";
NSString *const kMusicListAlbumPlayTimes = @"playTimes";


@interface MusicListAlbum ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicListAlbum

@synthesize status = _status;
@synthesize title = _title;
@synthesize tags = _tags;
@synthesize serialState = _serialState;
@synthesize categoryName = _categoryName;
@synthesize coverWebLarge = _coverWebLarge;
@synthesize coverMiddle = _coverMiddle;
@synthesize hasNew = _hasNew;
@synthesize isPaid = _isPaid;
@synthesize intro = _intro;
@synthesize nickname = _nickname;
@synthesize isVerified = _isVerified;
@synthesize isRecordDesc = _isRecordDesc;
@synthesize shares = _shares;
@synthesize avatarPath = _avatarPath;
@synthesize createdAt = _createdAt;
@synthesize lastUptrackAt = _lastUptrackAt;
@synthesize updatedAt = _updatedAt;
@synthesize albumId = _albumId;
@synthesize detailCoverPath = _detailCoverPath;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize coverOrigin = _coverOrigin;
@synthesize uid = _uid;
@synthesize introRich = _introRich;
@synthesize tracks = _tracks;
@synthesize playTrackId = _playTrackId;
@synthesize isFavorite = _isFavorite;
@synthesize coverLargePop = _coverLargePop;
@synthesize serializeStatus = _serializeStatus;
@synthesize categoryId = _categoryId;
@synthesize playTimes = _playTimes;


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
            self.status = [[self objectOrNilForKey:kMusicListAlbumStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kMusicListAlbumTitle fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kMusicListAlbumTags fromDictionary:dict];
            self.serialState = [[self objectOrNilForKey:kMusicListAlbumSerialState fromDictionary:dict] doubleValue];
            self.categoryName = [self objectOrNilForKey:kMusicListAlbumCategoryName fromDictionary:dict];
            self.coverWebLarge = [self objectOrNilForKey:kMusicListAlbumCoverWebLarge fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kMusicListAlbumCoverMiddle fromDictionary:dict];
            self.hasNew = [[self objectOrNilForKey:kMusicListAlbumHasNew fromDictionary:dict] boolValue];
            self.isPaid = [[self objectOrNilForKey:kMusicListAlbumIsPaid fromDictionary:dict] boolValue];
            self.intro = [self objectOrNilForKey:kMusicListAlbumIntro fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kMusicListAlbumNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kMusicListAlbumIsVerified fromDictionary:dict] boolValue];
            self.isRecordDesc = [[self objectOrNilForKey:kMusicListAlbumIsRecordDesc fromDictionary:dict] boolValue];
            self.shares = [[self objectOrNilForKey:kMusicListAlbumShares fromDictionary:dict] doubleValue];
            self.avatarPath = [self objectOrNilForKey:kMusicListAlbumAvatarPath fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kMusicListAlbumCreatedAt fromDictionary:dict] doubleValue];
            self.lastUptrackAt = [[self objectOrNilForKey:kMusicListAlbumLastUptrackAt fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kMusicListAlbumUpdatedAt fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kMusicListAlbumAlbumId fromDictionary:dict] doubleValue];
            self.detailCoverPath = [self objectOrNilForKey:kMusicListAlbumDetailCoverPath fromDictionary:dict];
            self.coverSmall = [self objectOrNilForKey:kMusicListAlbumCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kMusicListAlbumCoverLarge fromDictionary:dict];
            self.coverOrigin = [self objectOrNilForKey:kMusicListAlbumCoverOrigin fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kMusicListAlbumUid fromDictionary:dict] doubleValue];
            self.introRich = [self objectOrNilForKey:kMusicListAlbumIntroRich fromDictionary:dict];
            self.tracks = [[self objectOrNilForKey:kMusicListAlbumTracks fromDictionary:dict] doubleValue];
            self.playTrackId = [[self objectOrNilForKey:kMusicListAlbumPlayTrackId fromDictionary:dict] doubleValue];
            self.isFavorite = [[self objectOrNilForKey:kMusicListAlbumIsFavorite fromDictionary:dict] boolValue];
            self.coverLargePop = [self objectOrNilForKey:kMusicListAlbumCoverLargePop fromDictionary:dict];
            self.serializeStatus = [[self objectOrNilForKey:kMusicListAlbumSerializeStatus fromDictionary:dict] doubleValue];
            self.categoryId = [[self objectOrNilForKey:kMusicListAlbumCategoryId fromDictionary:dict] doubleValue];
            self.playTimes = [[self objectOrNilForKey:kMusicListAlbumPlayTimes fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kMusicListAlbumStatus];
    [mutableDict setValue:self.title forKey:kMusicListAlbumTitle];
    [mutableDict setValue:self.tags forKey:kMusicListAlbumTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kMusicListAlbumSerialState];
    [mutableDict setValue:self.categoryName forKey:kMusicListAlbumCategoryName];
    [mutableDict setValue:self.coverWebLarge forKey:kMusicListAlbumCoverWebLarge];
    [mutableDict setValue:self.coverMiddle forKey:kMusicListAlbumCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNew] forKey:kMusicListAlbumHasNew];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kMusicListAlbumIsPaid];
    [mutableDict setValue:self.intro forKey:kMusicListAlbumIntro];
    [mutableDict setValue:self.nickname forKey:kMusicListAlbumNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kMusicListAlbumIsVerified];
    [mutableDict setValue:[NSNumber numberWithBool:self.isRecordDesc] forKey:kMusicListAlbumIsRecordDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kMusicListAlbumShares];
    [mutableDict setValue:self.avatarPath forKey:kMusicListAlbumAvatarPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kMusicListAlbumCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastUptrackAt] forKey:kMusicListAlbumLastUptrackAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kMusicListAlbumUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kMusicListAlbumAlbumId];
    [mutableDict setValue:self.detailCoverPath forKey:kMusicListAlbumDetailCoverPath];
    [mutableDict setValue:self.coverSmall forKey:kMusicListAlbumCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kMusicListAlbumCoverLarge];
    [mutableDict setValue:self.coverOrigin forKey:kMusicListAlbumCoverOrigin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kMusicListAlbumUid];
    [mutableDict setValue:self.introRich forKey:kMusicListAlbumIntroRich];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kMusicListAlbumTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTrackId] forKey:kMusicListAlbumPlayTrackId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFavorite] forKey:kMusicListAlbumIsFavorite];
    [mutableDict setValue:self.coverLargePop forKey:kMusicListAlbumCoverLargePop];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serializeStatus] forKey:kMusicListAlbumSerializeStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kMusicListAlbumCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTimes] forKey:kMusicListAlbumPlayTimes];

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

    self.status = [aDecoder decodeDoubleForKey:kMusicListAlbumStatus];
    self.title = [aDecoder decodeObjectForKey:kMusicListAlbumTitle];
    self.tags = [aDecoder decodeObjectForKey:kMusicListAlbumTags];
    self.serialState = [aDecoder decodeDoubleForKey:kMusicListAlbumSerialState];
    self.categoryName = [aDecoder decodeObjectForKey:kMusicListAlbumCategoryName];
    self.coverWebLarge = [aDecoder decodeObjectForKey:kMusicListAlbumCoverWebLarge];
    self.coverMiddle = [aDecoder decodeObjectForKey:kMusicListAlbumCoverMiddle];
    self.hasNew = [aDecoder decodeBoolForKey:kMusicListAlbumHasNew];
    self.isPaid = [aDecoder decodeBoolForKey:kMusicListAlbumIsPaid];
    self.intro = [aDecoder decodeObjectForKey:kMusicListAlbumIntro];
    self.nickname = [aDecoder decodeObjectForKey:kMusicListAlbumNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kMusicListAlbumIsVerified];
    self.isRecordDesc = [aDecoder decodeBoolForKey:kMusicListAlbumIsRecordDesc];
    self.shares = [aDecoder decodeDoubleForKey:kMusicListAlbumShares];
    self.avatarPath = [aDecoder decodeObjectForKey:kMusicListAlbumAvatarPath];
    self.createdAt = [aDecoder decodeDoubleForKey:kMusicListAlbumCreatedAt];
    self.lastUptrackAt = [aDecoder decodeDoubleForKey:kMusicListAlbumLastUptrackAt];
    self.updatedAt = [aDecoder decodeDoubleForKey:kMusicListAlbumUpdatedAt];
    self.albumId = [aDecoder decodeDoubleForKey:kMusicListAlbumAlbumId];
    self.detailCoverPath = [aDecoder decodeObjectForKey:kMusicListAlbumDetailCoverPath];
    self.coverSmall = [aDecoder decodeObjectForKey:kMusicListAlbumCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kMusicListAlbumCoverLarge];
    self.coverOrigin = [aDecoder decodeObjectForKey:kMusicListAlbumCoverOrigin];
    self.uid = [aDecoder decodeDoubleForKey:kMusicListAlbumUid];
    self.introRich = [aDecoder decodeObjectForKey:kMusicListAlbumIntroRich];
    self.tracks = [aDecoder decodeDoubleForKey:kMusicListAlbumTracks];
    self.playTrackId = [aDecoder decodeDoubleForKey:kMusicListAlbumPlayTrackId];
    self.isFavorite = [aDecoder decodeBoolForKey:kMusicListAlbumIsFavorite];
    self.coverLargePop = [aDecoder decodeObjectForKey:kMusicListAlbumCoverLargePop];
    self.serializeStatus = [aDecoder decodeDoubleForKey:kMusicListAlbumSerializeStatus];
    self.categoryId = [aDecoder decodeDoubleForKey:kMusicListAlbumCategoryId];
    self.playTimes = [aDecoder decodeDoubleForKey:kMusicListAlbumPlayTimes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kMusicListAlbumStatus];
    [aCoder encodeObject:_title forKey:kMusicListAlbumTitle];
    [aCoder encodeObject:_tags forKey:kMusicListAlbumTags];
    [aCoder encodeDouble:_serialState forKey:kMusicListAlbumSerialState];
    [aCoder encodeObject:_categoryName forKey:kMusicListAlbumCategoryName];
    [aCoder encodeObject:_coverWebLarge forKey:kMusicListAlbumCoverWebLarge];
    [aCoder encodeObject:_coverMiddle forKey:kMusicListAlbumCoverMiddle];
    [aCoder encodeBool:_hasNew forKey:kMusicListAlbumHasNew];
    [aCoder encodeBool:_isPaid forKey:kMusicListAlbumIsPaid];
    [aCoder encodeObject:_intro forKey:kMusicListAlbumIntro];
    [aCoder encodeObject:_nickname forKey:kMusicListAlbumNickname];
    [aCoder encodeBool:_isVerified forKey:kMusicListAlbumIsVerified];
    [aCoder encodeBool:_isRecordDesc forKey:kMusicListAlbumIsRecordDesc];
    [aCoder encodeDouble:_shares forKey:kMusicListAlbumShares];
    [aCoder encodeObject:_avatarPath forKey:kMusicListAlbumAvatarPath];
    [aCoder encodeDouble:_createdAt forKey:kMusicListAlbumCreatedAt];
    [aCoder encodeDouble:_lastUptrackAt forKey:kMusicListAlbumLastUptrackAt];
    [aCoder encodeDouble:_updatedAt forKey:kMusicListAlbumUpdatedAt];
    [aCoder encodeDouble:_albumId forKey:kMusicListAlbumAlbumId];
    [aCoder encodeObject:_detailCoverPath forKey:kMusicListAlbumDetailCoverPath];
    [aCoder encodeObject:_coverSmall forKey:kMusicListAlbumCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kMusicListAlbumCoverLarge];
    [aCoder encodeObject:_coverOrigin forKey:kMusicListAlbumCoverOrigin];
    [aCoder encodeDouble:_uid forKey:kMusicListAlbumUid];
    [aCoder encodeObject:_introRich forKey:kMusicListAlbumIntroRich];
    [aCoder encodeDouble:_tracks forKey:kMusicListAlbumTracks];
    [aCoder encodeDouble:_playTrackId forKey:kMusicListAlbumPlayTrackId];
    [aCoder encodeBool:_isFavorite forKey:kMusicListAlbumIsFavorite];
    [aCoder encodeObject:_coverLargePop forKey:kMusicListAlbumCoverLargePop];
    [aCoder encodeDouble:_serializeStatus forKey:kMusicListAlbumSerializeStatus];
    [aCoder encodeDouble:_categoryId forKey:kMusicListAlbumCategoryId];
    [aCoder encodeDouble:_playTimes forKey:kMusicListAlbumPlayTimes];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicListAlbum *copy = [[MusicListAlbum alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.serialState = self.serialState;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.coverWebLarge = [self.coverWebLarge copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.hasNew = self.hasNew;
        copy.isPaid = self.isPaid;
        copy.intro = [self.intro copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isVerified = self.isVerified;
        copy.isRecordDesc = self.isRecordDesc;
        copy.shares = self.shares;
        copy.avatarPath = [self.avatarPath copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.lastUptrackAt = self.lastUptrackAt;
        copy.updatedAt = self.updatedAt;
        copy.albumId = self.albumId;
        copy.detailCoverPath = [self.detailCoverPath copyWithZone:zone];
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.coverOrigin = [self.coverOrigin copyWithZone:zone];
        copy.uid = self.uid;
        copy.introRich = [self.introRich copyWithZone:zone];
        copy.tracks = self.tracks;
        copy.playTrackId = self.playTrackId;
        copy.isFavorite = self.isFavorite;
        copy.coverLargePop = [self.coverLargePop copyWithZone:zone];
        copy.serializeStatus = self.serializeStatus;
        copy.categoryId = self.categoryId;
        copy.playTimes = self.playTimes;
    }
    
    return copy;
}


@end
