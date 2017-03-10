//
//  LXJNewsModel.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJNewsModel.h"
#import "LXJSessionManager.h"
#import <YYModel.h>

@implementation LXJNewsModel
// 请求数据
+(void) requestNewsDataFromURLStr:(NSString *)URLStr completion:(void(^)(NSArray *newsData))completion{
    // 发起网络请求
    [[LXJSessionManager sharedManager] requestDataWithURLStr:URLStr RequestType:GET Parameters:nil success:^(id responseObject) {
        // 获取请求体对象
        NSDictionary *responseObjectDic = (NSDictionary *)responseObject;
        
        // 获取这个字典的 key
        NSString *key = [responseObjectDic allKeys].firstObject;
        
        // 获取里面的新闻内容
        NSArray *newsData = [responseObjectDic objectForKey:key];
        
        // 字典转模型
        newsData = [NSArray yy_modelArrayWithClass:self json:newsData];
        
        // 回调完成时的block
        completion(newsData);
        
        // 经测试数据回调在主线程执行
//        NSLog(@"%@",[NSThread currentThread]);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
@end
