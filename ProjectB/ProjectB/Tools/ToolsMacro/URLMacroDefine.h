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
//音乐分类
#define URL_MusicCategory   @"http://mobile.ximalaya.com/mobile/discovery/v2/category/metadata/albums?calcDimension=hot&categoryId=2&device=iPhone&pageId"  //&pageSize=20&status=0&version=5.4.33
//音乐列表
#define URL_MusicList   @"http://mobile.ximalaya.com/mobile/v1/album?albumId" //=3726515&device=iPhone&pageSize=20&source=5&statEvent=pageview%2Falbum%40243032&statModule=14%3A137&statPage=categorytag%40%E9%9F%B3%E4%B9%90_%E5%85%A8%E9%83%A8&statPosition=1&trackId=17166137
//音乐列表加载更多
#define URL_MusicListMore  @"http://mobile.ximalaya.com/mobile/v1/album/track?albumId"  //=3726515&device=iPhone&isAsc=true&pageId=2&pageSize=20&statEvent=pageview%2Falbum%403726515&statModule=&statPage=categorytag%40%E9%9F%B3%E4%B9%90_%E5%85%A8%E9%83%A8&statPosition=2

//播放界面
#define URL_Play   @"http://mobile.ximalaya.com/v1/track/ca/playpage"  // 19456060?albumId=243032&device=iPhone&trackUid=7178199

//更多评论
#define URL_CommentMore @"http://mobile.ximalaya.com/mobile/track/comment?device=iPhone&pageId" //=1&pageSize=30&trackId=21794260

//下载
#define URL_DownLoad   @"http://mobile.ximalaya.com/mobile/download"  ///7178199/track/17484646
////评论
//#define URL_Comment  @"http://mobileapi.5sing.kugou.com/comments/list?rootId=15214293&rootKind=fc&maxId=0&limit=30"
////新歌排行榜
//#define URL_NewSong   @"http://mobileapi.5sing.kugou.com/rank/detail?id=list23&pagesize=20&pageindex=1&userfields=ID%2CNN%2CI%2CB%2CP%2CC%2CSX%2CE%2CM%2CVT%2CCT%2CTYC%2CTFC%2CTBZ%2CTFD%2CTFS%2CSC%2CYCRQ%2CFCRQ%2CCC%2CBG%2CDJ%2CRC%2CMC%2CAU%2CSR%2CSG%2CVG%2CISC%2CF&songfields=ID%2CSN%2CSK%2CSW%2CSS%2CST%2CSI%2CCT%2CM%2CS%2CZQ%2CWO%2CZC%2CHY%2CYG%2CCK%2CD%2CRQ%2CDD%2CE%2CR%2CRC%2CSG%2CC%2CCS%2CLV%2CLG%2CSY%2CUID%2CPT%2CSCSR%2CSC"
//
////最受欢迎排行榜
//#define URL_MostPopular   @"http://mobileapi.5sing.kugou.com/songlist/hotsupportranklist?page=1&pageSize=20"

//视频
//视频类别
#define URL_VideoHeader  @"http://baobab.wandoujia.com/api/v3/tabs/selected"
#define URL_VideoList   @"http://baobab.wandoujia.com/api/v3/discovery"
//视频列表
#define URL_NORMAL  @"http://baobab.wandoujia.com/api/v3/videos" //normal  GET
#define URL_360  @"http://baobab.wandoujia.com/api/v3/tag/videos" //360  GET
//视频播放
#define URL_VideoPlay   @"http://baobab.wandoujia.com/api/v3/video/9176/detail/related"
//视频排行榜
#define URL_VideoRankingList   @"http://baobab.wandoujia.com/api/v3/ranklist?strategy=weekly"   //更改weekly


//阅读
//热门: page:1
#define URL_HotRead @"http://mapi.dangdang.com/index.php?action=bang_tushu&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=540A88E74CEFD9429857C6149B4CF7A4&timestamp=1474943523&union_id=537-50&permanent_id=20160927095850585330619986904624061&img_size=b&pagesize=10&time_region=24hours&cat_path=01.00.00.00.00.00&ischildren=0&bang_name=bestsell"
//排行榜 : page:1
#define URL_RankListRead @"http://mapi.dangdang.com/index.php?action=bang_tushu&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=F1EBD5202292B784BEE1DFB8CD532666&timestamp=1474946548&union_id=537-50&permanent_id=20160927095850585330619986904624061&img_size=b&pagesize=10&time_region=recent30&cat_path=01.00.00.00.00.00&ischildren=0&bang_name=bestsell"
//励志类图书:  page:1
#define URL_MovitionBook  @"http://search.mapi.dangdang.com/index.php?action=list_category&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=C4581CFC326F959AF115BCDF9848018E&timestamp=1474947087&union_id=537-50&permanent_id=20160927095850585330619986904624061&page_size=10&sort_type=default_0&cid=01.21.00.00.00.00&img_size=e"
//心理学类图书 :page:1
#define URL_PsychologyBook @"http://search.mapi.dangdang.com/index.php?action=list_category&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=5E72D523C0BCAECD65740BE315BB0A01&timestamp=1474947494&union_id=537-50&permanent_id=20160927095850585330619986904624061&page_size=10&sort_type=default_0&cid=01.31.00.00.00.00&img_size=e"
//小说类图书:page:1
#define URL_NovelBook @"http://search.mapi.dangdang.com/index.php?action=list_category&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=697ED197434075AADCE67571C0F1C3E9&timestamp=1474947359&union_id=537-50&permanent_id=20160927095850585330619986904624061&page_size=10&sort_type=default_0&cid=01.03.00.00.00.00&img_size=e"
//文艺类图书:page:1
#define URL_ArtBook @"http://search.mapi.dangdang.com/index.php?action=list_category&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=70FDCA8140265AF58283783625496153&timestamp=1474947261&union_id=537-50&permanent_id=20160927095850585330619986904624061&page_size=10&sort_type=default_0&cid=01.01.00.00.00.00&img_size=e"
//图书详情 : product_id:23353342
#define URL_BookDetail @"http://product.mapi.dangdang.com/index.php?action=get_product_book_html&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=4A10112DE5CA01EE7C37FD3D36562A16&timestamp=1474945334&union_id=537-50&permanent_id=20160927095850585330619986904624061"
//图书评论 : product_id:23353342 page:1
#define URL_BookComment @"http://product.mapi.dangdang.com/index.php?action=get_product_reviews&user_client=iphone&client_version=5.5.6&udid=17BFEBF79BFCEED4EC1165EA26BC56B3&time_code=B212D2DFAAFC3AE0FAA04B43640E70F8&timestamp=1475027038&union_id=537-50&permanent_id=20160927095850585330619986904624061&pagesize=10&filtertype=1"


//资讯
//推荐
#define URL_Recommend   @"http://c.m.163.com/nc/article/list/T1467284926140"   ///0-20.html
//娱乐
#define URL_Amusement  @"http://c.m.163.com/nc/article/list/T1348648517839"  // /0-20.html
//科技
#define URL_Technology   @"http://c.m.163.com/nc/article/list/T1348649580692"   ///0-20.html
//游戏
#define URL_Game   @"http://c.m.163.com/nc/article/list/T1348654151579"  ///0-20.html
//段子
#define URL_Joke   @"http://c.3g.163.com/recommend/getChanRecomNews?channel=duanzi&passport=&devId=Y6sxCyRt%2BvjK%2FmFpSwESnjRhGN7WOwirzF%2BT4OIZTiEDW32gKNZ8DN6eQj4%2F1ABH&offset"  //=0&size=20&version=15.1&spever=false&net=wifi&lat=&lon=&ts=1475758453&sign=F%2Budf9G%2FjoIsCyTRiS7QYYPJoiSkQa%2FaZ2VAgVdej2B48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore
//语录
#define URL_Saying  @"http://ic.snssdk.com/2/essay/v10/recent/?tag=criticism&iid=5786207384&count=50&max_behot_time"  //=1463949620&ac=wifi&channel=App%20Store&app_name=criticism_essay&version_code=2.4.1&device_platform=iphone&os_version=8.3&device_type=Unknown%20iPhone&vid=58F1D3DF-BA17-44EC-A91D-672F594EE1B0&openudid=00a575f72ecf898c2896f3bae7bf817bcba0f105&idfa=51D9267D-D8DA-4E03-BFE8-74268A090173
//详情
#define URL_Detail   @"http://c.m.163.com/nc/article/C1VI2L8B00011229/full.html"

//我的

//  登录注册
#define URL_Login            @"http://api2.pianke.me/user/login" //登录接口的地址
#define URL_Register           @"http://api2.pianke.me/user/reg"   //注册接口的地址



#endif /* URLMacroDefine_h */
