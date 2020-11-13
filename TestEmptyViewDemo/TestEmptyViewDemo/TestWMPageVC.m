//
//  TestWMPageVC.m
//  TestEmptyViewDemo
//
//  Created by 简剑豪 on 2020/11/13.
//

#import "TestWMPageVC.h"
#import <WMPageController.h>
#import "TestVC1.h"

@interface TestWMPageVC ()<WMPageControllerDelegate,WMPageControllerDataSource>
@property (nonatomic, strong) WMPageController *pageController;
@property (nonatomic, strong) NSMutableArray *vcsArr;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation TestWMPageVC

- (WMPageController *)pageController {
    if (!_pageController) {
        _pageController = [[WMPageController alloc] init];
        _pageController.menuViewStyle      = WMMenuViewStyleLine;
        _pageController.dataSource = self;
        _pageController.delegate = self;
        _pageController.titleSizeNormal    = 15;
        _pageController.titleSizeSelected  = 15;
        _pageController.titleColorNormal   = [UIColor blueColor];
        _pageController.titleColorSelected = [UIColor redColor];
    }
    return _pageController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.vcsArr = [NSMutableArray new];
    [self.view addSubview:self.pageController.view];
    self.pageController.view.frame = self.view.bounds;
    
    for (int i = 0; i < 5; i++) {
        TestVC1 *vc = [TestVC1 new];
        [self.vcsArr addObject:vc];
    }
    
    self.titles = @[@"123",@"321",@"543",@"111",@"qw1"];
    [self.pageController reloadData];
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.vcsArr.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.vcsArr[index];
}

- (CGRect)pageController:(nonnull WMPageController *)pageController preferredFrameForContentView:(nonnull WMScrollView *)contentView {
    return CGRectMake(0, 44, self.view.frame.size.width , self.view.frame.size.height);
}


- (CGRect)pageController:(nonnull WMPageController *)pageController preferredFrameForMenuView:(nonnull WMMenuView *)menuView {
    return CGRectMake(0, 0, self.view.frame.size.width  , 44);
}

@end
