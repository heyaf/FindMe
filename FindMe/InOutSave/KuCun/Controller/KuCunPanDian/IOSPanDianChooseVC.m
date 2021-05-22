//
//  IOSPanDianChooseVC.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianChooseVC.h"
#import "IOSPanDianChoDetailVC.h"
@interface IOSPanDianChooseVC ()<YNPageViewControllerDataSource, YNPageViewControllerDelegate>

@end

@implementation IOSPanDianChooseVC



- (void)viewDidLoad {
    YNPageConfigration *configration = [YNPageConfigration defaultConfig];
    configration.pageStyle = YNPageStyleTop;
    configration.headerViewCouldScale = YES;
    configration.showTabbar = NO;
    configration.showNavigation = YES;
    configration.scrollMenu = NO;
    configration.scrollViewBackgroundColor = RGBA(250, 250, 250, 1);
    configration.bottomLineBgColor = RGBA(245, 245, 245, 1);
    configration.selectedItemColor = [UIColor blackColor];
    configration.selectedItemFont = FONT(16);
    configration.normalItemColor = RGBA(51, 51, 51, 1);
    configration.lineColor = [UIColor whiteColor];
    configration.lineLeftAndRightAddWidth = -15;
    configration.aligmentModeCenter = NO;
    configration.lineWidthEqualFontWidth = NO;
    configration.showBottomLine = NO;
    NSMutableArray *buttonArr = [NSMutableArray array];
    NSArray * titleArr = [self getArrayTitles];
    for (int i =0; i<titleArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:0];
//        [button setBackgroundImage:ImageNamed(@"xiaoshoudan") forState:0];
        [button setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:UIControlStateSelected];
        [buttonArr addObject:button];
    }
    configration.buttonArray = buttonArr;


    self.controllersM = [[self getArrayVCs] mutableCopy];
    self.titlesM = [[self getArrayTitles] mutableCopy];
    self.config = configration;

    self.dataSource = self;
    self.delegate = self;

    self.pageIndex = 0;
    [super viewDidLoad];
    
    self.pageScrollView.yz_height = KDeviceHeight - KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80-44;
    [self creatBottomView];
    [self setNavbutton];
}
- (NSArray *)getArrayVCs {
    IOSPanDianChoDetailVC *firstVC = [[IOSPanDianChoDetailVC alloc] init];

    IOSPanDianChoDetailVC *secondVC = [[IOSPanDianChoDetailVC alloc] init];

    IOSPanDianChoDetailVC *threeVC = [[IOSPanDianChoDetailVC alloc] init];


    return @[firstVC, secondVC, threeVC];
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"关闭icon"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 35,35);

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"sousuoitenimg"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(pandiansearch) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;

}

- (NSArray *)getArrayTitles {
    return @[@"全部", @"可回收",@"不可回收"];
}
#pragma mark - YNPageViewControllerDataSource
- (UIScrollView *)pageViewController:(YNPageViewController *)pageViewController pageForIndex:(NSInteger)index {
    UIViewController *vc = pageViewController.controllersM[index];
    return [(IOSPanDianChoDetailVC *)vc tableView];
}
#pragma mark - YNPageViewControllerDelegate
- (void)pageViewController:(YNPageViewController *)pageViewController
            contentOffsetY:(CGFloat)contentOffset
                  progress:(CGFloat)progress {
//    NSLog(@"--- contentOffset = %f,    progress = %f", contentOffset, progress);
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor redColor];

    [self.view addSubview:bottomView];

    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-30-120, 10, 120, 60)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, 120, 60);
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];


    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-120-30-30, 20)];
    priceLabel.text = @"共0件商品，共计0.00元";
    [bottomView addSubview:priceLabel];

}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pandiansearch{

}
-(void)makeSureBtnClicked{

}
@end
