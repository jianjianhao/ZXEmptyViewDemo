//
//  DemoEmptyView.m
//  TestEmptyViewDemo
//
//  Created by 简剑豪 on 2020/11/13.
//

#import "DemoEmptyView.h"

@implementation DemoEmptyView

- (void)zx_customSetting {
    self.zx_topImageView.image = [UIImage imageNamed:@"icon_nodata"];
    self.zx_topImageView.zx_fixWidth = 100;
    self.zx_titleLabel.zx_fixTop = 20;
    self.zx_titleLabel.text = @"暂无数据";
    self.zx_titleLabel.font = [UIFont boldSystemFontOfSize:20];

    self.zx_detailLabel.textColor = [UIColor lightGrayColor];
    self.zx_detailLabel.font = [UIFont systemFontOfSize:14];
    self.zx_detailLabel.text = @"这里没有东西哦~~";
//    [self.zx_actionBtn setTitle:nil forState:UIControlStateNormal];
}

@end
