//
//  TFQModel.m
//  TFQNetwork
//
//  Created by 王立志 on 2018/7/18.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQModel.h"

@implementation TFQModel

- (NSString *)getServerNameFromAppPropertyName:(NSString *)propertyName{
    if([propertyName isEqualToString:@"age"]){
        return @"ag";
    }else if([propertyName isEqualToString:@"girls"]){
        return @"girlArray";
    }else if([propertyName isEqualToString:@"sonModel"]){
        return @"subModel";
    }
    return [super getServerNameFromAppPropertyName:propertyName];
}

- (Class)getClassWithPropertyName:(NSString *)propertyName{
    if([propertyName isEqualToString:@"sonModel"]){
        return [TFQSonModel class];
    }
    return [super getClassWithPropertyName:propertyName];
}

@end

@implementation TFQSonModel

- (NSString *)getServerNameFromAppPropertyName:(NSString *)propertyName{
    if([propertyName isEqualToString:@"name"]){
        return @"subName";
    }
    return [super getServerNameFromAppPropertyName:propertyName];
}

@end
