//
//  MusicDownloadBaseClass.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicDownloadBaseClass.h"


NSString *const kMusicDownloadBaseClassIsFree = @"isFree";
NSString *const kMusicDownloadBaseClassAlbumCoverMiddle = @"albumCoverMiddle";
NSString *const kMusicDownloadBaseClassTitle = @"title";
NSString *const kMusicDownloadBaseClassDuration = @"duration";
NSString *const kMusicDownloadBaseClassNickname = @"nickname";
NSString *const kMusicDownloadBaseClassIsPaid = @"isPaid";
NSString *const kMusicDownloadBaseClassIsAuthorized = @"isAuthorized";
NSString *const kMusicDownloadBaseClassCreatedAt = @"createdAt";
NSString *const kMusicDownloadBaseClassSmallLogo = @"smallLogo";
NSString *const kMusicDownloadBaseClassOrderNum = @"orderNum";
NSString *const kMusicDownloadBaseClassAlbumTitle = @"albumTitle";
NSString *const kMusicDownloadBaseClassAlbumCoverSmall = @"albumCoverSmall";
NSString *const kMusicDownloadBaseClassDownloadSize = @"downloadSize";
NSString *const kMusicDownloadBaseClassDownloadType = @"downloadType";
NSString *const kMusicDownloadBaseClassAlbumId = @"albumId";
NSString *const kMusicDownloadBaseClassTimeline = @"timeline";
NSString *const kMusicDownloadBaseClassCoverSmall = @"coverSmall";
NSString *const kMusicDownloadBaseClassDownloadTime = @"downloadTime";
NSString *const kMusicDownloadBaseClassUid = @"uid";
NSString *const kMusicDownloadBaseClassDownloadAacSize = @"downloadAacSize";
NSString *const kMusicDownloadBaseClassDownloadAacUrl = @"downloadAacUrl";
NSString *const kMusicDownloadBaseClassSequnceId = @"sequnceId";
NSString *const kMusicDownloadBaseClassDownloadUrl = @"downloadUrl";
NSString *const kMusicDownloadBaseClassRet = @"ret";
NSString *const kMusicDownloadBaseClassTrackId = @"trackId";
NSString *const kMusicDownloadBaseClassMsg = @"msg";


@interface MusicDownloadBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicDownloadBaseClass

@synthesize isFree = _isFree;
@synthesize albumCoverMiddle = _albumCoverMiddle;
@synthesize title = _title;
@synthesize duration = _duration;
@synthesize nickname = _nickname;
@synthesize isPaid = _isPaid;
@synthesize isAuthorized = _isAuthorized;
@synthesize createdAt = _createdAt;
@synthesize smallLogo = _smallLogo;
@synthesize orderNum = _orderNum;
@synthesize albumTitle = _albumTitle;
@synthesize albumCoverSmall = _albumCoverSmall;
@synthesize downloadSize = _downloadSize;
@synthesize downloadType = _downloadType;
@synthesize albumId = _albumId;
@synthesize timeline = _timeline;
@synthesize coverSmall = _coverSmall;
@synthesize downloadTime = _downloadTime;
@synthesize uid = _uid;
@synthesize downloadAacSize = _downloadAacSize;
@synthesize downloadAacUrl = _downloadAacUrl;
@synthesize sequnceId = _sequnceId;
@synthesize downloadUrl = _downloadUrl;
@synthesize ret = _ret;
@synthesize trackId = _trackId;
@synthesize msg = _msg;


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
            self.isFree = [[self objectOrNilForKey:kMusicDownloadBaseClassIsFree fromDictionary:dict] boolValue];
            self.albumCoverMiddle = [self objectOrNilForKey:kMusicDownloadBaseClassAlbumCoverMiddle fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMusicDownloadBaseClassTitle fromDictionary:dict];
            self.duration = [[self objectOrNilForKey:kMusicDownloadBaseClassDuration fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kMusicDownloadBaseClassNickname fromDictionary:dict];
            self.isPaid = [[self objectOrNilForKey:kMusicDownloadBaseClassIsPaid fromDictionary:dict] boolValue];
            self.isAuthorized = [[self objectOrNilForKey:kMusicDownloadBaseClassIsAuthorized fromDictionary:dict] boolValue];
            self.createdAt = [[self objectOrNilForKey:kMusicDownloadBaseClassCreatedAt fromDictionary:dict] doubleValue];
            self.smallLogo = [self objectOrNilForKey:kMusicDownloadBaseClassSmallLogo fromDictionary:dict];
            self.orderNum = [[self objectOrNilForKey:kMusicDownloadBaseClassOrderNum fromDictionary:dict] doubleValue];
            self.albumTitle = [self objectOrNilForKey:kMusicDownloadBaseClassAlbumTitle fromDictionary:dict];
            self.albumCoverSmall = [self objectOrNilForKey:kMusicDownloadBaseClassAlbumCoverSmall fromDictionary:dict];
            self.downloadSize = [[self objectOrNilForKey:kMusicDownloadBaseClassDownloadSize fromDictionary:dict] doubleValue];
            self.downloadType = [[self objectOrNilForKey:kMusicDownloadBaseClassDownloadType fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kMusicDownloadBaseClassAlbumId fromDictionary:dict] doubleValue];
            self.timeline = [[self objectOrNilForKey:kMusicDownloadBaseClassTimeline fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kMusicDownloadBaseClassCoverSmall fromDictionary:dict];
            self.downloadTime = [[self objectOrNilForKey:kMusicDownloadBaseClassDownloadTime fromDictionary:dict] doubleValue];
            self.uid = [[self objectOrNilForKey:kMusicDownloadBaseClassUid fromDictionary:dict] doubleValue];
            self.downloadAacSize = [[self objectOrNilForKey:kMusicDownloadBaseClassDownloadAacSize fromDictionary:dict] doubleValue];
            self.downloadAacUrl = [self objectOrNilForKey:kMusicDownloadBaseClassDownloadAacUrl fromDictionary:dict];
            self.sequnceId = [self objectOrNilForKey:kMusicDownloadBaseClassSequnceId fromDictionary:dict];
            self.downloadUrl = [self objectOrNilForKey:kMusicDownloadBaseClassDownloadUrl fromDictionary:dict];
            self.ret = [[self objectOrNilForKey:kMusicDownloadBaseClassRet fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kMusicDownloadBaseClassTrackId fromDictionary:dict] doubleValue];
            self.msg = [self objectOrNilForKey:kMusicDownloadBaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFree] forKey:kMusicDownloadBaseClassIsFree];
    [mutableDict setValue:self.albumCoverMiddle forKey:kMusicDownloadBaseClassAlbumCoverMiddle];
    [mutableDict setValue:self.title forKey:kMusicDownloadBaseClassTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kMusicDownloadBaseClassDuration];
    [mutableDict setValue:self.nickname forKey:kMusicDownloadBaseClassNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kMusicDownloadBaseClassIsPaid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isAuthorized] forKey:kMusicDownloadBaseClassIsAuthorized];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kMusicDownloadBaseClassCreatedAt];
    [mutableDict setValue:self.smallLogo forKey:kMusicDownloadBaseClassSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderNum] forKey:kMusicDownloadBaseClassOrderNum];
    [mutableDict setValue:self.albumTitle forKey:kMusicDownloadBaseClassAlbumTitle];
    [mutableDict setValue:self.albumCoverSmall forKey:kMusicDownloadBaseClassAlbumCoverSmall];
    [mutableDict setValue:[NSNumber numberWithDouble:self.downloadSize] forKey:kMusicDownloadBaseClassDownloadSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.downloadType] forKey:kMusicDownloadBaseClassDownloadType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kMusicDownloadBaseClassAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.timeline] forKey:kMusicDownloadBaseClassTimeline];
    [mutableDict setValue:self.coverSmall forKey:kMusicDownloadBaseClassCoverSmall];
    [mutableDict setValue:[NSNumber numberWithDouble:self.downloadTime] forKey:kMusicDownloadBaseClassDownloadTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kMusicDownloadBaseClassUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.downloadAacSize] forKey:kMusicDownloadBaseClassDownloadAacSize];
    [mutableDict setValue:self.downloadAacUrl forKey:kMusicDownloadBaseClassDownloadAacUrl];
    [mutableDict setValue:self.sequnceId forKey:kMusicDownloadBaseClassSequnceId];
    [mutableDict setValue:self.downloadUrl forKey:kMusicDownloadBaseClassDownloadUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kMusicDownloadBaseClassRet];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kMusicDownloadBaseClassTrackId];
    [mutableDict setValue:self.msg forKey:kMusicDownloadBaseClassMsg];

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

    self.isFree = [aDecoder decodeBoolForKey:kMusicDownloadBaseClassIsFree];
    self.albumCoverMiddle = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassAlbumCoverMiddle];
    self.title = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassTitle];
    self.duration = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassDuration];
    self.nickname = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassNickname];
    self.isPaid = [aDecoder decodeBoolForKey:kMusicDownloadBaseClassIsPaid];
    self.isAuthorized = [aDecoder decodeBoolForKey:kMusicDownloadBaseClassIsAuthorized];
    self.createdAt = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassCreatedAt];
    self.smallLogo = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassSmallLogo];
    self.orderNum = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassOrderNum];
    self.albumTitle = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassAlbumTitle];
    self.albumCoverSmall = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassAlbumCoverSmall];
    self.downloadSize = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassDownloadSize];
    self.downloadType = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassDownloadType];
    self.albumId = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassAlbumId];
    self.timeline = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassTimeline];
    self.coverSmall = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassCoverSmall];
    self.downloadTime = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassDownloadTime];
    self.uid = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassUid];
    self.downloadAacSize = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassDownloadAacSize];
    self.downloadAacUrl = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassDownloadAacUrl];
    self.sequnceId = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassSequnceId];
    self.downloadUrl = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassDownloadUrl];
    self.ret = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassRet];
    self.trackId = [aDecoder decodeDoubleForKey:kMusicDownloadBaseClassTrackId];
    self.msg = [aDecoder decodeObjectForKey:kMusicDownloadBaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isFree forKey:kMusicDownloadBaseClassIsFree];
    [aCoder encodeObject:_albumCoverMiddle forKey:kMusicDownloadBaseClassAlbumCoverMiddle];
    [aCoder encodeObject:_title forKey:kMusicDownloadBaseClassTitle];
    [aCoder encodeDouble:_duration forKey:kMusicDownloadBaseClassDuration];
    [aCoder encodeObject:_nickname forKey:kMusicDownloadBaseClassNickname];
    [aCoder encodeBool:_isPaid forKey:kMusicDownloadBaseClassIsPaid];
    [aCoder encodeBool:_isAuthorized forKey:kMusicDownloadBaseClassIsAuthorized];
    [aCoder encodeDouble:_createdAt forKey:kMusicDownloadBaseClassCreatedAt];
    [aCoder encodeObject:_smallLogo forKey:kMusicDownloadBaseClassSmallLogo];
    [aCoder encodeDouble:_orderNum forKey:kMusicDownloadBaseClassOrderNum];
    [aCoder encodeObject:_albumTitle forKey:kMusicDownloadBaseClassAlbumTitle];
    [aCoder encodeObject:_albumCoverSmall forKey:kMusicDownloadBaseClassAlbumCoverSmall];
    [aCoder encodeDouble:_downloadSize forKey:kMusicDownloadBaseClassDownloadSize];
    [aCoder encodeDouble:_downloadType forKey:kMusicDownloadBaseClassDownloadType];
    [aCoder encodeDouble:_albumId forKey:kMusicDownloadBaseClassAlbumId];
    [aCoder encodeDouble:_timeline forKey:kMusicDownloadBaseClassTimeline];
    [aCoder encodeObject:_coverSmall forKey:kMusicDownloadBaseClassCoverSmall];
    [aCoder encodeDouble:_downloadTime forKey:kMusicDownloadBaseClassDownloadTime];
    [aCoder encodeDouble:_uid forKey:kMusicDownloadBaseClassUid];
    [aCoder encodeDouble:_downloadAacSize forKey:kMusicDownloadBaseClassDownloadAacSize];
    [aCoder encodeObject:_downloadAacUrl forKey:kMusicDownloadBaseClassDownloadAacUrl];
    [aCoder encodeObject:_sequnceId forKey:kMusicDownloadBaseClassSequnceId];
    [aCoder encodeObject:_downloadUrl forKey:kMusicDownloadBaseClassDownloadUrl];
    [aCoder encodeDouble:_ret forKey:kMusicDownloadBaseClassRet];
    [aCoder encodeDouble:_trackId forKey:kMusicDownloadBaseClassTrackId];
    [aCoder encodeObject:_msg forKey:kMusicDownloadBaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicDownloadBaseClass *copy = [[MusicDownloadBaseClass alloc] init];
    
    if (copy) {

        copy.isFree = self.isFree;
        copy.albumCoverMiddle = [self.albumCoverMiddle copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.duration = self.duration;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isPaid = self.isPaid;
        copy.isAuthorized = self.isAuthorized;
        copy.createdAt = self.createdAt;
        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.orderNum = self.orderNum;
        copy.albumTitle = [self.albumTitle copyWithZone:zone];
        copy.albumCoverSmall = [self.albumCoverSmall copyWithZone:zone];
        copy.downloadSize = self.downloadSize;
        copy.downloadType = self.downloadType;
        copy.albumId = self.albumId;
        copy.timeline = self.timeline;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.downloadTime = self.downloadTime;
        copy.uid = self.uid;
        copy.downloadAacSize = self.downloadAacSize;
        copy.downloadAacUrl = [self.downloadAacUrl copyWithZone:zone];
        copy.sequnceId = [self.sequnceId copyWithZone:zone];
        copy.downloadUrl = [self.downloadUrl copyWithZone:zone];
        copy.ret = self.ret;
        copy.trackId = self.trackId;
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
