//
//  MusicHotListModel.h
//  ProjectB
//
//  Created by long on 2016/10/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicHotListModel : NSObject
/*
"albumCoverUrl290": "http://fdfs.xmcdn.com/group19/M0A/2F/4D/wKgJK1fmsyOQ5OBMAAEsqOuKGqM581_mobile_meduim.png",
"albumId": 5110899,
"coverMiddle": "http://fdfs.xmcdn.com/group19/M0A/2F/4D/wKgJK1fmsyOQ5OBMAAEsqOuKGqM581_mobile_meduim.png",
"coverSmall": "http://fdfs.xmcdn.com/group19/M0A/2F/4D/wKgJK1fmsyOQ5OBMAAEsqOuKGqM581_mobile_small.png",
"id": 5110899,
"intro": "月光下的潺潺流水",
"isFinished": 0,
"isPaid": false,
"lastUptrackAt": 0,
"lastUptrackId": 0,
"nickname": "蜗牛睡眠",
"playsCounts": 164839,
"priceTypeId": 0,
"serialState": 0,
"tags": "",
"title": "Lullaby",
"tracks": 6,
"tracksCounts": 6,
"uid": 48781381
*/
@property (nonatomic, strong) NSString *intro;
//@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double albumId;
//@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double tracksCounts;
@property (nonatomic, strong) NSString *coverMiddle;



@end
