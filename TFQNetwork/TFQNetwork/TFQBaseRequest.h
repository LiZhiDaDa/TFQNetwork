//
//  TFQBaseRequest.h
//  MJExtensionPractice
//
//  Created by 王立志 on 2018/7/17.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

//#import "TFQNetwork.h"
#import "TFQBaseModel.h"

typedef void(^requestSuccess)(id responseObject);
typedef void(^requestFailour)(NSError *error);

@interface TFQBaseRequest : NSObject

//- (void)post:(NSString *)url parameters:(NSDictionary *)params success:(requestSuccess1)success failure:(requestFailour)failour;

/**
 对AFNetworking的二次封装POST请求

 @param urlPath 该接口的路径
 @param params 非公共参数
 @param success 请求成功block
 @param failour 请求失败block
 */
+ (void)postWithUrlPath:(NSString *)urlPath parameters:(NSDictionary *)params success:(requestSuccess)success failure:(requestFailour)failour;

@end
