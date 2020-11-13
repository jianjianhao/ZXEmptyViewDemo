//
//  AppDelegate.m
//  TestEmptyViewDemo
//
//  Created by 简剑豪 on 2020/11/13.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = nav;
    
    [[UINavigationBar appearance] setTintColor:UIColor.blackColor];
    [[UINavigationBar appearance] setBarTintColor:UIColor.whiteColor];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    return YES;
}


@end
