//
//  IOSGodsHistoryListVC.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSGodsHistoryListVC.h"
#import "IOSGodsHistoryVC.h"
@interface IOSGodsHistoryListVC ()<YNPageViewControllerDataSource, YNPageViewControllerDelegate>

@end

@implementation IOSGodsHistoryListVC

- (void)viewDidLoad {
    YNPageConfigration *configration = [YNPageConfigration defaultConfig];
    configration.pageStyle = YNPageStyleTop;
    configration.headerViewCouldScale = YES;
    configration.showTabbar = NO;
    configration.showNavigation = YES;
    configration.scrollMenu = NO;
    configration.bottomLineBgColor = RGBA(245, 245, 245, 1);
    configration.selectedItemColor = KAppColor;
    configration.normalItemColor = [UIColor blackColor];
    configration.lineColor = KAppColor;
    configration.lineLeftAndRightAddWidth = -15;
    configration.aligmentModeCenter = NO;
    configration.lineWidthEqualFontWidth = NO;
    configration.showBottomLine = YES;
    
    NSArray *VCArray = [self getArrayVCs];
    self.controllersM = [[self getArrayVCs] mutableCopy];
    self.titlesM = [[self getArrayTitles] mutableCopy];
    self.config = configration;
    
    self.dataSource = self;
    self.delegate = self;
    
    self.pageIndex = 0;
    [super viewDidLoad];
    [self setNavBackStr:@"采购历史"];

}
- (NSArray *)getArrayVCs {
    IOSGodsHistoryVC *firstVC = [[IOSGodsHistoryVC alloc] init];

    IOSGodsHistoryVC *secondVC = [[IOSGodsHistoryVC alloc] init];

    IOSGodsHistoryVC *threeVC = [[IOSGodsHistoryVC alloc] init];


    return @[firstVC, secondVC, threeVC];
}

- (NSArray *)getArrayTitles {
    return @[@"全部", @"采购中",@"已完成"];
}
//设置导航栏
-(void)setNavBackStr:(NSString *)backTitle{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:backTitle forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
#pragma mark ---点击事件----
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Private Function

#pragma mark - YNPageViewControllerDataSource
- (UIScrollView *)pageViewController:(YNPageViewController *)pageViewController pageForIndex:(NSInteger)index {
    UIViewController *vc = pageViewController.controllersM[index];
    return [(IOSGodsHistoryVC *)vc tableView];
}

#pragma mark - YNPageViewControllerDelegate
- (void)pageViewController:(YNPageViewController *)pageViewController
            contentOffsetY:(CGFloat)contentOffset
                  progress:(CGFloat)progress {
//    NSLog(@"--- contentOffset = %f,    progress = %f", contentOffset, progress);
}


@end
