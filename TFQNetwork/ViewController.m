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
        //由于是测试数据，就给responsObject赋值
        responseObject = str1;
        TFQModel *model = [TFQModel modelWithDict:responseObject];
        NSLog(@"%@",model.name);
        NSLog(@"%d",model.age);
        NSLog(@"%@",model.girls);
        NSLog(@"%@",model.sonModel.name);
    } failure:^(NSError *error) {
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
