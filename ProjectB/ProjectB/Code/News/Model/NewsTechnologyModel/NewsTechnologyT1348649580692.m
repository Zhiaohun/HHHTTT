//
//  NewsTechnologyT1348649580692.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsTechnologyT1348649580692.h"
#import "NewsTechnologyImgextra.h"
#import "NewsTechnologyAds.h"


NSString *const kNewsTechnologyT1348649580692Alias = @"alias";
NSString *const kNewsTechnologyT1348649580692ImgType = @"imgType";
NSString *const kNewsTechnologyT1348649580692ReplyCount = @"replyCount";
NSString *const kNewsTechnologyT1348649580692Lmodify = @"lmodify";
NSString *const kNewsTechnologyT1348649580692HasCover = @"hasCover";
NSString *const kNewsTechnologyT1348649580692Subtitle = @"subtitle";
NSString *const kNewsTechnologyT1348649580692Url = @"url";
NSString *const kNewsTechnologyT1348649580692Ltitle = @"ltitle";
NSString *const kNewsTechnologyT1348649580692Ptime = @"ptime";
NSString *const kNewsTechnologyT1348649580692Editor = @"editor";
NSString *const kNewsTechnologyT1348649580692Postid = @"postid";
NSString *const kNewsTechnologyT1348649580692Votecount = @"votecount";
NSString *const kNewsTechnologyT1348649580692HasHead = @"hasHead";
NSString *const kNewsTechnologyT1348649580692Priority = @"priority";
NSString *const kNewsTechnologyT1348649580692Digest = @"digest";
NSString *const kNewsTechnologyT1348649580692Tname = @"tname";
NSString *const kNewsTechnologyT1348649580692Template = @"template";
NSString *const kNewsTechnologyT1348649580692HasAD = @"hasAD";
NSString *const kNewsTechnologyT1348649580692SkipType = @"skipType";
NSString *const kNewsTechnologyT1348649580692SpecialID = @"specialID";
NSString *const kNewsTechnologyT1348649580692Imgsrc = @"imgsrc";
NSString *const kNewsTechnologyT1348649580692Source = @"source";
NSString *const kNewsTechnologyT1348649580692Ename = @"ename";
NSString *const kNewsTechnologyT1348649580692Imgextra = @"imgextra";
NSString *const kNewsTechnologyT1348649580692PhotosetID = @"photosetID";
NSString *const kNewsTechnologyT1348649580692HasIcon = @"hasIcon";
NSString *const kNewsTechnologyT1348649580692Order = @"order";
NSString *const kNewsTechnologyT1348649580692Url3w = @"url_3w";
NSString *const kNewsTechnologyT1348649580692Cid = @"cid";
NSString *const kNewsTechnologyT1348649580692Boardid = @"boardid";
NSString *const kNewsTechnologyT1348649580692Docid = @"docid";
NSString *const kNewsTechnologyT1348649580692HasImg = @"hasImg";
NSString *const kNewsTechnologyT1348649580692Ads = @"ads";
NSString *const kNewsTechnologyT1348649580692Title = @"title";
NSString *const kNewsTechnologyT1348649580692SkipID = @"skipID";


@interface NewsTechnologyT1348649580692 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsTechnologyT1348649580692

@synthesize alias = _alias;
@synthesize imgType = _imgType;
@synthesize replyCount = _replyCount;
@synthesize lmodify = _lmodify;
@synthesize hasCover = _hasCover;
@synthesize subtitle = _subtitle;
@synthesize url = _url;
@synthesize ltitle = _ltitle;
@synthesize ptime = _ptime;
@synthesize editor = _editor;
@synthesize postid = _postid;
@synthesize votecount = _votecount;
@synthesize hasHead = _hasHead;
@synthesize priority = _priority;
@synthesize digest = _digest;
@synthesize tname = _tname;
@synthesize template = _template;
@synthesize hasAD = _hasAD;
@synthesize skipType = _skipType;
@synthesize specialID = _specialID;
@synthesize imgsrc = _imgsrc;
@synthesize source = _source;
@synthesize ename = _ename;
@synthesize imgextra = _imgextra;
@synthesize photosetID = _photosetID;
@synthesize hasIcon = _hasIcon;
@synthesize order = _order;
@synthesize url3w = _url3w;
@synthesize cid = _cid;
@synthesize boardid = _boardid;
@synthesize docid = _docid;
@synthesize hasImg = _hasImg;
@synthesize ads = _ads;
@synthesize title = _title;
@synthesize skipID = _skipID;


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
            self.alias = [self objectOrNilForKey:kNewsTechnologyT1348649580692Alias fromDictionary:dict];
            self.imgType = [[self objectOrNilForKey:kNewsTechnologyT1348649580692ImgType fromDictionary:dict] doubleValue];
            self.replyCount = [[self objectOrNilForKey:kNewsTechnologyT1348649580692ReplyCount fromDictionary:dict] doubleValue];
            self.lmodify = [self objectOrNilForKey:kNewsTechnologyT1348649580692Lmodify fromDictionary:dict];
            self.hasCover = [[self objectOrNilForKey:kNewsTechnologyT1348649580692HasCover fromDictionary:dict] boolValue];
            self.subtitle = [self objectOrNilForKey:kNewsTechnologyT1348649580692Subtitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsTechnologyT1348649580692Url fromDictionary:dict];
            self.ltitle = [self objectOrNilForKey:kNewsTechnologyT1348649580692Ltitle fromDictionary:dict];
            self.ptime = [self objectOrNilForKey:kNewsTechnologyT1348649580692Ptime fromDictionary:dict];
            self.editor = [self objectOrNilForKey:kNewsTechnologyT1348649580692Editor fromDictionary:dict];
            self.postid = [self objectOrNilForKey:kNewsTechnologyT1348649580692Postid fromDictionary:dict];
            self.votecount = [[self objectOrNilForKey:kNewsTechnologyT1348649580692Votecount fromDictionary:dict] doubleValue];
            self.hasHead = [[self objectOrNilForKey:kNewsTechnologyT1348649580692HasHead fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kNewsTechnologyT1348649580692Priority fromDictionary:dict] doubleValue];
            self.digest = [self objectOrNilForKey:kNewsTechnologyT1348649580692Digest fromDictionary:dict];
            self.tname = [self objectOrNilForKey:kNewsTechnologyT1348649580692Tname fromDictionary:dict];
            self.template = [self objectOrNilForKey:kNewsTechnologyT1348649580692Template fromDictionary:dict];
            self.hasAD = [[self objectOrNilForKey:kNewsTechnologyT1348649580692HasAD fromDictionary:dict] doubleValue];
            self.skipType = [self objectOrNilForKey:kNewsTechnologyT1348649580692SkipType fromDictionary:dict];
            self.specialID = [self objectOrNilForKey:kNewsTechnologyT1348649580692SpecialID fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kNewsTechnologyT1348649580692Imgsrc fromDictionary:dict];
            self.source = [self objectOrNilForKey:kNewsTechnologyT1348649580692Source fromDictionary:dict];
            self.ename = [self objectOrNilForKey:kNewsTechnologyT1348649580692Ename fromDictionary:dict];
    NSObject *receivedNewsTechnologyImgextra = [dict objectForKey:kNewsTechnologyT1348649580692Imgextra];
    NSMutableArray *parsedNewsTechnologyImgextra = [NSMutableArray array];
    if ([receivedNewsTechnologyImgextra isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsTechnologyImgextra) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsTechnologyImgextra addObject:[NewsTechnologyImgextra modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsTechnologyImgextra isKindOfClass:[NSDictionary class]]) {
       [parsedNewsTechnologyImgextra addObject:[NewsTechnologyImgextra modelObjectWithDictionary:(NSDictionary *)receivedNewsTechnologyImgextra]];
    }

    self.imgextra = [NSArray arrayWithArray:parsedNewsTechnologyImgextra];
            self.photosetID = [self objectOrNilForKey:kNewsTechnologyT1348649580692PhotosetID fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kNewsTechnologyT1348649580692HasIcon fromDictionary:dict] boolValue];
            self.order = [[self objectOrNilForKey:kNewsTechnologyT1348649580692Order fromDictionary:dict] doubleValue];
            self.url3w = [self objectOrNilForKey:kNewsTechnologyT1348649580692Url3w fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kNewsTechnologyT1348649580692Cid fromDictionary:dict];
            self.boardid = [self objectOrNilForKey:kNewsTechnologyT1348649580692Boardid fromDictionary:dict];
            self.docid = [self objectOrNilForKey:kNewsTechnologyT1348649580692Docid fromDictionary:dict];
            self.hasImg = [[self objectOrNilForKey:kNewsTechnologyT1348649580692HasImg fromDictionary:dict] doubleValue];
    NSObject *receivedNewsTechnologyAds = [dict objectForKey:kNewsTechnologyT1348649580692Ads];
    NSMutableArray *parsedNewsTechnologyAds = [NSMutableArray array];
    if ([receivedNewsTechnologyAds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsTechnologyAds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsTechnologyAds addObject:[NewsTechnologyAds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsTechnologyAds isKindOfClass:[NSDictionary class]]) {
       [parsedNewsTechnologyAds addObject:[NewsTechnologyAds modelObjectWithDictionary:(NSDictionary *)receivedNewsTechnologyAds]];
    }

    self.ads = [NSArray arrayWithArray:parsedNewsTechnologyAds];
            self.title = [self objectOrNilForKey:kNewsTechnologyT1348649580692Title fromDictionary:dict];
            self.skipID = [self objectOrNilForKey:kNewsTechnologyT1348649580692SkipID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.alias forKey:kNewsTechnologyT1348649580692Alias];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgType] forKey:kNewsTechnologyT1348649580692ImgType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kNewsTechnologyT1348649580692ReplyCount];
    [mutableDict setValue:self.lmodify forKey:kNewsTechnologyT1348649580692Lmodify];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCover] forKey:kNewsTechnologyT1348649580692HasCover];
    [mutableDict setValue:self.subtitle forKey:kNewsTechnologyT1348649580692Subtitle];
    [mutableDict setValue:self.url forKey:kNewsTechnologyT1348649580692Url];
    [mutableDict setValue:self.ltitle forKey:kNewsTechnologyT1348649580692Ltitle];
    [mutableDict setValue:self.ptime forKey:kNewsTechnologyT1348649580692Ptime];
    NSMutableArray *tempArrayForEditor = [NSMutableArray array];
    for (NSObject *subArrayObject in self.editor) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEditor addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEditor addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEditor] forKey:kNewsTechnologyT1348649580692Editor];
    [mutableDict setValue:self.postid forKey:kNewsTechnologyT1348649580692Postid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.votecount] forKey:kNewsTechnologyT1348649580692Votecount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasHead] forKey:kNewsTechnologyT1348649580692HasHead];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kNewsTechnologyT1348649580692Priority];
    [mutableDict setValue:self.digest forKey:kNewsTechnologyT1348649580692Digest];
    [mutableDict setValue:self.tname forKey:kNewsTechnologyT1348649580692Tname];
    [mutableDict setValue:self.template forKey:kNewsTechnologyT1348649580692Template];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasAD] forKey:kNewsTechnologyT1348649580692HasAD];
    [mutableDict setValue:self.skipType forKey:kNewsTechnologyT1348649580692SkipType];
    [mutableDict setValue:self.specialID forKey:kNewsTechnologyT1348649580692SpecialID];
    [mutableDict setValue:self.imgsrc forKey:kNewsTechnologyT1348649580692Imgsrc];
    [mutableDict setValue:self.source forKey:kNewsTechnologyT1348649580692Source];
    [mutableDict setValue:self.ename forKey:kNewsTechnologyT1348649580692Ename];
    NSMutableArray *tempArrayForImgextra = [NSMutableArray array];
    for (NSObject *subArrayObject in self.imgextra) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImgextra addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImgextra addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgextra] forKey:kNewsTechnologyT1348649580692Imgextra];
    [mutableDict setValue:self.photosetID forKey:kNewsTechnologyT1348649580692PhotosetID];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kNewsTechnologyT1348649580692HasIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kNewsTechnologyT1348649580692Order];
    [mutableDict setValue:self.url3w forKey:kNewsTechnologyT1348649580692Url3w];
    [mutableDict setValue:self.cid forKey:kNewsTechnologyT1348649580692Cid];
    [mutableDict setValue:self.boardid forKey:kNewsTechnologyT1348649580692Boardid];
    [mutableDict setValue:self.docid forKey:kNewsTechnologyT1348649580692Docid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasImg] forKey:kNewsTechnologyT1348649580692HasImg];
    NSMutableArray *tempArrayForAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ads) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAds] forKey:kNewsTechnologyT1348649580692Ads];
    [mutableDict setValue:self.title forKey:kNewsTechnologyT1348649580692Title];
    [mutableDict setValue:self.skipID forKey:kNewsTechnologyT1348649580692SkipID];

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

    self.alias = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Alias];
    self.imgType = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692ImgType];
    self.replyCount = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692ReplyCount];
    self.lmodify = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Lmodify];
    self.hasCover = [aDecoder decodeBoolForKey:kNewsTechnologyT1348649580692HasCover];
    self.subtitle = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Subtitle];
    self.url = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Url];
    self.ltitle = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Ltitle];
    self.ptime = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Ptime];
    self.editor = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Editor];
    self.postid = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Postid];
    self.votecount = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692Votecount];
    self.hasHead = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692HasHead];
    self.priority = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692Priority];
    self.digest = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Digest];
    self.tname = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Tname];
    self.template = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Template];
    self.hasAD = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692HasAD];
    self.skipType = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692SkipType];
    self.specialID = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692SpecialID];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Imgsrc];
    self.source = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Source];
    self.ename = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Ename];
    self.imgextra = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Imgextra];
    self.photosetID = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692PhotosetID];
    self.hasIcon = [aDecoder decodeBoolForKey:kNewsTechnologyT1348649580692HasIcon];
    self.order = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692Order];
    self.url3w = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Url3w];
    self.cid = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Cid];
    self.boardid = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Boardid];
    self.docid = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Docid];
    self.hasImg = [aDecoder decodeDoubleForKey:kNewsTechnologyT1348649580692HasImg];
    self.ads = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Ads];
    self.title = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692Title];
    self.skipID = [aDecoder decodeObjectForKey:kNewsTechnologyT1348649580692SkipID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_alias forKey:kNewsTechnologyT1348649580692Alias];
    [aCoder encodeDouble:_imgType forKey:kNewsTechnologyT1348649580692ImgType];
    [aCoder encodeDouble:_replyCount forKey:kNewsTechnologyT1348649580692ReplyCount];
    [aCoder encodeObject:_lmodify forKey:kNewsTechnologyT1348649580692Lmodify];
    [aCoder encodeBool:_hasCover forKey:kNewsTechnologyT1348649580692HasCover];
    [aCoder encodeObject:_subtitle forKey:kNewsTechnologyT1348649580692Subtitle];
    [aCoder encodeObject:_url forKey:kNewsTechnologyT1348649580692Url];
    [aCoder encodeObject:_ltitle forKey:kNewsTechnologyT1348649580692Ltitle];
    [aCoder encodeObject:_ptime forKey:kNewsTechnologyT1348649580692Ptime];
    [aCoder encodeObject:_editor forKey:kNewsTechnologyT1348649580692Editor];
    [aCoder encodeObject:_postid forKey:kNewsTechnologyT1348649580692Postid];
    [aCoder encodeDouble:_votecount forKey:kNewsTechnologyT1348649580692Votecount];
    [aCoder encodeDouble:_hasHead forKey:kNewsTechnologyT1348649580692HasHead];
    [aCoder encodeDouble:_priority forKey:kNewsTechnologyT1348649580692Priority];
    [aCoder encodeObject:_digest forKey:kNewsTechnologyT1348649580692Digest];
    [aCoder encodeObject:_tname forKey:kNewsTechnologyT1348649580692Tname];
    [aCoder encodeObject:_template forKey:kNewsTechnologyT1348649580692Template];
    [aCoder encodeDouble:_hasAD forKey:kNewsTechnologyT1348649580692HasAD];
    [aCoder encodeObject:_skipType forKey:kNewsTechnologyT1348649580692SkipType];
    [aCoder encodeObject:_specialID forKey:kNewsTechnologyT1348649580692SpecialID];
    [aCoder encodeObject:_imgsrc forKey:kNewsTechnologyT1348649580692Imgsrc];
    [aCoder encodeObject:_source forKey:kNewsTechnologyT1348649580692Source];
    [aCoder encodeObject:_ename forKey:kNewsTechnologyT1348649580692Ename];
    [aCoder encodeObject:_imgextra forKey:kNewsTechnologyT1348649580692Imgextra];
    [aCoder encodeObject:_photosetID forKey:kNewsTechnologyT1348649580692PhotosetID];
    [aCoder encodeBool:_hasIcon forKey:kNewsTechnologyT1348649580692HasIcon];
    [aCoder encodeDouble:_order forKey:kNewsTechnologyT1348649580692Order];
    [aCoder encodeObject:_url3w forKey:kNewsTechnologyT1348649580692Url3w];
    [aCoder encodeObject:_cid forKey:kNewsTechnologyT1348649580692Cid];
    [aCoder encodeObject:_boardid forKey:kNewsTechnologyT1348649580692Boardid];
    [aCoder encodeObject:_docid forKey:kNewsTechnologyT1348649580692Docid];
    [aCoder encodeDouble:_hasImg forKey:kNewsTechnologyT1348649580692HasImg];
    [aCoder encodeObject:_ads forKey:kNewsTechnologyT1348649580692Ads];
    [aCoder encodeObject:_title forKey:kNewsTechnologyT1348649580692Title];
    [aCoder encodeObject:_skipID forKey:kNewsTechnologyT1348649580692SkipID];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsTechnologyT1348649580692 *copy = [[NewsTechnologyT1348649580692 alloc] init];
    
    if (copy) {

        copy.alias = [self.alias copyWithZone:zone];
        copy.imgType = self.imgType;
        copy.replyCount = self.replyCount;
        copy.lmodify = [self.lmodify copyWithZone:zone];
        copy.hasCover = self.hasCover;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.ltitle = [self.ltitle copyWithZone:zone];
        copy.ptime = [self.ptime copyWithZone:zone];
        copy.editor = [self.editor copyWithZone:zone];
        copy.postid = [self.postid copyWithZone:zone];
        copy.votecount = self.votecount;
        copy.hasHead = self.hasHead;
        copy.priority = self.priority;
        copy.digest = [self.digest copyWithZone:zone];
        copy.tname = [self.tname copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.hasAD = self.hasAD;
        copy.skipType = [self.skipType copyWithZone:zone];
        copy.specialID = [self.specialID copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.ename = [self.ename copyWithZone:zone];
        copy.imgextra = [self.imgextra copyWithZone:zone];
        copy.photosetID = [self.photosetID copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.order = self.order;
        copy.url3w = [self.url3w copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
        copy.boardid = [self.boardid copyWithZone:zone];
        copy.docid = [self.docid copyWithZone:zone];
        copy.hasImg = self.hasImg;
        copy.ads = [self.ads copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.skipID = [self.skipID copyWithZone:zone];
    }
    
    return copy;
}


@end
