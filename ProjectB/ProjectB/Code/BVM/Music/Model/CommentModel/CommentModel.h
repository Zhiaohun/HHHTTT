//
//  CommentModel.h
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *smallHeader;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, assign) double likes;
@end
