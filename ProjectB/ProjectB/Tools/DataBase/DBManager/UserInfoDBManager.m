//
//  UserInfoDBManager.m
//  ProjectB
//
//  Created by 芏小川 on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import "UserInfoDBManager.h"

@implementation UserInfoDBManager

+(instancetype)defaultManager{
    static  UserInfoDBManager *userInfoDBManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfoDBManager = [[UserInfoDBManager alloc]init];
    });
    return userInfoDBManager;
}

-(id)init{
    self = [super init];
    if (self) {
        //让数据库操作对象唯一
        NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Project-B.sqlite"];
        NSLog(@"dbPath____%@",dbPath);
        _db = [FMDatabase databaseWithPath:dbPath];
        if (![_db open]) {
            NSLog(@"数据库打开失败");
        }
    }
    return self;
}


//创建表
-(void)createTable{
    [_db open];
    NSString *sqlstr = @"create table if not exists UserInfo (username text,personalSentence text,userImg text,gender text,city text,birthday text)";

    BOOL result = [_db executeUpdate:sqlstr];
    if (result) {
        NSLog(@"创建表成功");
    }
    else{
        NSLog(@"创建表失败");
    }
    [_db close];
}
//插入
-(void)insertDataWithModel:(UserInfoModel *)model{
    [_db open];
    NSString *sqlstr = [NSString stringWithFormat:@"insert into UserInfo (username ,personalSentence ,userImg ,gender ,city ,birthday ) values ('%@','%@','%@','%@','%@','%@')",model.username,model.personalSentence,model.userImg,model.gender,model.city,model.birthday];
    
    BOOL result = [_db executeUpdate:sqlstr];
    if (result) {
        NSLog(@"添加成功");
    }
    else{
        NSLog(@"添加失败");
    }
    
    [_db close];
}
//删除
-(void)deleteDataWithUsername:(NSString *)username{

    [_db open];
    NSString *sqlstr = [NSString stringWithFormat:@"delete from UserInfo where username =  '%@'",username];
    BOOL result = [_db executeUpdate:sqlstr];
    if (result) {
        NSLog(@"删除成功");
    }
    else{
        NSLog(@"删除失败");
    }
    
    [_db close];
}
//查询
-(NSArray<UserInfoModel *> *)selectData{

    [_db open];
    NSString *sqlstr = [NSString stringWithFormat:@"select *from UserInfo"];
    NSMutableArray *modelArr = [NSMutableArray array];
    FMResultSet *set = [_db executeQuery:sqlstr];
    while ([set next]) {
        UserInfoModel *model = [UserInfoModel new];
        model.username = [set objectForColumnName:@"username"];
        model.personalSentence = [set objectForColumnName:@"personalSentence"];
        model.userImg = [set objectForColumnName:@"userImg"];
        model.gender = [set objectForColumnName:@"gender"];
        model.city = [set objectForColumnName:@"city"];
        model.birthday = [set objectForColumnName:@"birthday"];
        [modelArr addObject:model];
    }
    NSArray *arr = [NSArray arrayWithArray:modelArr];
    [_db close];
    
    return arr;
}

//根据昵称查询
-(UserInfoModel *)selectDataWithUsername:(NSString *)username{
    [_db open];
    NSString *sqlstr = [NSString stringWithFormat:@"select *from UserInfo where username = '%@'",username];
    FMResultSet *set = [_db executeQuery:sqlstr];
    UserInfoModel *model = [UserInfoModel new];
    while ([set next]) {
        model.username = [set objectForColumnName:@"username"];
        model.personalSentence = [set objectForColumnName:@"personalSentence"];
        model.userImg = [set objectForColumnName:@"userImg"];
        model.gender = [set objectForColumnName:@"gender"];
        model.city = [set objectForColumnName:@"city"];
        model.birthday = [set objectForColumnName:@"birthday"];
    }
    [_db close];
    return model;
}



@end
