//
//  MusicListList.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicListList.h"


NSString *const kMusicListListStatus = @"status";
NSString *const kMusicListListTitle = @"title";
NSString *const kMusicListListLikes = @"likes";
NSString *const kMusicListListUserSource = @"userSource";
NSString *const kMusicListListDuration = @"duration";
NSString *const kMusicListListNickname = @"nickname";
NSString *const kMusicListListProcessState = @"processState";
NSString *const kMusicListListCoverMiddle = @"coverMiddle";
NSString *const kMusicListListPlayPathHq = @"playPathHq";
NSString *const kMusicListListShares = @"shares";
NSString *const kMusicListListIsPaid = @"isPaid";
NSString *const kMusicListListPlayPathAacv224 = @"playPathAacv224";
NSString *const kMusicListListCreatedAt = @"createdAt";
NSString *const kMusicListListSmallLogo = @"smallLogo";
NSString *const kMusicListListAlbumId = @"albumId";
NSString *const kMusicListListPlaytimes = @"playtimes";
NSString *const kMusicListListPlayUrl64 = @"playUrl64";
NSString *const kMusicListListPlayPathAacv164 = @"playPathAacv164";
NSString *const kMusicListListPlayUrl32 = @"playUrl32";
NSString *const kMusicListListUid = @"uid";
NSString *const kMusicListListCoverSmall = @"coverSmall";
NSString *const kMusicListListCoverLarge = @"coverLarge";
NSString *const kMusicListListComments = @"comments";
NSString *const kMusicListListTrackId = @"trackId";
NSString *const kMusicListListOpType = @"opType";
NSString *const kMusicListListIsPublic = @"isPublic";


@interface MusicListList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicListList

@synthesize status = _status;
@synthesize title = _title;
@synthesize likes = _likes;
@synthesize userSource = _userSource;
@synthesize duration = _duration;
@synthesize nickname = _nickname;
@synthesize processState = _processState;
@synthesize coverMiddle = _coverMiddle;
@synthesize playPathHq = _playPathHq;
@synthesize shares = _shares;
@synthesize isPaid = _isPaid;
@synthesize playPathAacv224 = _playPathAacv224;
@synthesize createdAt = _createdAt;
@synthesize smallLogo = _smallLogo;
@synthesize albumId = _albumId;
@synthesize playtimes = _playtimes;
@synthesize playUrl64 = _playUrl64;
@synthesize playPathAacv164 = _playPathAacv164;
@synthesize playUrl32 = _playUrl32;
@synthesize uid = _uid;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize comments = _comments;
@synthesize trackId = _trackId;
@synthesize opType = _opType;
@synthesize isPublic = _isPublic;


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
            self.status = [[self objectOrNilForKey:kMusicListListStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kMusicListListTitle fromDictionary:dict];
            self.likes = [[self objectOrNilForKey:kMusicListListLikes fromDictionary:dict] doubleValue];
            self.userSource = [[self objectOrNilForKey:kMusicListListUserSource fromDictionary:dict] doubleValue];
            self.duration = [[self objectOrNilForKey:kMusicListListDuration fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kMusicListListNickname fromDictionary:dict];
            self.processState = [[self objectOrNilForKey:kMusicListListProcessState fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kMusicListListCoverMiddle fromDictionary:dict];
            self.playPathHq = [self objectOrNilForKey:kMusicListListPlayPathHq fromDictionary:dict];
            self.shares = [[self objectOrNilForKey:kMusicListListShares fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kMusicListListIsPaid fromDictionary:dict] boolValue];
            self.playPathAacv224 = [self objectOrNilForKey:kMusicListListPlayPathAacv224 fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kMusicListListCreatedAt fromDictionary:dict] doubleValue];
            self.smallLogo = [self objectOrNilForKey:kMusicListListSmallLogo fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kMusicListListAlbumId fromDictionary:dict] doubleValue];
            self.playtimes = [[self objectOrNilForKey:kMusicListListPlaytimes fromDictionary:dict] doubleValue];
            self.playUrl64 = [self objectOrNilForKey:kMusicListListPlayUrl64 fromDictionary:dict];
            self.playPathAacv164 = [self objectOrNilForKey:kMusicListListPlayPathAacv164 fromDictionary:dict];
            self.playUrl32 = [self objectOrNilForKey:kMusicListListPlayUrl32 fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kMusicListListUid fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kMusicListListCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kMusicListListCoverLarge fromDictionary:dict];
            self.comments = [[self objectOrNilForKey:kMusicListListComments fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kMusicListListTrackId fromDictionary:dict] doubleValue];
            self.opType = [[self objectOrNilForKey:kMusicListListOpType fromDictionary:dict] doubleValue];
            self.isPublic = [[self objectOrNilForKey:kMusicListListIsPublic fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kMusicListListStatus];
    [mutableDict setValue:self.title forKey:kMusicListListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likes] forKey:kMusicListListLikes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userSource] forKey:kMusicListListUserSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kMusicListListDuration];
    [mutableDict setValue:self.nickname forKey:kMusicListListNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.processState] forKey:kMusicListListProcessState];
    [mutableDict setValue:self.coverMiddle forKey:kMusicListListCoverMiddle];
    [mutableDict setValue:self.playPathHq forKey:kMusicListListPlayPathHq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kMusicListListShares];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kMusicListListIsPaid];
    [mutableDict setValue:self.playPathAacv224 forKey:kMusicListListPlayPathAacv224];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kMusicListListCreatedAt];
    [mutableDict setValue:self.smallLogo forKey:kMusicListListSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kMusicListListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playtimes] forKey:kMusicListListPlaytimes];
    [mutableDict setValue:self.playUrl64 forKey:kMusicListListPlayUrl64];
    [mutableDict setValue:self.playPathAacv164 forKey:kMusicListListPlayPathAacv164];
    [mutableDict setValue:self.playUrl32 forKey:kMusicListListPlayUrl32];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kMusicListListUid];
    [mutableDict setValue:self.coverSmall forKey:kMusicListListCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kMusicListListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kMusicListListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kMusicListListTrackId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.opType] forKey:kMusicListListOpType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kMusicListListIsPublic];

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

    self.status = [aDecoder decodeDoubleForKey:kMusicListListStatus];
    self.title = [aDecoder decodeObjectForKey:kMusicListListTitle];
    self.likes = [aDecoder decodeDoubleForKey:kMusicListListLikes];
    self.userSource = [aDecoder decodeDoubleForKey:kMusicListListUserSource];
    self.duration = [aDecoder decodeDoubleForKey:kMusicListListDuration];
    self.nickname = [aDecoder decodeObjectForKey:kMusicListListNickname];
    self.processState = [aDecoder decodeDoubleForKey:kMusicListListProcessState];
    self.coverMiddle = [aDecoder decodeObjectForKey:kMusicListListCoverMiddle];
    self.playPathHq = [aDecoder decodeObjectForKey:kMusicListListPlayPathHq];
    self.shares = [aDecoder decodeDoubleForKey:kMusicListListShares];
    self.isPaid = [aDecoder decodeBoolForKey:kMusicListListIsPaid];
    self.playPathAacv224 = [aDecoder decodeObjectForKey:kMusicListListPlayPathAacv224];
    self.createdAt = [aDecoder decodeDoubleForKey:kMusicListListCreatedAt];
    self.smallLogo = [aDecoder decodeObjectForKey:kMusicListListSmallLogo];
    self.albumId = [aDecoder decodeDoubleForKey:kMusicListListAlbumId];
    self.playtimes = [aDecoder decodeDoubleForKey:kMusicListListPlaytimes];
    self.playUrl64 = [aDecoder decodeObjectForKey:kMusicListListPlayUrl64];
    self.playPathAacv164 = [aDecoder decodeObjectForKey:kMusicListListPlayPathAacv164];
    self.playUrl32 = [aDecoder decodeObjectForKey:kMusicListListPlayUrl32];
    self.uid = [aDecoder decodeDoubleForKey:kMusicListListUid];
    self.coverSmall = [aDecoder decodeObjectForKey:kMusicListListCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kMusicListListCoverLarge];
    self.comments = [aDecoder decodeDoubleForKey:kMusicListListComments];
    self.trackId = [aDecoder decodeDoubleForKey:kMusicListListTrackId];
    self.opType = [aDecoder decodeDoubleForKey:kMusicListListOpType];
    self.isPublic = [aDecoder decodeBoolForKey:kMusicListListIsPublic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kMusicListListStatus];
    [aCoder encodeObject:_title forKey:kMusicListListTitle];
    [aCoder encodeDouble:_likes forKey:kMusicListListLikes];
    [aCoder encodeDouble:_userSource forKey:kMusicListListUserSource];
    [aCoder encodeDouble:_duration forKey:kMusicListListDuration];
    [aCoder encodeObject:_nickname forKey:kMusicListListNickname];
    [aCoder encodeDouble:_processState forKey:kMusicListListProcessState];
    [aCoder encodeObject:_coverMiddle forKey:kMusicListListCoverMiddle];
    [aCoder encodeObject:_playPathHq forKey:kMusicListListPlayPathHq];
    [aCoder encodeDouble:_shares forKey:kMusicListListShares];
    [aCoder encodeBool:_isPaid forKey:kMusicListListIsPaid];
    [aCoder encodeObject:_playPathAacv224 forKey:kMusicListListPlayPathAacv224];
    [aCoder encodeDouble:_createdAt forKey:kMusicListListCreatedAt];
    [aCoder encodeObject:_smallLogo forKey:kMusicListListSmallLogo];
    [aCoder encodeDouble:_albumId forKey:kMusicListListAlbumId];
    [aCoder encodeDouble:_playtimes forKey:kMusicListListPlaytimes];
    [aCoder encodeObject:_playUrl64 forKey:kMusicListListPlayUrl64];
    [aCoder encodeObject:_playPathAacv164 forKey:kMusicListListPlayPathAacv164];
    [aCoder encodeObject:_playUrl32 forKey:kMusicListListPlayUrl32];
    [aCoder encodeDouble:_uid forKey:kMusicListListUid];
    [aCoder encodeObject:_coverSmall forKey:kMusicListListCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kMusicListListCoverLarge];
    [aCoder encodeDouble:_comments forKey:kMusicListListComments];
    [aCoder encodeDouble:_trackId forKey:kMusicListListTrackId];
    [aCoder encodeDouble:_opType forKey:kMusicListListOpType];
    [aCoder encodeBool:_isPublic forKey:kMusicListListIsPublic];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicListList *copy = [[MusicListList alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.likes = self.likes;
        copy.userSource = self.userSource;
        copy.duration = self.duration;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.processState = self.processState;
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.playPathHq = [self.playPathHq copyWithZone:zone];
        copy.shares = self.shares;
        copy.isPaid = self.isPaid;
        copy.playPathAacv224 = [self.playPathAacv224 copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.albumId = self.albumId;
        copy.playtimes = self.playtimes;
        copy.playUrl64 = [self.playUrl64 copyWithZone:zone];
        copy.playPathAacv164 = [self.playPathAacv164 copyWithZone:zone];
        copy.playUrl32 = [self.playUrl32 copyWithZone:zone];
        copy.uid = self.uid;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.comments = self.comments;
        copy.trackId = self.trackId;
        copy.opType = self.opType;
        copy.isPublic = self.isPublic;
    }
    
    return copy;
}


@end
