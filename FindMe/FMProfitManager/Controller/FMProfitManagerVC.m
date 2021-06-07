//
//  FMProfitManagerVC.m
//  FindMe
//
//  Created by mac on 2021/6/7.
//

#import "FMProfitManagerVC.h"
#import <JhtMarquee/JhtVerticalMarquee.h>  //跑马灯
#import "FMProfitHeaderCVCell.h"
#import "FMLIneChartView.h"
#import "FMPaixuView.h"
#import "FMTBHeaderView.h"
#import "FMProfitManagerTBCell.h"
@interface FMProfitManagerVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *marQueeBGView;
@property (nonatomic,strong) JhtVerticalMarquee *verMarquee; //顶部跑马灯
//合同价 CollectionView
@property (nonatomic,strong) UICollectionView *headCollectV;
@property (nonatomic, strong) UICollectionViewFlowLayout *FlowLayout;

@property (nonatomic,strong) FMLIneChartView *chartView;
@property (nonatomic,strong) FMPaixuView *paixuView;
@property (nonatomic,strong) FMTBHeaderView *TBheaderView;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation FMProfitManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(53, 53, 53, 1);
    
    [self creatMainUI];
}
-(void)creatMainUI{
    
    self.navigationItem.title = @"利润管理";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//
    
    UIImage *image = [UIImage imageNamed:@"backbai"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    
    //跑马灯模块
    UIView *marqueeBgview = [[UIView alloc] initWithFrame:CGRectMake(10, 10, kScreenW-20, 40)];
    marqueeBgview.backgroundColor = [UIColor blackColor];
    kViewRadius(marqueeBgview, 10);
    
    UIImageView *imageV= [[UIImageView alloc] initWithFrame:CGRectMake(15, 13, 15, 15)];
    imageV.image = ImageNamed(@"FMPlabaIcon");
    [marqueeBgview addSubview:imageV];
    self.marQueeBGView = marqueeBgview;
    [self.view addSubview:marqueeBgview];
    [self addVerticalMarquee];
    
    //collectionView
    self.FlowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.headCollectV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60, KDeviceWith, 70) collectionViewLayout:self.FlowLayout];
    self.headCollectV.delegate = self;
    self.headCollectV.dataSource = self;
    self.FlowLayout.itemSize = CGSizeMake(KDeviceWith/5, 70);
    self.FlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.headCollectV.backgroundColor = [UIColor clearColor];
    self.headCollectV.showsVerticalScrollIndicator = NO;
    [self.headCollectV registerNib:[UINib nibWithNibName:@"FMProfitHeaderCVCell" bundle:nil] forCellWithReuseIdentifier:@"FMProfitHeaderCVCell"];

    self.headCollectV.autoresizingMask = NO;
    [self.view addSubview:self.headCollectV];
    
    //折线图饼状图模块
    self.chartView = [[FMLIneChartView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 200)];
    [self.view addSubview:self.chartView];
    
    [self.chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.headCollectV.mas_bottom);
        make.height.mas_offset(200);
    }];
    //排序视图
    self.paixuView = [[FMPaixuView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 60)];
    [self.view addSubview:self.paixuView];
    [self.paixuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.chartView.mas_bottom);
        make.height.mas_offset(40);
    }];
    //tableView
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.paixuView.mas_bottom);
    }];
    
}
#pragma mark ---代理方法---
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 70;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FMProfitHeaderCVCell *headerColleCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FMProfitHeaderCVCell" forIndexPath:indexPath];
    return headerColleCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FMProfitManagerTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FMProfitManagerTBCell"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.TBheaderView;
}




















-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"FMProfitManagerTBCell" bundle:nil] forCellReuseIdentifier:@"FMProfitManagerTBCell"];
    }
    return _tableView;
}


-(FMTBHeaderView *)TBheaderView{
    if (!_TBheaderView) {
        _TBheaderView = [[FMTBHeaderView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 50)];
    }
    return _TBheaderView;
}
/** 添加纵向 跑马灯 */
- (void)addVerticalMarquee {
    [self.marQueeBGView addSubview:self.verMarquee];
    
    [self.verMarquee scrollWithCallbackBlock:^(JhtVerticalMarquee *view, NSInteger currentIndex) {
    }];
    NSArray *soureArray = @[@"1. 谁曾从谁的青春里走过，留下了笑靥",
                            @"3. 谁又从谁的雨季里消失，泛滥了眼泪 颤抖吧",
                            @"4. 人生路，路迢迢，谁道自古英雄多寂寥  若一朝，看透了，一身清风挣多少"];
    
//    self.verticalMarquee.isCounterclockwise = YES;
    self.verMarquee.sourceArray = soureArray;
    
    // 开始滚动
    [self.verMarquee marqueeOfSettingWithState:MarqueeStart_V];
}
-(JhtVerticalMarquee *)verMarquee{
    if (!_verMarquee) {
        _verMarquee = [[JhtVerticalMarquee alloc] initWithFrame:CGRectMake(45, 00, kScreenW-20-50, 40)];
        _verMarquee.numberOfLines = 2;
        _verMarquee.backgroundColor = [UIColor blackColor];
        _verMarquee.textColor =[UIColor grayColor];
    }
    return _verMarquee;
}
- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kRGB(53, 53, 53) size:CGSizeMake(kScreenW, kNavBarHeight)] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];


}

@end
