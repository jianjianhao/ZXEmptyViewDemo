//
//  BaseVC.m
//  TestEmptyViewDemo
//
//  Created by 简剑豪 on 2020/11/13.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (BOOL)hidesBottomBarWhenPushed {
    return ([self.navigationController.viewControllers lastObject] == self && self.navigationController.viewControllers.count > 1);
}


@end
