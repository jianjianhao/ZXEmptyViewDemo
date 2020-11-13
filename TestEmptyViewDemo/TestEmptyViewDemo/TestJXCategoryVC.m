//
//  TestJXCategoryVC.m
//  TestEmptyViewDemo
//
//  Created by 简剑豪 on 2020/11/13.
//

#import "TestJXCategoryVC.h"
#import <JXCategoryView.h>
#import <JXCategoryListContainerView.h>
#import "BaseTableVC.h"
@interface TestJXCategoryVC ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic , copy) NSArray *titles;
@property (nonatomic , strong) JXCategoryTitleView *categoryView;
@property (nonatomic , strong) JXCategoryListContainerView *listContainerView;
@end

@implementation TestJXCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles = [NSMutableArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"已完成", nil];

    self.categoryView = [[JXCategoryTitleView alloc] init];
    self.categoryView.delegate = self;
    self.categoryView.titles = self.titles;
    self.categoryView.titleColor = [UIColor blackColor];
    self.categoryView.titleSelectedColor = [UIColor redColor];
    self.categoryView.titleFont = [UIFont systemFontOfSize:14];
    self.categoryView.titleSelectedFont = [UIFont fontWithName:@"SourceHanSansCN-Medium" size:14];
    self.categoryView.titleColorGradientEnabled = NO;
    self.categoryView.titleLabelZoomEnabled = NO;
    self.categoryView.defaultSelectedIndex = 0;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = [UIColor redColor];
    self.categoryView.indicators = @[lineView];
    [self.view addSubview:self.categoryView];
    
    self.listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    self.listContainerView.defaultSelectedIndex = 0;
    [self.view addSubview:self.listContainerView];

    self.categoryView.contentScrollView = self.listContainerView.scrollView;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.categoryView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    self.listContainerView.frame = CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return [BaseTableVC new];
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

@end
