//
//  LXJSessionManager.h
//  NetNewsEasy
//
//  Created by 李旭杰 on 2017/3/10.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
// 网络请求类型
typedef enum : NSUInteger {
     GET,
    POST,
} RequestType;

@interface LXJSessionManager : AFHTTPSessionManager
// 单例 全局访问入口
+(instancetype) sharedManager;
// 发起网络请求
-(void) requestDataWithURLStr:(NSString *)URLStr RequestType:(RequestType)requestType Parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
@end
