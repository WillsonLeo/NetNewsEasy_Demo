//
//  LXJSessionManager.m
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import "LXJSessionManager.h"
#define BASEURLSTR [NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]

@implementation LXJSessionManager

+(instancetype) sharedManager{
    static LXJSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LXJSessionManager alloc] initWithBaseURL:BASEURLSTR];
    });
    return manager;
}

// 发起网络请求
-(void) requestDataWithURLStr:(NSString *)URLStr RequestType:(RequestType)requestType Parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure{
    // GET 请求
    if (requestType == GET) {
        [self GET:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    } else{
        // POST 请求
        [self POST:URLStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}
@end
