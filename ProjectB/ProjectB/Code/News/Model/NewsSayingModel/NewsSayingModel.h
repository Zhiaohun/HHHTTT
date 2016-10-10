//
//  NewsSayingModel.h
//  ProjectB
//
//  Created by long on 2016/10/10.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsSayingModel : NSObject
@property (nonatomic, assign) double ugc;
@property (nonatomic, strong) NSArray *large_url_list;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, assign) BOOL is_gif;
@property (nonatomic, assign) double lagre_height;
@property (nonatomic, strong) NSString *behot_time_str;
@property (nonatomic, assign) double user_id;
@property (nonatomic, assign) double bury_count;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double comment_count;
@property (nonatomic, strong) NSString *data_url;
@property (nonatomic, strong) NSString *profile_image_url;
@property (nonatomic, strong) NSString *screen_name;
@property (nonatomic, assign) double behot_time;
@property (nonatomic, assign) double digg_count;
@property (nonatomic, assign) double repin_count;
@property (nonatomic, assign) double user_repin;


@end
