//
//  URLMacroDefine.h
//  AllRivierToOne
//
//  Created by long on 16/9/27.
//  Copyright © 2016年 long. All rights reserved.
//

#ifndef URLMacroDefine_h
#define URLMacroDefine_h


//天气
#define URL_Weather   @"http://tq.91.com/api/?chl=otSy9Zonl%2Fk5CTkt33reOQ%3D%3D&pid=168&marsLat=23.174925001898622&fromId=0&isfamily=0&cityName=%E5%A4%A9%E6%B2%B3%E5%8C%BA&spid=1&osv=8.3&lat=23.177468538866503&imei=EC5D43FF-9DB5-41F7-832E-2AD723B62D42&city=1012801014401060003&dm=iPhone6%2C2&sv=1.2.0&act=210&lng=113.340477823105431&marsLng=113.345936383709926&nt=10&mt=1"

//书影音

//音乐
//音乐列表
#define URL_MusciList   @"http://mobile.ximalaya.com/mobile/discovery/v2/category/metadata/albums?calcDimension=mostplay&categoryId=2&device=iPhone&pageId=1&pageSize=20&status=0&version=5.4.33"
//详情
#define URL_MusicListDetail   @" http://mobile.ximalaya.com/mobile/v1/album?albumId=243032&device=iPhone&pageSize=20&source=5&statEvent=pageview%2Falbum%40243032&statModule=&statPage=categorytag%40%E9%9F%B3%E4%B9%90_%E5%85%A8%E9%83%A8&statPosition=1"
//播放界面
#define URL_Play   @"http://mobileapi.5sing.kugou.com/song/newget?songtype=yc&songid=3177252&songfields=ID%2CSN%2CSK%2CSW%2CSS%2CST%2CSI%2CCT%2CM%2CS%2CZQ%2CWO%2CZC%2CHY%2CYG%2CCK%2CD%2CRQ%2CDD%2CE%2CR%2CRC%2CSG%2CC%2CCS%2CLV%2CLG%2CSY%2CUID%2CPT%2CSCSR%2CSC%2CKM5&userfields=ID%2CNN%2CI"

//下载
#define URL_DownLoad   @"http://mobile.ximalaya.com/mobile/download/7178199/track/17484646"
////评论
//#define URL_Comment  @"http://mobileapi.5sing.kugou.com/comments/list?rootId=15214293&rootKind=fc&maxId=0&limit=30"
////新歌排行榜
//#define URL_NewSong   @"http://mobileapi.5sing.kugou.com/rank/detail?id=list23&pagesize=20&pageindex=1&userfields=ID%2CNN%2CI%2CB%2CP%2CC%2CSX%2CE%2CM%2CVT%2CCT%2CTYC%2CTFC%2CTBZ%2CTFD%2CTFS%2CSC%2CYCRQ%2CFCRQ%2CCC%2CBG%2CDJ%2CRC%2CMC%2CAU%2CSR%2CSG%2CVG%2CISC%2CF&songfields=ID%2CSN%2CSK%2CSW%2CSS%2CST%2CSI%2CCT%2CM%2CS%2CZQ%2CWO%2CZC%2CHY%2CYG%2CCK%2CD%2CRQ%2CDD%2CE%2CR%2CRC%2CSG%2CC%2CCS%2CLV%2CLG%2CSY%2CUID%2CPT%2CSCSR%2CSC"
//
////最受欢迎排行榜
//#define URL_MostPopular   @"http://mobileapi.5sing.kugou.com/songlist/hotsupportranklist?page=1&pageSize=20"

//视频
//视频类别
#define URL_VideoList   @"http://baobab.wandoujia.com/api/v3/discovery"
//视频列表
#define URL_NORMAL  @"http://baobab.wandoujia.com/api/v3/videos" //normal  GET
#define URL_360  @"http://baobab.wandoujia.com/api/v3/tag/videos" //360  GET
//视频播放
#define URL_VideoPlay   @"http://baobab.wandoujia.com/api/v3/video/9176/detail/related"
//视频排行榜
#define URL_VideoRankingList   @"http://baobab.wandoujia.com/api/v3/ranklist?strategy=weekly"   //更改weekly


//阅读
//励志类图书:  page:1
#define URL_  search.mapi.dangdang.com/index.php?action=list_category&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=C4581CFC326F959AF115BCDF9848018E&timestamp=1474947087&union_id=537-50&permanent_id=20160927095850585330619986904624061&page_size=10&sort_type=default_0&cid=01.21.00.00.00.00&img_size=e


//资讯
//推荐
#define URL_Recommend   @"http://c.m.163.com/nc/article/list/T1467284926140/0-20.html"
//娱乐
#define URL_Amusement  @"http://c.m.163.com/nc/article/list/T1348648517839/0-20.html"
//科技
#define URL_Technology   @"http://c.m.163.com/nc/article/list/T1348649580692/0-20.html"
//游戏
#define URL_Game   @"http://c.m.163.com/nc/article/list/T1348654151579/0-20.html"
//段子
#define URL_Joke   @"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-102&iid=5643787819&os_version=8.3&os_api=18&app_name=joke_essay&channel=App%20Store&device_platform=iphone&idfa=51D9267D-D8DA-4E03-BFE8-74268A090173&live_sdk_version=130&vid=58F1D3DF-BA17-44EC-A91D-672F594EE1B0&openudid=00a575f72ecf898c2896f3bae7bf817bcba0f105&device_type=iPhone%205S&version_code=5.5.5&ac=WIFI&screen_width=640&device_id=13015784666&aid=7&content_type=-102&count=30&essence=1&message_cursor=0&min_time=1474955472&mpic=1"

//详情
#define URL_Detail   @"http://c.m.163.com/nc/article/C1VI2L8B00011229/full.html"

//我的



#endif /* URLMacroDefine_h */
