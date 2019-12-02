//
//  MyFlutterViewController.m
//  Flutter_Demo
//
//  Created by 刘杨 on 2019/11/25.
//  Copyright © 2019 刘杨. All rights reserved.
//

#import "MyFlutterViewController.h"
#import "DemoRouter.h"

@interface MyFlutterViewController ()

@end

@implementation MyFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
       
   UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   [pushBtn addTarget:self
              action:@selector(pushAction)
    forControlEvents:UIControlEventTouchUpInside];
   [pushBtn setTitle:@"push页面" forState:UIControlStateNormal];
   [pushBtn setBackgroundColor:[UIColor blueColor]];
   pushBtn.frame = CGRectMake(80.0, 180.0, 160.0, 40.0);
   [self.view addSubview:pushBtn];
   
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
 
-(void)passAction
{
    [DemoRouter.sharedRouter openPage:@"flutterFragment" params:@{@"present":@(NO),@"key":@"我是传递过来的参数",@"第二个参数":@""} animated:YES completion:^(BOOL f){}];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
