//
//  AppDelegate.m
//  TDYURLSchemesOne
//
//  Created by 唐道勇 on 16/11/7.
//  Copyright © 2016年 唐道勇. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
/**
 *  name    当其它app通过应用跳转打开该app的时候调用
 *  return  是否允许打开该app
 *  param  应用对像/跳转打开该app的URL/选项。
 *
 **/
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    NSLog(@"===唐道勇===url = %@, options = %@", url, options);
    //拿到URLSchemes  @"TDYOne://TDYTwo?name=tangdaoyong&passworld=tdy"
    NSString *URLSchemes = [[url.absoluteString componentsSeparatedByString:@"//"][1] componentsSeparatedByString:@"?"][0];
    //延迟调用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([[UIDevice currentDevice].systemVersion intValue] < 10) {//ios10之前调用
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@://", URLSchemes]]];
        }else{//iOS10之后调用(可以向http一样传递参数)
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@://TDYOne?name=tdy&passworld=123", URLSchemes]] options:@{} completionHandler:^(BOOL success) {
                NSLog(@"跳转调用成功2");
            }];
        }
    });
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
