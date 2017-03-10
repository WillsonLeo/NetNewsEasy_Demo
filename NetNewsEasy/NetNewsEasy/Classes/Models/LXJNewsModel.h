//
//  LXJNewsModel.h
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXJNewsModel : NSObject
/*
 postid: "PHOT24D06000100A",
 hasCover: false,
 hasHead: 1,
     replyCount: 5439,
 hasImg: 1,
 digest: "",
 hasIcon: true,
 docid: "9IG74V5H00963VRO_CF6NER4KbjjikeupdateDoc",
    title: "韩代总统就朴槿惠遭弹劾发表国民讲话",
 order: 1,
 priority: 354,
 lmodify: "2017-03-10 20:34:05",
 boardid: "photoview_bbs",
 ads: [],
 photosetID: "00AO0001|2241542",
 imgsum: 4,
 topic_background: "http://img2.cache.netease.com/m/newsapp/reading/cover1/C1348646712614.jpg",
 template: "normal1",
 votecount: 5102,
 skipID: "00AO0001|2241542",
 alias: "Top News",
 skipType: "photoset",
 cid: "C1348646712614",
 hasAD: 1,
     imgextra: [],
     source: "网易综合",
 ename: "iosnews",
 tname: "头条",
     imgsrc: "http://cms-bucket.nosdn.127.net/9baab696514242fe8dbedd1f7102f06820170310202826.jpeg",
 ptime: "2017-03-10 20:28:38"
 */

/**
 新闻标题
 */
@property (nonatomic, copy) NSString *title;

/**
 新闻图标
 */
@property (nonatomic, copy) NSString *imgsrc;

/**
 新闻来源
 */
@property (nonatomic, copy) NSString *source;

/**
 新闻回复数量
 */
@property (nonatomic, copy) NSString *replyCount;

/**
 新闻多图
 */
@property (nonatomic, copy) NSString *imgextra;

/**
 大图标记[为什么没有找到啊??????]
 */
@property (nonatomic, assign) BOOL imgType;

/**
 发起网络请求,并且将请求到的数据回调给控制器

 @param URLStr 请求地址
 @param completion 完成时的 block 回调
 */
+(void) requestNewsDataFromURLStr:(NSString *)URLStr completion:(void(^)(NSArray *newsData))completion;
@end
