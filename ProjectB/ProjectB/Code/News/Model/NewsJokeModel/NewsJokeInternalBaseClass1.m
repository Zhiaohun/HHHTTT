//
//  NewsJokeInternalBaseClass1.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsJokeInternalBaseClass1.h"


NSString *const kNewsJokeInternalBaseClass1RecType = @"recType";
NSString *const kNewsJokeInternalBaseClass1Replyid = @"replyid";
NSString *const kNewsJokeInternalBaseClass1Pixel = @"pixel";
NSString *const kNewsJokeInternalBaseClass1Digest = @"digest";
NSString *const kNewsJokeInternalBaseClass1PicCount = @"picCount";
NSString *const kNewsJokeInternalBaseClass1Prompt = @"prompt";
NSString *const kNewsJokeInternalBaseClass1DownTimes = @"downTimes";
NSString *const kNewsJokeInternalBaseClass1Imgsrc = @"imgsrc";
NSString *const kNewsJokeInternalBaseClass1Adtype = @"adtype";
NSString *const kNewsJokeInternalBaseClass1Source = @"source";
NSString *const kNewsJokeInternalBaseClass1Title = @"title";
NSString *const kNewsJokeInternalBaseClass1Boardid = @"boardid";
NSString *const kNewsJokeInternalBaseClass1UpTimes = @"upTimes";
NSString *const kNewsJokeInternalBaseClass1Img = @"img";
NSString *const kNewsJokeInternalBaseClass1Docid = @"docid";
NSString *const kNewsJokeInternalBaseClass1ImgType = @"imgType";
NSString *const kNewsJokeInternalBaseClass1Program = @"program";
NSString *const kNewsJokeInternalBaseClass1ReplyCount = @"replyCount";
NSString *const kNewsJokeInternalBaseClass1ClkNum = @"clkNum";


@interface NewsJokeInternalBaseClass1 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsJokeInternalBaseClass1

@synthesize recType = _recType;
@synthesize replyid = _replyid;
@synthesize pixel = _pixel;
@synthesize digest = _digest;
@synthesize picCount = _picCount;
@synthesize prompt = _prompt;
@synthesize downTimes = _downTimes;
@synthesize imgsrc = _imgsrc;
@synthesize adtype = _adtype;
@synthesize source = _source;
@synthesize title = _title;
@synthesize boardid = _boardid;
@synthesize upTimes = _upTimes;
@synthesize img = _img;
@synthesize docid = _docid;
@synthesize imgType = _imgType;
@synthesize program = _program;
@synthesize replyCount = _replyCount;
@synthesize clkNum = _clkNum;


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
            self.recType = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1RecType fromDictionary:dict] doubleValue];
            self.replyid = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Replyid fromDictionary:dict];
            self.pixel = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Pixel fromDictionary:dict];
            self.digest = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Digest fromDictionary:dict];
            self.picCount = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1PicCount fromDictionary:dict] doubleValue];
            self.prompt = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Prompt fromDictionary:dict];
            self.downTimes = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1DownTimes fromDictionary:dict] doubleValue];
            self.imgsrc = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Imgsrc fromDictionary:dict];
            self.adtype = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1Adtype fromDictionary:dict] doubleValue];
            self.source = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Source fromDictionary:dict];
            self.title = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Title fromDictionary:dict];
            self.boardid = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Boardid fromDictionary:dict];
            self.upTimes = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1UpTimes fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Img fromDictionary:dict];
            self.docid = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Docid fromDictionary:dict];
            self.imgType = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1ImgType fromDictionary:dict] doubleValue];
            self.program = [self objectOrNilForKey:kNewsJokeInternalBaseClass1Program fromDictionary:dict];
            self.replyCount = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1ReplyCount fromDictionary:dict] doubleValue];
            self.clkNum = [[self objectOrNilForKey:kNewsJokeInternalBaseClass1ClkNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recType] forKey:kNewsJokeInternalBaseClass1RecType];
    [mutableDict setValue:self.replyid forKey:kNewsJokeInternalBaseClass1Replyid];
    [mutableDict setValue:self.pixel forKey:kNewsJokeInternalBaseClass1Pixel];
    [mutableDict setValue:self.digest forKey:kNewsJokeInternalBaseClass1Digest];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picCount] forKey:kNewsJokeInternalBaseClass1PicCount];
    [mutableDict setValue:self.prompt forKey:kNewsJokeInternalBaseClass1Prompt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.downTimes] forKey:kNewsJokeInternalBaseClass1DownTimes];
    [mutableDict setValue:self.imgsrc forKey:kNewsJokeInternalBaseClass1Imgsrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adtype] forKey:kNewsJokeInternalBaseClass1Adtype];
    [mutableDict setValue:self.source forKey:kNewsJokeInternalBaseClass1Source];
    [mutableDict setValue:self.title forKey:kNewsJokeInternalBaseClass1Title];
    [mutableDict setValue:self.boardid forKey:kNewsJokeInternalBaseClass1Boardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.upTimes] forKey:kNewsJokeInternalBaseClass1UpTimes];
    [mutableDict setValue:self.img forKey:kNewsJokeInternalBaseClass1Img];
    [mutableDict setValue:self.docid forKey:kNewsJokeInternalBaseClass1Docid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgType] forKey:kNewsJokeInternalBaseClass1ImgType];
    [mutableDict setValue:self.program forKey:kNewsJokeInternalBaseClass1Program];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyCount] forKey:kNewsJokeInternalBaseClass1ReplyCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.clkNum] forKey:kNewsJokeInternalBaseClass1ClkNum];

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

    self.recType = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1RecType];
    self.replyid = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Replyid];
    self.pixel = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Pixel];
    self.digest = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Digest];
    self.picCount = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1PicCount];
    self.prompt = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Prompt];
    self.downTimes = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1DownTimes];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Imgsrc];
    self.adtype = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1Adtype];
    self.source = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Source];
    self.title = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Title];
    self.boardid = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Boardid];
    self.upTimes = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1UpTimes];
    self.img = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Img];
    self.docid = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Docid];
    self.imgType = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1ImgType];
    self.program = [aDecoder decodeObjectForKey:kNewsJokeInternalBaseClass1Program];
    self.replyCount = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1ReplyCount];
    self.clkNum = [aDecoder decodeDoubleForKey:kNewsJokeInternalBaseClass1ClkNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_recType forKey:kNewsJokeInternalBaseClass1RecType];
    [aCoder encodeObject:_replyid forKey:kNewsJokeInternalBaseClass1Replyid];
    [aCoder encodeObject:_pixel forKey:kNewsJokeInternalBaseClass1Pixel];
    [aCoder encodeObject:_digest forKey:kNewsJokeInternalBaseClass1Digest];
    [aCoder encodeDouble:_picCount forKey:kNewsJokeInternalBaseClass1PicCount];
    [aCoder encodeObject:_prompt forKey:kNewsJokeInternalBaseClass1Prompt];
    [aCoder encodeDouble:_downTimes forKey:kNewsJokeInternalBaseClass1DownTimes];
    [aCoder encodeObject:_imgsrc forKey:kNewsJokeInternalBaseClass1Imgsrc];
    [aCoder encodeDouble:_adtype forKey:kNewsJokeInternalBaseClass1Adtype];
    [aCoder encodeObject:_source forKey:kNewsJokeInternalBaseClass1Source];
    [aCoder encodeObject:_title forKey:kNewsJokeInternalBaseClass1Title];
    [aCoder encodeObject:_boardid forKey:kNewsJokeInternalBaseClass1Boardid];
    [aCoder encodeDouble:_upTimes forKey:kNewsJokeInternalBaseClass1UpTimes];
    [aCoder encodeObject:_img forKey:kNewsJokeInternalBaseClass1Img];
    [aCoder encodeObject:_docid forKey:kNewsJokeInternalBaseClass1Docid];
    [aCoder encodeDouble:_imgType forKey:kNewsJokeInternalBaseClass1ImgType];
    [aCoder encodeObject:_program forKey:kNewsJokeInternalBaseClass1Program];
    [aCoder encodeDouble:_replyCount forKey:kNewsJokeInternalBaseClass1ReplyCount];
    [aCoder encodeDouble:_clkNum forKey:kNewsJokeInternalBaseClass1ClkNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsJokeInternalBaseClass1 *copy = [[NewsJokeInternalBaseClass1 alloc] init];
    
    if (copy) {

        copy.recType = self.recType;
        copy.replyid = [self.replyid copyWithZone:zone];
        copy.pixel = [self.pixel copyWithZone:zone];
        copy.digest = [self.digest copyWithZone:zone];
        copy.picCount = self.picCount;
        copy.prompt = [self.prompt copyWithZone:zone];
        copy.downTimes = self.downTimes;
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.adtype = self.adtype;
        copy.source = [self.source copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.boardid = [self.boardid copyWithZone:zone];
        copy.upTimes = self.upTimes;
        copy.img = [self.img copyWithZone:zone];
        copy.docid = [self.docid copyWithZone:zone];
        copy.imgType = self.imgType;
        copy.program = [self.program copyWithZone:zone];
        copy.replyCount = self.replyCount;
        copy.clkNum = self.clkNum;
    }
    
    return copy;
}


@end
