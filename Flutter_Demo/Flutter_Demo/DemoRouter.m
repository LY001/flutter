//
//  DemoRouter.m
//  iOSProject
//
//  Created by 刘杨 on 2019/11/22.
//  Copyright © 2019 刘杨. All rights reserved.
//

#import "DemoRouter.h"
#import <flutter_boost/FlutterBoost.h>

@implementation DemoRouter
 
+ (DemoRouter *)sharedRouter
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
 
- (void)openPage:(NSString *)name
          params:(NSDictionary *)params
        animated:(BOOL)animated
      completion:(void (^)(BOOL))completion
{
    if([params[@"present"] boolValue]){
        FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
        [vc setName:name params:params];
        [self.navigationController presentViewController:vc animated:animated completion:^{}];
    }else{
        FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
        [vc setName:name params:params];
        
        NSString *channelName = @"MethodChannelPlugin";
        
        FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:vc];
        
        [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            
            NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
            // flutter传参给iOS
            if ([call.method isEqualToString:@"net"]) {
                NSDictionary *dic = call.arguments;
                NSLog(@"arguments = %@", dic);
                NSString *code = dic[@"code"];
                NSArray *data = dic[@"data"];
                NSLog(@"code = %@", code);
                NSLog(@"data = %@",data);
                NSLog(@"data 第一个元素%@",data[0]);
                NSLog(@"data 第一个元素类型%@",[data[0] class]);
            }
            // iOS给iOS返回值
               if ([call.method isEqualToString:@"net"]) {
                   if (result) {
                       result(@"返回给flutter的内容");
                   }
               }
        }];
        
        [self.navigationController pushViewController:vc animated:animated];
    }
}


- (void)closePage:(NSString *)uid animated:(BOOL)animated params:(NSDictionary *)params completion:(void (^)(BOOL))completion
{
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}
- (void)open:(nonnull NSString *)url urlParams:(nonnull NSDictionary *)urlParams exts:(nonnull NSDictionary *)exts completion:(nonnull void (^)(BOOL))completion {
    
    
}

@end
