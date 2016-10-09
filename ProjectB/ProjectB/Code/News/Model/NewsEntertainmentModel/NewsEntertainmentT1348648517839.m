//
//  NewsEntertainmentT1348648517839.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsEntertainmentT1348648517839.h"
#import "NewsEntertainmentImgextra.h"
#import "NewsEntertainmentAds.h"


NSString *const kNewsEntertainmentT1348648517839Tname = @"tname";
NSString *const kNewsEntertainmentT1348648517839Ptime = @"ptime";
NSString *const kNewsEntertainmentT1348648517839Source = @"source";
NSString *const kNewsEntertainmentT1348648517839Title = @"title";
NSString *const kNewsEntertainmentT1348648517839Url = @"url";
NSString *const kNewsEntertainmentT1348648517839Imgextra = @"imgextra";
NSString *const kNewsEntertainmentT1348648517839Url3w = @"url_3w";
NSString *const kNewsEntertainmentT1348648517839PhotosetID = @"photosetID";
NSString *const kNewsEntertainmentT1348648517839Postid = @"postid";
NSString *const kNewsEntertainmentT1348648517839HasHead = @"hasHead";
NSString *const kNewsEntertainmentT1348648517839HasImg = @"hasImg";
NSString *const kNewsEntertainmentT1348648517839Lmodify = @"lmodify";
NSString *const kNewsEntertainmentT1348648517839SkipType = @"skipType";
NSString *const kNewsEntertainmentT1348648517839Template = @"template";
NSString *const kNewsEntertainmentT1348648517839Votecount = @"votecount";
NSString *const kNewsEntertainmentT1348648517839Docid = @"docid";
NSString *const kNewsEntertainmentT1348648517839Alias = @"alias";
NSString *const kNewsEntertainmentT1348648517839HasAD = @"hasAD";
NSString *const kNewsEntertainmentT1348648517839Priority = @"priority";
NSString *const kNewsEntertainmentT1348648517839ReplyCount = @"replyCount";
NSString *const kNewsEntertainmentT1348648517839Cid = @"cid";
NSString *const kNewsEntertainmentT1348648517839HasCover = @"hasCover";
NSString *const kNewsEntertainmentT1348648517839Imgsrc = @"imgsrc";
NSString *const kNewsEntertainmentT1348648517839Ltitle = @"ltitle";
NSString *const kNewsEntertainmentT1348648517839HasIcon = @"hasIcon";
NSString *const kNewsEntertainmentT1348648517839Ads = @"ads";
NSString *const kNewsEntertainmentT1348648517839Subtitle = @"subtitle";
NSString *const kNewsEntertainmentT1348648517839Ename = @"ename";
NSString *const kNewsEntertainmentT1348648517839SkipID = @"skipID";
NSString *const kNewsEntertainmentT1348648517839Boardid = @"boardid";
NSString *const kNewsEntertainmentT1348648517839Order = @"order";
NSString *const kNewsEntertainmentT1348648517839Digest = @"digest";


@interface NewsEntertainmentT1348648517839 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsEntertainmentT1348648517839

@synthesize tname = _tname;
@synthesize ptime = _ptime;
@synthesize source = _source;
@synthesize title = _title;
@synthesize url = _url;
@synthesize imgextra = _imgextra;
@synthesize url3w = _url3w;
@synthesize photosetID = _photosetID;
@synthesize postid = _postid;
@synthesize hasHead = _hasHead;
@synthesize hasImg = _hasImg;
@synthesize lmodify = _lmodify;
@synthesize skipType = _skipType;
@synthesize template = _template;
@synthesize votecount = _votecount;
@synthesize docid = _docid;
@synthesize alias = _alias;
@synthesize hasAD = _hasAD;
@synthesize priority = _priority;
@synthesize replyCount = _replyCount;
@synthesize cid = _cid;
@synthesize hasCover = _hasCover;
@synthesize imgsrc = _imgsrc;
@synthesize ltitle = _ltitle;
@synthesize hasIcon = _hasIcon;
@synthesize ads = _ads;
@synthesize subtitle = _subtitle;
@synthesize ename = _ename;
@synthesize skipID = _skipID;
@synthesize boardid = _boardid;
@synthesize order = _order;
@synthesize digest = _digest;


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
            self.tname = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Tname fromDictionary:dict];
            self.ptime = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Ptime fromDictionary:dict];
            self.source = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Source fromDictionary:dict];
            self.title = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Title fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Url fromDictionary:dict];
    NSObject *receivedNewsEntertainmentImgextra = [dict objectForKey:kNewsEntertainmentT1348648517839Imgextra];
    NSMutableArray *parsedNewsEntertainmentImgextra = [NSMutableArray array];
    if ([receivedNewsEntertainmentImgextra isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsEntertainmentImgextra) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsEntertainmentImgextra addObject:[NewsEntertainmentImgextra modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsEntertainmentImgextra isKindOfClass:[NSDictionary class]]) {
       [parsedNewsEntertainmentImgextra addObject:[NewsEntertainmentImgextra modelObjectWithDictionary:(NSDictionary *)receivedNewsEntertainmentImgextra]];
    }

    self.imgextra = [NSArray arrayWithArray:parsedNewsEntertainmentImgextra];
            self.url3w = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Url3w fromDictionary:dict];
            self.photosetID = [self objectOrNilForKey:kNewsEntertainmentT1348648517839PhotosetID fromDictionary:dict];
            self.postid = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Postid fromDictionary:dict];
            self.hasHead = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839HasHead fromDictionary:dict] doubleValue];
            self.hasImg = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839HasImg fromDictionary:dict] doubleValue];
            self.lmodify = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Lmodify fromDictionary:dict];
            self.skipType = [self objectOrNilForKey:kNewsEntertainmentT1348648517839SkipType fromDictionary:dict];
            self.template = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Template fromDictionary:dict];
            self.votecount = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839Votecount fromDictionary:dict] doubleValue];
            self.docid = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Docid fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Alias fromDictionary:dict];
            self.hasAD = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839HasAD fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839Priority fromDictionary:dict] doubleValue];
            self.replyCount = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839ReplyCount fromDictionary:dict] doubleValue];
            self.cid = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Cid fromDictionary:dict];
            self.hasCover = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839HasCover fromDictionary:dict] boolValue];
            self.imgsrc = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Imgsrc fromDictionary:dict];
            self.ltitle = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Ltitle fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839HasIcon fromDictionary:dict] boolValue];
    NSObject *receivedNewsEntertainmentAds = [dict objectForKey:kNewsEntertainmentT1348648517839Ads];
    NSMutableArray *parsedNewsEntertainmentAds = [NSMutableArray array];
    if ([receivedNewsEntertainmentAds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsEntertainmentAds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsEntertainmentAds addObject:[NewsEntertainmentAds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsEntertainmentAds isKindOfClass:[NSDictionary class]]) {
       [parsedNewsEntertainmentAds addObject:[NewsEntertainmentAds modelObjectWithDictionary:(NSDictionary *)receivedNewsEntertainmentAds]];
    }

    self.ads = [NSArray arrayWithArray:parsedNewsEntertainmentAds];
            self.subtitle = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Subtitle fromDictionary:dict];
            self.ename = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Ename fromDictionary:dict];
            self.skipID = [self objectOrNilForKey:kNewsEntertainmentT1348648517839SkipID fromDictionary:dict];
            self.boardid = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Boardid fromDictionary:dict];
            self.order = [[self objectOrNilForKey:kNewsEntertainmentT1348648517839Order fromDictionary:dict] doubleValue];
            self.digest = [self objectOrNilForKey:kNewsEntertainmentT1348648517839Digest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tname forKey:kNewsEntertainmentT1348648517839Tname];
    [mutableDict setValue:self.ptime forKey:kNewsEntertainmentT1348648517839Ptime];
    [mutableDict setValue:self.source forKey:kNewsEntertainmentT1348648517839Source];
    [mutableDict setValue:self.title forKey:kNewsEntertainmentT1348648517839Title];
    [mutableDict setValue:self.url forKey:kNewsEntertainmentT1348648517839Url];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgextra] forKey:kNewsEntertainmentT1348648517839Imgextra];
    [mutableDict setValue:self.url3w forKey:kNewsEntertainmentT1348648517839Url3w];
    [mutableDict setValue:self.photosetID forKey:kNewsEntertainmentT1348648517839PhotosetID];
    [mutableDict setValue:self.postid forKey:kNewsEntertainmentT1348648517839Postid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasHead] forKey:kNewsEntertainmentT1348648517839HasHead];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasImg] forKey:kNewsEntertainmentT1348648517839HasImg];
    [mutableDict setValue:self.lmodify forKey:kNewsEntertainmentT1348648517839Lmodify];
    [mutableDict setValue:self.skipType forKey:kNewsEntertainmentT1348648517839SkipType];
    [mutableDict setValue:self.template forKey:kNewsEntertainmentT1348648517839Template];
    [mutableDict setValue:[NSNumber numberWithDouble:self.votecount] forKey:kNewsEntertainmentT1348648517839Votecount];
    [mutableDict setValue:self.docid forKey:kNewsEntertainmentT1348648517839Docid];
    [mutableDict setValue:self.alias forKey:kNewsEntertainmentT1348648517839Alias];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasAD] forKey:kNewsEntertainmentT1348648517839HasAD];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kNewsEntertainmentT1348648517839Priority];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kNewsEntertainmentT1348648517839ReplyCount];
    [mutableDict setValue:self.cid forKey:kNewsEntertainmentT1348648517839Cid];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCover] forKey:kNewsEntertainmentT1348648517839HasCover];
    [mutableDict setValue:self.imgsrc forKey:kNewsEntertainmentT1348648517839Imgsrc];
    [mutableDict setValue:self.ltitle forKey:kNewsEntertainmentT1348648517839Ltitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kNewsEntertainmentT1348648517839HasIcon];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAds] forKey:kNewsEntertainmentT1348648517839Ads];
    [mutableDict setValue:self.subtitle forKey:kNewsEntertainmentT1348648517839Subtitle];
    [mutableDict setValue:self.ename forKey:kNewsEntertainmentT1348648517839Ename];
    [mutableDict setValue:self.skipID forKey:kNewsEntertainmentT1348648517839SkipID];
    [mutableDict setValue:self.boardid forKey:kNewsEntertainmentT1348648517839Boardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kNewsEntertainmentT1348648517839Order];
    [mutableDict setValue:self.digest forKey:kNewsEntertainmentT1348648517839Digest];

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

    self.tname = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Tname];
    self.ptime = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Ptime];
    self.source = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Source];
    self.title = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Title];
    self.url = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Url];
    self.imgextra = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Imgextra];
    self.url3w = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Url3w];
    self.photosetID = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839PhotosetID];
    self.postid = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Postid];
    self.hasHead = [aDecoder decodeDoubleForKey:kNewsEntertainmentT1348648517839HasHead];
    self.hasImg = [aDecoder decodeDoubleForKey:kNewsEntertainmentT1348648517839HasImg];
    self.lmodify = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Lmodify];
    self.skipType = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839SkipType];
    self.template = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Template];
    self.votecount = [aDecoder decodeDoubleForKey:kNewsEntertainmentT1348648517839Votecount];
    self.docid = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Docid];
    self.alias = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Alias];
    self.hasAD = [aDecoder decodeDoubleForKey:kNewsEntertainmentT1348648517839HasAD];
    self.priority = [aDecoder decodeDoubleForKey:kNewsEntertainmentT1348648517839Priority];
    self.replyCount = [aDecoder decodeDoubleForKey:kNewsEntertainmentT1348648517839ReplyCount];
    self.cid = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Cid];
    self.hasCover = [aDecoder decodeBoolForKey:kNewsEntertainmentT1348648517839HasCover];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Imgsrc];
    self.ltitle = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Ltitle];
    self.hasIcon = [aDecoder decodeBoolForKey:kNewsEntertainmentT1348648517839HasIcon];
    self.ads = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Ads];
    self.subtitle = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Subtitle];
    self.ename = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Ename];
    self.skipID = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839SkipID];
    self.boardid = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Boardid];
    self.order = [aDecoder decodeDoubleForKey:kNewsEntertainmentT1348648517839Order];
    self.digest = [aDecoder decodeObjectForKey:kNewsEntertainmentT1348648517839Digest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tname forKey:kNewsEntertainmentT1348648517839Tname];
    [aCoder encodeObject:_ptime forKey:kNewsEntertainmentT1348648517839Ptime];
    [aCoder encodeObject:_source forKey:kNewsEntertainmentT1348648517839Source];
    [aCoder encodeObject:_title forKey:kNewsEntertainmentT1348648517839Title];
    [aCoder encodeObject:_url forKey:kNewsEntertainmentT1348648517839Url];
    [aCoder encodeObject:_imgextra forKey:kNewsEntertainmentT1348648517839Imgextra];
    [aCoder encodeObject:_url3w forKey:kNewsEntertainmentT1348648517839Url3w];
    [aCoder encodeObject:_photosetID forKey:kNewsEntertainmentT1348648517839PhotosetID];
    [aCoder encodeObject:_postid forKey:kNewsEntertainmentT1348648517839Postid];
    [aCoder encodeDouble:_hasHead forKey:kNewsEntertainmentT1348648517839HasHead];
    [aCoder encodeDouble:_hasImg forKey:kNewsEntertainmentT1348648517839HasImg];
    [aCoder encodeObject:_lmodify forKey:kNewsEntertainmentT1348648517839Lmodify];
    [aCoder encodeObject:_skipType forKey:kNewsEntertainmentT1348648517839SkipType];
    [aCoder encodeObject:_template forKey:kNewsEntertainmentT1348648517839Template];
    [aCoder encodeDouble:_votecount forKey:kNewsEntertainmentT1348648517839Votecount];
    [aCoder encodeObject:_docid forKey:kNewsEntertainmentT1348648517839Docid];
    [aCoder encodeObject:_alias forKey:kNewsEntertainmentT1348648517839Alias];
    [aCoder encodeDouble:_hasAD forKey:kNewsEntertainmentT1348648517839HasAD];
    [aCoder encodeDouble:_priority forKey:kNewsEntertainmentT1348648517839Priority];
    [aCoder encodeDouble:_replyCount forKey:kNewsEntertainmentT1348648517839ReplyCount];
    [aCoder encodeObject:_cid forKey:kNewsEntertainmentT1348648517839Cid];
    [aCoder encodeBool:_hasCover forKey:kNewsEntertainmentT1348648517839HasCover];
    [aCoder encodeObject:_imgsrc forKey:kNewsEntertainmentT1348648517839Imgsrc];
    [aCoder encodeObject:_ltitle forKey:kNewsEntertainmentT1348648517839Ltitle];
    [aCoder encodeBool:_hasIcon forKey:kNewsEntertainmentT1348648517839HasIcon];
    [aCoder encodeObject:_ads forKey:kNewsEntertainmentT1348648517839Ads];
    [aCoder encodeObject:_subtitle forKey:kNewsEntertainmentT1348648517839Subtitle];
    [aCoder encodeObject:_ename forKey:kNewsEntertainmentT1348648517839Ename];
    [aCoder encodeObject:_skipID forKey:kNewsEntertainmentT1348648517839SkipID];
    [aCoder encodeObject:_boardid forKey:kNewsEntertainmentT1348648517839Boardid];
    [aCoder encodeDouble:_order forKey:kNewsEntertainmentT1348648517839Order];
    [aCoder encodeObject:_digest forKey:kNewsEntertainmentT1348648517839Digest];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsEntertainmentT1348648517839 *copy = [[NewsEntertainmentT1348648517839 alloc] init];
    
    if (copy) {

        copy.tname = [self.tname copyWithZone:zone];
        copy.ptime = [self.ptime copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.imgextra = [self.imgextra copyWithZone:zone];
        copy.url3w = [self.url3w copyWithZone:zone];
        copy.photosetID = [self.photosetID copyWithZone:zone];
        copy.postid = [self.postid copyWithZone:zone];
        copy.hasHead = self.hasHead;
        copy.hasImg = self.hasImg;
        copy.lmodify = [self.lmodify copyWithZone:zone];
        copy.skipType = [self.skipType copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.votecount = self.votecount;
        copy.docid = [self.docid copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.hasAD = self.hasAD;
        copy.priority = self.priority;
        copy.replyCount = self.replyCount;
        copy.cid = [self.cid copyWithZone:zone];
        copy.hasCover = self.hasCover;
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.ltitle = [self.ltitle copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.ads = [self.ads copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.ename = [self.ename copyWithZone:zone];
        copy.skipID = [self.skipID copyWithZone:zone];
        copy.boardid = [self.boardid copyWithZone:zone];
        copy.order = self.order;
        copy.digest = [self.digest copyWithZone:zone];
    }
    
    return copy;
}


@end
