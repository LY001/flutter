//
//  DemoRouter.h
//  iOSProject
//
//  Created by 刘杨 on 2019/11/22.
//  Copyright © 2019 刘杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <flutter_boost/FLBPlatform.h>
 
NS_ASSUME_NONNULL_BEGIN
 
@interface DemoRouter : NSObject<FLBPlatform>
 
@property (nonatomic,strong) UINavigationController *navigationController;

+ (DemoRouter *)sharedRouter;

- (void)openPage:(NSString *)name
          params:(NSDictionary *)params
        animated:(BOOL)animated
      completion:(void (^)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
