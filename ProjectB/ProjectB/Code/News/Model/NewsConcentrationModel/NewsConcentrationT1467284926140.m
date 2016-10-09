//
//  NewsConcentrationT1467284926140.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsConcentrationT1467284926140.h"
#import "NewsConcentrationImgextra.h"


NSString *const kNewsConcentrationT1467284926140Tname = @"tname";
NSString *const kNewsConcentrationT1467284926140Ptime = @"ptime";
NSString *const kNewsConcentrationT1467284926140Source = @"source";
NSString *const kNewsConcentrationT1467284926140Title = @"title";
NSString *const kNewsConcentrationT1467284926140Url = @"url";
NSString *const kNewsConcentrationT1467284926140Imgextra = @"imgextra";
NSString *const kNewsConcentrationT1467284926140Url3w = @"url_3w";
NSString *const kNewsConcentrationT1467284926140PhotosetID = @"photosetID";
NSString *const kNewsConcentrationT1467284926140Postid = @"postid";
NSString *const kNewsConcentrationT1467284926140HasHead = @"hasHead";
NSString *const kNewsConcentrationT1467284926140HasImg = @"hasImg";
NSString *const kNewsConcentrationT1467284926140Lmodify = @"lmodify";
NSString *const kNewsConcentrationT1467284926140SkipType = @"skipType";
NSString *const kNewsConcentrationT1467284926140Template = @"template";
NSString *const kNewsConcentrationT1467284926140Votecount = @"votecount";
NSString *const kNewsConcentrationT1467284926140Docid = @"docid";
NSString *const kNewsConcentrationT1467284926140Alias = @"alias";
NSString *const kNewsConcentrationT1467284926140HasAD = @"hasAD";
NSString *const kNewsConcentrationT1467284926140Priority = @"priority";
NSString *const kNewsConcentrationT1467284926140ReplyCount = @"replyCount";
NSString *const kNewsConcentrationT1467284926140Cid = @"cid";
NSString *const kNewsConcentrationT1467284926140HasCover = @"hasCover";
NSString *const kNewsConcentrationT1467284926140Imgsrc = @"imgsrc";
NSString *const kNewsConcentrationT1467284926140Ltitle = @"ltitle";
NSString *const kNewsConcentrationT1467284926140HasIcon = @"hasIcon";
NSString *const kNewsConcentrationT1467284926140Subtitle = @"subtitle";
NSString *const kNewsConcentrationT1467284926140Ename = @"ename";
NSString *const kNewsConcentrationT1467284926140SpecialID = @"specialID";
NSString *const kNewsConcentrationT1467284926140SkipID = @"skipID";
NSString *const kNewsConcentrationT1467284926140Boardid = @"boardid";
NSString *const kNewsConcentrationT1467284926140Order = @"order";
NSString *const kNewsConcentrationT1467284926140Digest = @"digest";


@interface NewsConcentrationT1467284926140 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsConcentrationT1467284926140

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
@synthesize subtitle = _subtitle;
@synthesize ename = _ename;
@synthesize specialID = _specialID;
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
            self.tname = [self objectOrNilForKey:kNewsConcentrationT1467284926140Tname fromDictionary:dict];
            self.ptime = [self objectOrNilForKey:kNewsConcentrationT1467284926140Ptime fromDictionary:dict];
            self.source = [self objectOrNilForKey:kNewsConcentrationT1467284926140Source fromDictionary:dict];
            self.title = [self objectOrNilForKey:kNewsConcentrationT1467284926140Title fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsConcentrationT1467284926140Url fromDictionary:dict];
    NSObject *receivedNewsConcentrationImgextra = [dict objectForKey:kNewsConcentrationT1467284926140Imgextra];
    NSMutableArray *parsedNewsConcentrationImgextra = [NSMutableArray array];
    if ([receivedNewsConcentrationImgextra isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsConcentrationImgextra) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsConcentrationImgextra addObject:[NewsConcentrationImgextra modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsConcentrationImgextra isKindOfClass:[NSDictionary class]]) {
       [parsedNewsConcentrationImgextra addObject:[NewsConcentrationImgextra modelObjectWithDictionary:(NSDictionary *)receivedNewsConcentrationImgextra]];
    }

    self.imgextra = [NSArray arrayWithArray:parsedNewsConcentrationImgextra];
            self.url3w = [self objectOrNilForKey:kNewsConcentrationT1467284926140Url3w fromDictionary:dict];
            self.photosetID = [self objectOrNilForKey:kNewsConcentrationT1467284926140PhotosetID fromDictionary:dict];
            self.postid = [self objectOrNilForKey:kNewsConcentrationT1467284926140Postid fromDictionary:dict];
            self.hasHead = [[self objectOrNilForKey:kNewsConcentrationT1467284926140HasHead fromDictionary:dict] doubleValue];
            self.hasImg = [[self objectOrNilForKey:kNewsConcentrationT1467284926140HasImg fromDictionary:dict] doubleValue];
            self.lmodify = [self objectOrNilForKey:kNewsConcentrationT1467284926140Lmodify fromDictionary:dict];
            self.skipType = [self objectOrNilForKey:kNewsConcentrationT1467284926140SkipType fromDictionary:dict];
            self.template = [self objectOrNilForKey:kNewsConcentrationT1467284926140Template fromDictionary:dict];
            self.votecount = [[self objectOrNilForKey:kNewsConcentrationT1467284926140Votecount fromDictionary:dict] doubleValue];
            self.docid = [self objectOrNilForKey:kNewsConcentrationT1467284926140Docid fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kNewsConcentrationT1467284926140Alias fromDictionary:dict];
            self.hasAD = [[self objectOrNilForKey:kNewsConcentrationT1467284926140HasAD fromDictionary:dict] doubleValue];
            self.priority = [[self objectOrNilForKey:kNewsConcentrationT1467284926140Priority fromDictionary:dict] doubleValue];
            self.replyCount = [[self objectOrNilForKey:kNewsConcentrationT1467284926140ReplyCount fromDictionary:dict] doubleValue];
            self.cid = [self objectOrNilForKey:kNewsConcentrationT1467284926140Cid fromDictionary:dict];
            self.hasCover = [[self objectOrNilForKey:kNewsConcentrationT1467284926140HasCover fromDictionary:dict] boolValue];
            self.imgsrc = [self objectOrNilForKey:kNewsConcentrationT1467284926140Imgsrc fromDictionary:dict];
            self.ltitle = [self objectOrNilForKey:kNewsConcentrationT1467284926140Ltitle fromDictionary:dict];
            self.hasIcon = [[self objectOrNilForKey:kNewsConcentrationT1467284926140HasIcon fromDictionary:dict] boolValue];
            self.subtitle = [self objectOrNilForKey:kNewsConcentrationT1467284926140Subtitle fromDictionary:dict];
            self.ename = [self objectOrNilForKey:kNewsConcentrationT1467284926140Ename fromDictionary:dict];
            self.specialID = [self objectOrNilForKey:kNewsConcentrationT1467284926140SpecialID fromDictionary:dict];
            self.skipID = [self objectOrNilForKey:kNewsConcentrationT1467284926140SkipID fromDictionary:dict];
            self.boardid = [self objectOrNilForKey:kNewsConcentrationT1467284926140Boardid fromDictionary:dict];
            self.order = [[self objectOrNilForKey:kNewsConcentrationT1467284926140Order fromDictionary:dict] doubleValue];
            self.digest = [self objectOrNilForKey:kNewsConcentrationT1467284926140Digest fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tname forKey:kNewsConcentrationT1467284926140Tname];
    [mutableDict setValue:self.ptime forKey:kNewsConcentrationT1467284926140Ptime];
    [mutableDict setValue:self.source forKey:kNewsConcentrationT1467284926140Source];
    [mutableDict setValue:self.title forKey:kNewsConcentrationT1467284926140Title];
    [mutableDict setValue:self.url forKey:kNewsConcentrationT1467284926140Url];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImgextra] forKey:kNewsConcentrationT1467284926140Imgextra];
    [mutableDict setValue:self.url3w forKey:kNewsConcentrationT1467284926140Url3w];
    [mutableDict setValue:self.photosetID forKey:kNewsConcentrationT1467284926140PhotosetID];
    [mutableDict setValue:self.postid forKey:kNewsConcentrationT1467284926140Postid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasHead] forKey:kNewsConcentrationT1467284926140HasHead];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasImg] forKey:kNewsConcentrationT1467284926140HasImg];
    [mutableDict setValue:self.lmodify forKey:kNewsConcentrationT1467284926140Lmodify];
    [mutableDict setValue:self.skipType forKey:kNewsConcentrationT1467284926140SkipType];
    [mutableDict setValue:self.template forKey:kNewsConcentrationT1467284926140Template];
    [mutableDict setValue:[NSNumber numberWithDouble:self.votecount] forKey:kNewsConcentrationT1467284926140Votecount];
    [mutableDict setValue:self.docid forKey:kNewsConcentrationT1467284926140Docid];
    [mutableDict setValue:self.alias forKey:kNewsConcentrationT1467284926140Alias];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasAD] forKey:kNewsConcentrationT1467284926140HasAD];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priority] forKey:kNewsConcentrationT1467284926140Priority];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kNewsConcentrationT1467284926140ReplyCount];
    [mutableDict setValue:self.cid forKey:kNewsConcentrationT1467284926140Cid];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCover] forKey:kNewsConcentrationT1467284926140HasCover];
    [mutableDict setValue:self.imgsrc forKey:kNewsConcentrationT1467284926140Imgsrc];
    [mutableDict setValue:self.ltitle forKey:kNewsConcentrationT1467284926140Ltitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasIcon] forKey:kNewsConcentrationT1467284926140HasIcon];
    [mutableDict setValue:self.subtitle forKey:kNewsConcentrationT1467284926140Subtitle];
    [mutableDict setValue:self.ename forKey:kNewsConcentrationT1467284926140Ename];
    [mutableDict setValue:self.specialID forKey:kNewsConcentrationT1467284926140SpecialID];
    [mutableDict setValue:self.skipID forKey:kNewsConcentrationT1467284926140SkipID];
    [mutableDict setValue:self.boardid forKey:kNewsConcentrationT1467284926140Boardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kNewsConcentrationT1467284926140Order];
    [mutableDict setValue:self.digest forKey:kNewsConcentrationT1467284926140Digest];

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

    self.tname = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Tname];
    self.ptime = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Ptime];
    self.source = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Source];
    self.title = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Title];
    self.url = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Url];
    self.imgextra = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Imgextra];
    self.url3w = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Url3w];
    self.photosetID = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140PhotosetID];
    self.postid = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Postid];
    self.hasHead = [aDecoder decodeDoubleForKey:kNewsConcentrationT1467284926140HasHead];
    self.hasImg = [aDecoder decodeDoubleForKey:kNewsConcentrationT1467284926140HasImg];
    self.lmodify = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Lmodify];
    self.skipType = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140SkipType];
    self.template = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Template];
    self.votecount = [aDecoder decodeDoubleForKey:kNewsConcentrationT1467284926140Votecount];
    self.docid = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Docid];
    self.alias = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Alias];
    self.hasAD = [aDecoder decodeDoubleForKey:kNewsConcentrationT1467284926140HasAD];
    self.priority = [aDecoder decodeDoubleForKey:kNewsConcentrationT1467284926140Priority];
    self.replyCount = [aDecoder decodeDoubleForKey:kNewsConcentrationT1467284926140ReplyCount];
    self.cid = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Cid];
    self.hasCover = [aDecoder decodeBoolForKey:kNewsConcentrationT1467284926140HasCover];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Imgsrc];
    self.ltitle = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Ltitle];
    self.hasIcon = [aDecoder decodeBoolForKey:kNewsConcentrationT1467284926140HasIcon];
    self.subtitle = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Subtitle];
    self.ename = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Ename];
    self.specialID = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140SpecialID];
    self.skipID = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140SkipID];
    self.boardid = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Boardid];
    self.order = [aDecoder decodeDoubleForKey:kNewsConcentrationT1467284926140Order];
    self.digest = [aDecoder decodeObjectForKey:kNewsConcentrationT1467284926140Digest];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tname forKey:kNewsConcentrationT1467284926140Tname];
    [aCoder encodeObject:_ptime forKey:kNewsConcentrationT1467284926140Ptime];
    [aCoder encodeObject:_source forKey:kNewsConcentrationT1467284926140Source];
    [aCoder encodeObject:_title forKey:kNewsConcentrationT1467284926140Title];
    [aCoder encodeObject:_url forKey:kNewsConcentrationT1467284926140Url];
    [aCoder encodeObject:_imgextra forKey:kNewsConcentrationT1467284926140Imgextra];
    [aCoder encodeObject:_url3w forKey:kNewsConcentrationT1467284926140Url3w];
    [aCoder encodeObject:_photosetID forKey:kNewsConcentrationT1467284926140PhotosetID];
    [aCoder encodeObject:_postid forKey:kNewsConcentrationT1467284926140Postid];
    [aCoder encodeDouble:_hasHead forKey:kNewsConcentrationT1467284926140HasHead];
    [aCoder encodeDouble:_hasImg forKey:kNewsConcentrationT1467284926140HasImg];
    [aCoder encodeObject:_lmodify forKey:kNewsConcentrationT1467284926140Lmodify];
    [aCoder encodeObject:_skipType forKey:kNewsConcentrationT1467284926140SkipType];
    [aCoder encodeObject:_template forKey:kNewsConcentrationT1467284926140Template];
    [aCoder encodeDouble:_votecount forKey:kNewsConcentrationT1467284926140Votecount];
    [aCoder encodeObject:_docid forKey:kNewsConcentrationT1467284926140Docid];
    [aCoder encodeObject:_alias forKey:kNewsConcentrationT1467284926140Alias];
    [aCoder encodeDouble:_hasAD forKey:kNewsConcentrationT1467284926140HasAD];
    [aCoder encodeDouble:_priority forKey:kNewsConcentrationT1467284926140Priority];
    [aCoder encodeDouble:_replyCount forKey:kNewsConcentrationT1467284926140ReplyCount];
    [aCoder encodeObject:_cid forKey:kNewsConcentrationT1467284926140Cid];
    [aCoder encodeBool:_hasCover forKey:kNewsConcentrationT1467284926140HasCover];
    [aCoder encodeObject:_imgsrc forKey:kNewsConcentrationT1467284926140Imgsrc];
    [aCoder encodeObject:_ltitle forKey:kNewsConcentrationT1467284926140Ltitle];
    [aCoder encodeBool:_hasIcon forKey:kNewsConcentrationT1467284926140HasIcon];
    [aCoder encodeObject:_subtitle forKey:kNewsConcentrationT1467284926140Subtitle];
    [aCoder encodeObject:_ename forKey:kNewsConcentrationT1467284926140Ename];
    [aCoder encodeObject:_specialID forKey:kNewsConcentrationT1467284926140SpecialID];
    [aCoder encodeObject:_skipID forKey:kNewsConcentrationT1467284926140SkipID];
    [aCoder encodeObject:_boardid forKey:kNewsConcentrationT1467284926140Boardid];
    [aCoder encodeDouble:_order forKey:kNewsConcentrationT1467284926140Order];
    [aCoder encodeObject:_digest forKey:kNewsConcentrationT1467284926140Digest];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsConcentrationT1467284926140 *copy = [[NewsConcentrationT1467284926140 alloc] init];
    
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
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.ename = [self.ename copyWithZone:zone];
        copy.specialID = [self.specialID copyWithZone:zone];
        copy.skipID = [self.skipID copyWithZone:zone];
        copy.boardid = [self.boardid copyWithZone:zone];
        copy.order = self.order;
        copy.digest = [self.digest copyWithZone:zone];
    }
    
    return copy;
}


@end
