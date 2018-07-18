//
//  ViewController.m
//  TFQNetwork
//
//  Created by 王立志 on 2018/7/17.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "ViewController.h"
#import "TFQBaseRequest.h"
#import "TFQModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)test{
    NSString *str1 = @"{\"name\":\"zhangsan\",\"ag\":23,\"girlArray\":[1,2,3],\"subModel\":{\"subName\":\"subZhangsan\"}}";
    NSString *urlPath = @"timeline";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"110918" forKey:@"userid"];
    [TFQBaseRequest postWithUrlPath:urlPath parameters:params success:^(id responseObject) {
        TFQModel *model = [TFQModel modelWithDict:responseObject];
        //do other things;
    } failure:^(NSError *error) {
        //因为接口是假的，请求不成功，所以只能在failure里边解析数据了。
        TFQModel *model = [TFQModel modelWithDict:str1];
        NSLog(@"%@",model.name);
        NSLog(@"%d",model.age);
        NSLog(@"%@",model.girls);
        NSLog(@"%@",model.sonModel.name);
//        NSLog(@"%@",error.userInfo);
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
