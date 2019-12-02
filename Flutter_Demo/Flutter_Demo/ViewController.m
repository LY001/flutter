//
//  ViewController.m
//  iOSProject
//
//  Created by 刘杨 on 2019/11/21.
//  Copyright © 2019 刘杨. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <Flutter/Flutter.h>
#import "DemoRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushBtn addTarget:self
               action:@selector(pushAction)
     forControlEvents:UIControlEventTouchUpInside];
    [pushBtn setTitle:@"push页面" forState:UIControlStateNormal];
    [pushBtn setBackgroundColor:[UIColor blueColor]];
    pushBtn.frame = CGRectMake(80.0, 180.0, 160.0, 40.0);
    [self.view addSubview:pushBtn];
    
    UIButton *presentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [presentBtn addTarget:self
                action:@selector(presentAction)
      forControlEvents:UIControlEventTouchUpInside];
    [presentBtn setTitle:@"present页面" forState:UIControlStateNormal];
    [presentBtn setBackgroundColor:[UIColor blueColor]];
    presentBtn.frame = CGRectMake(80.0, 260.0, 160.0, 40.0);
    [self.view addSubview:presentBtn];
    
    UIButton *passBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [passBtn addTarget:self
                   action:@selector(passAction)
         forControlEvents:UIControlEventTouchUpInside];
    [passBtn setTitle:@"参数传递" forState:UIControlStateNormal];
    [passBtn setBackgroundColor:[UIColor blueColor]];
    passBtn.frame = CGRectMake(80.0, 340.0, 160.0, 40.0);
    [self.view addSubview:passBtn];
    
}

#pragma mark 调用DemoRouter页面实现页面跳转
- (void)pushAction {
    
    [DemoRouter.sharedRouter openPage:@"first" params:@{} animated:YES completion:^(BOOL f){}];
}
 
-(void)presentAction{
    [DemoRouter.sharedRouter openPage:@"second" params:@{@"present":@(YES)} animated:YES completion:^(BOOL f){}];
}
 
-(void)passAction
{
    [DemoRouter.sharedRouter openPage:@"flutterFragment" params:@{@"present":@(NO),@"key":@"我是传递过来的参数",@"第二个参数":@""} animated:YES completion:^(BOOL f){}];

}

@end
