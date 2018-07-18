//
//  TFQBaseRequest.m
//  MJExtensionPractice
//
//  Created by 王立志 on 2018/7/17.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "AFNetworking.h"
#import "TFQBaseRequest.h"
#import <objc/runtime.h>

@implementation TFQBaseRequest

+ (void)postWithUrlPath:(NSString *)urlPath parameters:(NSDictionary *)params success:(requestSuccess)success failure:(requestFailour)failour{
    NSDictionary *dict = [self publicParametersWithParams:params];
    NSString *url = [NSString stringWithFormat:@"%@%@",[self urlHost],urlPath];
    [[AFHTTPSessionManager manager] POST:url parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failour(error);
    }];
}

///域名
+ (NSString *)urlHost{
    return @"https://juejin.im/";
}

///合并参数
+ (NSDictionary *)publicParametersWithParams:(NSDictionary *)params{
    //假设这里是公共参数字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"zhangsan" forKey:@"name"];
    [dict setObject:@"12" forKey:@"age"];
    [dict setObject:@"1234" forKey:@"userName"];
    
    //如果字段key冲突，那么以左侧基础字典的值为准
    [dict addEntriesFromDictionary:params];
    NSLog(@"字典中的数据为%@",dict);
    return dict.copy;
}

@end
