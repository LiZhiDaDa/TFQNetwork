//
//  TFQBaseModel.m
//  MJExtensionPractice
//
//  Created by 王立志 on 2018/7/12.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQBaseModel.h"
#import <objc/runtime.h>
#import "TFQModel.h"

@implementation TFQBaseModel

+ (instancetype)modelWithDict:(id)object{
    TFQBaseModel *model = [[self alloc] init];
    return [model modelWithDict:object];
}

- (instancetype)modelWithDict:(id)object{
    NSDictionary *dict = [self dictWithObject:object];
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for(int i=0; i<count; i++){
        Ivar ivar = ivarList[i];
        NSString *propertyName = [[[NSString alloc] initWithUTF8String:ivar_getName(ivar)] substringFromIndex:1];
        NSString *serverName = [self getServerNameFromAppPropertyName:propertyName];
        id value = [dict objectForKey:serverName];
        if(value == nil || [value isKindOfClass:[NSNull class]]){
            //属性创建的默认值
            continue;
        }else if ([value isKindOfClass:[NSDictionary class]]){
            Class subClass = [self getClassWithPropertyName:propertyName];
            if(subClass){
                id subModel = [[subClass alloc] init];
                [subModel modelWithDict:value];
                [self setValue:subModel forKey:propertyName];
            }else{
                [self setValue:value forKey:propertyName];
            }
        }else if ([value isKindOfClass:[NSArray class]]){
            NSArray *array = (NSArray *)value;
            if(array.count == 0){
                continue;
            }
            Class subClass = [self getClassWithPropertyName:propertyName];
            NSMutableArray *arrayM = [NSMutableArray array];
            for(int i=0; i<array.count; i++){
                if(subClass){
                    id subModel = [[subClass alloc] init];
                    [subModel modelWithDict:value];
                    [arrayM addObject:subModel];
                }else{
                    id arrayValue = [array objectAtIndex:i];
                    [arrayM addObject:arrayValue];
                }
            }
            [self setValue:arrayM forKey:propertyName];
        }else{
            [self setValue:value forKey:propertyName];
        }
    }
    return self;
}

///把传进来的数据转化为字典
- (NSDictionary *)dictWithObject:(id)object{
    NSDictionary *dict = object;
    if([object isKindOfClass:[NSString class]]){
        NSData *data = [object dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if(error){
            NSLog(@"字符串转化为字典失败");
        }
    }
    return dict;
}

- (NSString *)getServerNameFromAppPropertyName:(NSString *)propertyName{
    return propertyName;
}

-(Class)getClassWithPropertyName:(NSString *)propertyName{
    return NSClassFromString(propertyName);
}
@end
