//
//  NewsGameT1348654151579.m
//
//  Created by   on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsGameT1348654151579.h"
#import "NewsGameWapPortal.h"
#import "NewsGameImgextra.h"


NSString *const kNewsGameT1348654151579Alias = @"alias";
NSString *const kNewsGameT1348654151579ReplyCount = @"replyCount";
NSString *const kNewsGameT1348654151579HasCover = @"hasCover";
NSString *const kNewsGameT1348654151579Lmodify = @"lmodify";
NSString *const kNewsGameT1348654151579Subtitle = @"subtitle";
NSString *const kNewsGameT1348654151579ImgType = @"imgType";
NSString *const kNewsGameT1348654151579WapPortal = @"wap_portal";
NSString *const kNewsGameT1348654151579Url = @"url";
NSString *const kNewsGameT1348654151579Ltitle = @"ltitle";
NSString *const kNewsGameT1348654151579Ptime = @"ptime";
NSString *const kNewsGameT1348654151579Editor = @"editor";
NSString *const kNewsGameT1348654151579Postid = @"postid";
NSString *const kNewsGameT1348654151579Votecount = @"votecount";
NSString *const kNewsGameT1348654151579HasHead = @"hasHead";
NSString *const kNewsGameT1348654151579Priority = @"priority";
NSString *const kNewsGameT1348654151579SpecialID = @"specialID";
NSString *const kNewsGameT1348654151579Tname = @"tname";
NSString *const kNewsGameT1348654151579Template = @"template";
NSString *const kNewsGameT1348654151579HasAD = @"hasAD";
NSString *const kNewsGameT1348654151579SkipType = @"skipType";
NSString *const kNewsGameT1348654151579Digest = @"digest";
NSString *const kNewsGameT1348654151579Imgsrc = @"imgsrc";
NSString *const kNewsGameT1348654151579Source = @"source";
NSString *const kNewsGameT1348654151579Ename = @"ename";
NSString *const kNewsGameT1348654151579Imgextra = @"imgextra";
NSString *const kNewsGameT1348654151579HasIcon = @"hasIcon";
NSString *const kNewsGameT1348654151579Order = @"order";
NSString *const kNewsGameT1348654151579Url3w = @"url_3w";
NSString *const kNewsGameT1348654151579Cid = @"cid";
NSString *const kNewsGameT1348654151579Boardid = @"boardid";
NSString *const kNewsGameT1348654151579Docid = @"docid";
NSString *const kNewsGameT1348654151579HasImg = @"hasImg";
NSString *const kNewsGameT1348654151579Title = @"title";
NSString *const kNewsGameT1348654151579SkipID = @"skipID";


@interface NewsGameT1348654151579 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsGameT1348654151579

@synthesize alias = _alias;
@synthesize replyCount = _replyCount;
@synthesize hasCover = _hasCover;
@synthesize lmodify = _lmodify;
@synthesize subtitle = _subtitle;
@synthesize imgType = _imgType;
@synthesize wapPortal = _wapPortal;
@synthesize url = _url;
@synthesize ltitle = _ltitle;
@synthesize ptime = _ptime;
@synthesize editor = _editor;
@synthesize postid = _postid;
@synthesize votecount = _votecount;
@synthesize hasHead = _hasHead;
@synthesize priority = _priority;
@synthesize specialID = _specialID;
@synthesize tname = _tname;
@synthesize template = _template;
@synthesize hasAD = _hasAD;
@synthesize skipType = _skipType;
@synthesize digest = _digest;
@synthesize imgsrc = _imgsrc;
@synthesize source = _source;
@synthesize ename = _ename;
@synthesize imgextra = _imgextra;
@synthesize hasIcon = _hasIcon;
@synthesize order = _order;
@synthesize url3w = _url3w;
@synthesize cid = _cid;
@synthesize boardid = _boardid;
@synthesize docid = _docid;
@synthesize hasImg = _hasImg;
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
            self.alias = [self objectOrNilForKey:kNewsGameT1348654151579Alias fromDictionary:dict];
            self.replyCount = [[self objectOrNilForKey:kNewsGameT1348654151579ReplyCount fromDictionary:dict] doubleValue];
            self.hasCover = [[self objectOrNilForKey:kNewsGameT1348654151579HasCover fromDictionary:dict] boolValue];
            self.lmodify = [self objectOrNilForKey:kNewsGameT1348654151579Lmodify fromDictionary:dict];
            self.subtitle = [self objectOrNilForKey:kNewsGameT1348654151579Subtitle fromDictionary:dict];
            self.imgType = [[self objectOrNilForKey:kNewsGameT1348654151579ImgType fromDictionary:dict] doubleValue];
    NSObject *receivedNewsGameWapPortal = [dict objectForKey:kNewsGameT1348654151579WapPortal];
    NSMutableArray *parsedNewsGameWapPortal = [NSMutableArray array];
    if ([receivedNewsGameWapPortal isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsGameWapPortal) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsGameWapPortal addObject:[NewsGameWapPortal modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsGameWapPortal isKindOfClass:[NSDictionary class]]) {
       [parsedNewsGameWapPortal addObject:[NewsGameWapPortal modelObjectWithDictionary:(NSDictionary *)receivedNewsGameWapPortal]];
    }

    self.wapPortal = [NSArray arrayWithArray:parsedNewsGameWapPortal];
            self.url = [self objectOrNilForKey:kNewsGameT1348654151579Url fromDictionary:dict];
            self.ltitle = [self objectOrNilForKey:kNewsGameT1348654151579Ltitle fromDictionary:dict];
            self.ptime = [self objectOrNilForKey:kNewsGameT1348654151579Ptime fromDictionary:dict];
            self.editor = [self objectOrNilForKey:kNewsGameT1348654151579Editor fromDictionary:dict];
            self.postid = [self objectOrNilForKey:kNewsGameT1348654151579Postid fromDictionary:dict];
            self.votecount = [[self objectOrNilForKey:kNewsGameT1348654151579Votecount fromDictionary:dict] doubleValue];
            self.hasHead = [[self objectOrNilForKey:kNewsGameT1348654151579HasHead fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kNewsGameT1348654151579Priority fromDictionary:dict] doubleValue];
            self.specialID = [self objectOrNilForKey:kNewsGameT1348654151579SpecialID fromDictionary:dict];
            self.tname = [self objectOrNilForKey:kNewsGameT1348654151579Tname fromDictionary:dict];
            self.template = [self objectOrNilForKey:kNewsGameT1348654151579Template fromDictionary:dict];
            self.hasAD = [[self objectOrNilForKey:kNewsGameT1348654151579HasAD fromDictionary:dict] doubleValue];
            self.skipType = [self objectOrNilForKey:kNewsGameT1348654151579SkipType fromDictionary:dict];
            self.digest = [self objectOrNilForKey:kNewsGameT1348654151579Digest fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kNewsGameT1348654151579Imgsrc fromDictionary:dict];
            self.source = [self objectOrNilForKey:kNewsGameT1348654151579Source fromDictionary:dict];
            self.ename = [self objectOrNilForKey:kNewsGameT1348654151579Ename fromDictionary:dict];
    NSObject *receivedNewsGameImgextra = [dict objectForKey:kNewsGameT1348654151579Imgextra];
    NSMutableArray *parsedNewsGameImgextra = [NSMutableArray array];
    if ([receivedNewsGameImgextra isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsGameImgextra) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsGameImgextra addObject:[NewsGameImgextra modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsGameImgextra isKindOfClass:[NSDictionary class]]) {
       [parsedNewsGameImgextra addObject:[NewsGameImgextra modelObjectWithDictionary:(NSDictionary *)receivedNewsGameImgextra]];
    }

    self.imgextra = [NSArray arrayWithArray:parsedNewsGameImgextra];
            self.hasIcon = [[self objectOrNilForKey:kNewsGameT1348654151579HasIcon fromDictionary:dict] boolValue];
            self.order = [[self objectOrNilForKey:kNewsGameT1348654151579Order fromDictionary:dict] doubleValue];
            self.url3w = [self objectOrNilForKey:kNewsGameT1348654151579Url3w fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kNewsGameT1348654151579Cid fromDictionary:dict];
            self.boardid = [self objectOrNilForKey:kNewsGameT1348654151579Boardid fromDictionary:dict];
            self.docid = [self objectOrNilForKey:kNewsGameT1348654151579Docid fromDictionary:dict];
            self.hasImg = [[self objectOrNilForKey:kNewsGameT1348654151579HasImg fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kNewsGameT1348654151579Title fromDictionary:dict];
            self.skipID = [self objectOrNilForKey:kNewsGameT1348654151579SkipID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.alias forKey:kNewsGameT1348654151579Alias];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kNewsGameT1348654151579ReplyCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCover] forKey:kNewsGameT1348654151579HasCover];
    [mutableDict setValue:self.lmodify forKey:kNewsGameT1348654151579Lmodify];
    [mutableDict setValue:self.subtitle forKey:kNewsGameT1348654151579Subtitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgType] forKey:kNewsGameT1348654151579ImgType];
    NSMutableArray *tempArrayForWapPortal = [NSMutableArray array];
    for (NSObject *subArrayObject in self.wapPortal) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWapPortal addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWapPortal addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWapPortal] forKey:kNewsGameT1348654151579WapPortal];
    [mutableDict setValue:self.url forKey:kNewsGameT1348654151579Url];
    [mutableDict setValue:self.ltitle forKey:kNewsGameT1348654151579Ltitle];
    [mutableDict setValue:self.ptime forKey:kNewsGameT1348654151579Ptime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEditor] forKey:kNewsGameT1348654151579Editor];
    [mutableDict setValue:self.postid forKey:kNewsGameT1348654151579Postid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.votecount] forKey:kNewsGameT1348654151579Votecount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasHead] forKey:kNewsGameT1348654151579HasHead];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kNewsGameT1348654151579Priority];
    [mutableDict setValue:self.specialID forKey:kNewsGameT1348654151579SpecialID];
    [mutableDict setValue:self.tname forKey:kNewsGameT1348654151579Tname];
    [mutableDict setValue:self.template forKey:kNewsGameT1348654151579Template];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasAD] forKey:kNewsGameT1348654151579HasAD];
    [mutableDict setValue:self.skipType forKey:kNewsGameT1348654151579SkipType];
    [mutableDict setValue:self.digest forKey:kNewsGameT1348654151579Digest];
    [mutableDict setValue:self.imgsrc forKey:kNewsGameT1348654151579Imgsrc];
    [mutableDict setValue:self.source forKey:kNewsGameT1348654151579Source];
    [mutableDict setValue:self.ename forKey:kNewsGameT1348654151579Ename];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgextra] forKey:kNewsGameT1348654151579Imgextra];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kNewsGameT1348654151579HasIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kNewsGameT1348654151579Order];
    [mutableDict setValue:self.url3w forKey:kNewsGameT1348654151579Url3w];
    [mutableDict setValue:self.cid forKey:kNewsGameT1348654151579Cid];
    [mutableDict setValue:self.boardid forKey:kNewsGameT1348654151579Boardid];
    [mutableDict setValue:self.docid forKey:kNewsGameT1348654151579Docid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasImg] forKey:kNewsGameT1348654151579HasImg];
    [mutableDict setValue:self.title forKey:kNewsGameT1348654151579Title];
    [mutableDict setValue:self.skipID forKey:kNewsGameT1348654151579SkipID];

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

    self.alias = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Alias];
    self.replyCount = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579ReplyCount];
    self.hasCover = [aDecoder decodeBoolForKey:kNewsGameT1348654151579HasCover];
    self.lmodify = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Lmodify];
    self.subtitle = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Subtitle];
    self.imgType = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579ImgType];
    self.wapPortal = [aDecoder decodeObjectForKey:kNewsGameT1348654151579WapPortal];
    self.url = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Url];
    self.ltitle = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Ltitle];
    self.ptime = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Ptime];
    self.editor = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Editor];
    self.postid = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Postid];
    self.votecount = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579Votecount];
    self.hasHead = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579HasHead];
    self.priority = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579Priority];
    self.specialID = [aDecoder decodeObjectForKey:kNewsGameT1348654151579SpecialID];
    self.tname = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Tname];
    self.template = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Template];
    self.hasAD = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579HasAD];
    self.skipType = [aDecoder decodeObjectForKey:kNewsGameT1348654151579SkipType];
    self.digest = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Digest];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Imgsrc];
    self.source = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Source];
    self.ename = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Ename];
    self.imgextra = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Imgextra];
    self.hasIcon = [aDecoder decodeBoolForKey:kNewsGameT1348654151579HasIcon];
    self.order = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579Order];
    self.url3w = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Url3w];
    self.cid = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Cid];
    self.boardid = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Boardid];
    self.docid = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Docid];
    self.hasImg = [aDecoder decodeDoubleForKey:kNewsGameT1348654151579HasImg];
    self.title = [aDecoder decodeObjectForKey:kNewsGameT1348654151579Title];
    self.skipID = [aDecoder decodeObjectForKey:kNewsGameT1348654151579SkipID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_alias forKey:kNewsGameT1348654151579Alias];
    [aCoder encodeDouble:_replyCount forKey:kNewsGameT1348654151579ReplyCount];
    [aCoder encodeBool:_hasCover forKey:kNewsGameT1348654151579HasCover];
    [aCoder encodeObject:_lmodify forKey:kNewsGameT1348654151579Lmodify];
    [aCoder encodeObject:_subtitle forKey:kNewsGameT1348654151579Subtitle];
    [aCoder encodeDouble:_imgType forKey:kNewsGameT1348654151579ImgType];
    [aCoder encodeObject:_wapPortal forKey:kNewsGameT1348654151579WapPortal];
    [aCoder encodeObject:_url forKey:kNewsGameT1348654151579Url];
    [aCoder encodeObject:_ltitle forKey:kNewsGameT1348654151579Ltitle];
    [aCoder encodeObject:_ptime forKey:kNewsGameT1348654151579Ptime];
    [aCoder encodeObject:_editor forKey:kNewsGameT1348654151579Editor];
    [aCoder encodeObject:_postid forKey:kNewsGameT1348654151579Postid];
    [aCoder encodeDouble:_votecount forKey:kNewsGameT1348654151579Votecount];
    [aCoder encodeDouble:_hasHead forKey:kNewsGameT1348654151579HasHead];
    [aCoder encodeDouble:_priority forKey:kNewsGameT1348654151579Priority];
    [aCoder encodeObject:_specialID forKey:kNewsGameT1348654151579SpecialID];
    [aCoder encodeObject:_tname forKey:kNewsGameT1348654151579Tname];
    [aCoder encodeObject:_template forKey:kNewsGameT1348654151579Template];
    [aCoder encodeDouble:_hasAD forKey:kNewsGameT1348654151579HasAD];
    [aCoder encodeObject:_skipType forKey:kNewsGameT1348654151579SkipType];
    [aCoder encodeObject:_digest forKey:kNewsGameT1348654151579Digest];
    [aCoder encodeObject:_imgsrc forKey:kNewsGameT1348654151579Imgsrc];
    [aCoder encodeObject:_source forKey:kNewsGameT1348654151579Source];
    [aCoder encodeObject:_ename forKey:kNewsGameT1348654151579Ename];
    [aCoder encodeObject:_imgextra forKey:kNewsGameT1348654151579Imgextra];
    [aCoder encodeBool:_hasIcon forKey:kNewsGameT1348654151579HasIcon];
    [aCoder encodeDouble:_order forKey:kNewsGameT1348654151579Order];
    [aCoder encodeObject:_url3w forKey:kNewsGameT1348654151579Url3w];
    [aCoder encodeObject:_cid forKey:kNewsGameT1348654151579Cid];
    [aCoder encodeObject:_boardid forKey:kNewsGameT1348654151579Boardid];
    [aCoder encodeObject:_docid forKey:kNewsGameT1348654151579Docid];
    [aCoder encodeDouble:_hasImg forKey:kNewsGameT1348654151579HasImg];
    [aCoder encodeObject:_title forKey:kNewsGameT1348654151579Title];
    [aCoder encodeObject:_skipID forKey:kNewsGameT1348654151579SkipID];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsGameT1348654151579 *copy = [[NewsGameT1348654151579 alloc] init];
    
    if (copy) {

        copy.alias = [self.alias copyWithZone:zone];
        copy.replyCount = self.replyCount;
        copy.hasCover = self.hasCover;
        copy.lmodify = [self.lmodify copyWithZone:zone];
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.imgType = self.imgType;
        copy.wapPortal = [self.wapPortal copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.ltitle = [self.ltitle copyWithZone:zone];
        copy.ptime = [self.ptime copyWithZone:zone];
        copy.editor = [self.editor copyWithZone:zone];
        copy.postid = [self.postid copyWithZone:zone];
        copy.votecount = self.votecount;
        copy.hasHead = self.hasHead;
        copy.priority = self.priority;
        copy.specialID = [self.specialID copyWithZone:zone];
        copy.tname = [self.tname copyWithZone:zone];
        copy.template = [self.template copyWithZone:zone];
        copy.hasAD = self.hasAD;
        copy.skipType = [self.skipType copyWithZone:zone];
        copy.digest = [self.digest copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.ename = [self.ename copyWithZone:zone];
        copy.imgextra = [self.imgextra copyWithZone:zone];
        copy.hasIcon = self.hasIcon;
        copy.order = self.order;
        copy.url3w = [self.url3w copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
        copy.boardid = [self.boardid copyWithZone:zone];
        copy.docid = [self.docid copyWithZone:zone];
        copy.hasImg = self.hasImg;
        copy.title = [self.title copyWithZone:zone];
        copy.skipID = [self.skipID copyWithZone:zone];
    }
    
    return copy;
}


@end
