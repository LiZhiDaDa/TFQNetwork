//
//  TFQBaseModel.h
//  MJExtensionPractice
//
//  Created by 王立志 on 2018/7/12.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModelProtocol.h"

@interface TFQBaseModel : NSObject<BaseModelProtocol>

- (void)modelWithDict:(id)object;

/**
 如果字典里边包含数组或者字典，那么就需要创建一个类来接收它

 @param propertyName server返回字段
 @return app对应的类
 */
- (Class)getClassWithPropertyName:(NSString *)propertyName;



/**
 总有一些后台的命名规则自己看不惯，想把后台字段转换为自己想要的字段

 @param propertyName app定义的字段
 @return server定义的字段
 */
- (NSString *)getServerNameFromAppPropertyName:(NSString *)propertyName;

@end
