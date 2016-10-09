//
//  UserInfoDBManager.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"

@interface UserInfoDBManager : NSObject
//数据库操作对象
@property (nonatomic,strong) FMDatabase *db;

+(instancetype)defaultManager;
//创建表
-(void)createTable;
//插入
-(void)insertDataWithModel:(UserInfoModel *)model;
//删除
-(void)deleteDataWithUsername:(NSString *)username;
//查询
-(NSArray<UserInfoModel *> *)selectData;



@end
