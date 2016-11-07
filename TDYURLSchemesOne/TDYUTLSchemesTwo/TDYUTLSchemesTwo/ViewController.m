//
//  ViewController.m
//  TDYUTLSchemesTwo
//
//  Created by 唐道勇 on 16/11/7.
//  Copyright © 2016年 唐道勇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *gotoButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 60)];
    [gotoButton setTitle:@"goto" forState:UIControlStateNormal];
    gotoButton.backgroundColor = [UIColor redColor];
    [gotoButton addTarget:self action:@selector(tdy_gotoTDYURLSchemesOne:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gotoButton];
}
- (void)tdy_gotoTDYURLSchemesOne:(UIButton *)button{
    //调用之前需要在info文件中加入：LSApplicationQueriesSchemes//URL Schemes白名单
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"TDYOne://"]]){
        if ([[UIDevice currentDevice].systemVersion intValue] < 10) {//ios10之前调用
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"TDYOne://"]];
        }else{//iOS10之后调用(可以向http一样传递参数)
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"TDYOne://TDYTwo?name=tangdaoyong&passworld=tdy"] options:@{} completionHandler:^(BOOL success) {
                NSLog(@"跳转调用成功");
            }];
        }
    }else{
        NSLog(@"未安装应用");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
