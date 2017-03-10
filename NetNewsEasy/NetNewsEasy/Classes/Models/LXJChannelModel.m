//
//  LXJChannelModel.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJChannelModel.h"
#import <YYModel.h>

@implementation LXJChannelModel

+ (NSArray *) loadChannelData{
    // 获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    // 获取此文件的二进制数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    // 将此数据进行反序列化
    NSDictionary *channelDataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // 根据tList键获取对应的对象
    NSArray *channelDataArr = [channelDataDic objectForKey:@"tList"];
    // 字典转模型
    NSArray *channelData = [NSArray yy_modelArrayWithClass:[LXJChannelModel class] json:channelDataArr];
    // 根据 tid 将元素进行排序
    channelData = [channelData sortedArrayUsingComparator:^NSComparisonResult(LXJChannelModel *obj1, LXJChannelModel *obj2) {
        // 这是一个有返回值的 block
        return [obj1.tid compare:obj2.tid];
    }];
    
    return channelData;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@------%@",self.tid, self.tname];
}
@end
