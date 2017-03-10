//
//  LXJChannelModel.h
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXJChannelModel : NSObject
/*
 tname = 财经;
	color = ;
	subnum = 15.2万;
	isHot = 0;
	tid = T1348648756099;
	img = T1348648756099;
	isNew = 0;
	template = manual;
	recommendOrder = 118;
	alias = Business;
	bannerOrder = 0;
	hasCover = 0;
	cid = C1348648727071;
	hasIcon = 1;
	ename = caijing;
	recommend = 1;
	headLine = 0;
	topicid = 003406OS;
	special = 0;
	showType = comment;
 */

/**
 频道 ID
 */
@property (nonatomic, copy) NSString *tid;

/**
 频道名称
 */
@property (nonatomic, copy) NSString *tname;

/**
 加载频道数据 并将加载好的数据进行返回
 */
+ (NSArray *) loadChannelData;
@end
