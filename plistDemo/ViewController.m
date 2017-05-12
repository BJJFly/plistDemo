//
//  ViewController.m
//  plistDemo
//
//  Created by HAKA on 2017/5/11.
//  Copyright © 2017年 李石磊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 新建文件创建plist文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"banks" ofType:@"plist"];
    //存储类型要对应 不然取出为null
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    NSLog(@"plist文件%@", data);
    NSDictionary *dic = data[1];
    NSString * bankcode = dic[@"bankcode"];
    NSString * bankeng = dic[@"bankeng"];
    NSString * bankname = dic[@"bankname"];
    NSString * img = dic[@"img"];
    
    NSLog(@"=====%@====%@====%@===%@",bankcode,bankeng,bankname,img);
    
    
   //代码创建plist文件
    // 沙盒路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //完整路径
    NSString *doucumentPath = [path objectAtIndex:0];
    NSString *plistPath = [doucumentPath stringByAppendingPathComponent:@"test.plist"];
    
    
    //创建数据
    NSMutableDictionary * testDic = [NSMutableDictionary dictionary];
    [testDic setObject:@"奥迪" forKey:@"车"];
    [testDic setObject:@"红色" forKey:@"车色"];
    [testDic setObject:@"京A888888" forKey:@"车牌"];
    [testDic setObject:@"奥迪A8" forKey:@"车型"];
    //写入数据
    [testDic writeToFile:plistPath atomically:YES];
    
    
    NSMutableDictionary * dic11 = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    NSLog(@"==车===%@==车色==%@+===车牌=%@===车型=%@",dic11[@"车"],dic11[@"车色"],dic11[@"车牌"],dic11[@"车型"]);
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
