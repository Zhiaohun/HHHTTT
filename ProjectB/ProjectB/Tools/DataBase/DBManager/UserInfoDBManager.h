//
//  UserInfoDBManager.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "FMDB.h"

@interface UserInfoDBManager : NSObject
//数据库操作对象
@property (nonatomic,strong)FMDatabase *db;
+(instancetype)defaultManager;
//创建表
-(void)createTable;
//插入
-(void)insertDataWithModel:(UserInfoModel *)model;
//删除
-(void)deleteDataWithUsername:(NSString *)username;
//查询
-(NSArray<UserInfoModel *> *)selectData;
//根据昵称查询
-(UserInfoModel *)selectDataWithUsername:(NSString *)username;
//更新
-(void)updateWithUsername:(NSString *)username TOPersonalSten:(NSString *)sentence userImg:(NSString *)userImg gender:(NSString *)gender city:(NSString *)city birthday:(NSString *)birthday;



@end
