//
//  TFQModel.h
//  TFQNetwork
//
//  Created by 王立志 on 2018/7/18.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQBaseModel.h"
@class TFQSonModel;

@interface TFQModel : TFQBaseModel

//@"{\"name\":\"zhangsan\",\"ag\":23,\"girlArray\":[1,2,3],\"subModel\":{\"subName\":\"subZhangsan\"}}";
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)int age;
@property (nonatomic, copy)NSArray *girls;
@property (nonatomic, strong)TFQSonModel *sonModel;

@end


@interface TFQSonModel : TFQBaseModel

@property (nonatomic, copy)NSString *name;

@end
