//
//  FMZPChooWishVC.m
//  FindMe
//
//  Created by mac on 2021/6/2.
//

#import "FMZPChooWishVC.h"
#import "FMZPShowWishVC.h"
#import "FMTagSelelctView.h"
@interface FMZPChooWishVC ()
@property (nonatomic,assign) NSInteger pageIndex;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) FMTagSelelctView *tagView;
@property (nonatomic,strong) UIView *bottomView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *detailArr;

@property (nonatomic,strong) NSArray *tagArr;

@property (nonatomic,strong) UIButton *beforeBtn;
@property (nonatomic,strong) UIButton *nextBtn;

@property (nonatomic,strong) NSMutableArray *selectedTagArr;
@end

@implementation FMZPChooWishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self baseset];
    [self setNavbutton];
    [self creatMianUI];

}
-(void)baseset{
    self.pageIndex = 0;
    self.titleArr = @[@"你的人生你做主",@"健康类",@"学习成长类",@"生活类",@"理财类"];
    self.detailArr = @[@"--  规划铸就成功人生，掌握属于自己的人生  --",
                       @"学习改变观念，观念改变行动，行动改变命运",
                       @"--  规划铸就成功人生，掌握属于自己的人生  --",
                       @"学习改变观念，观念改变行动，行动改变命运",
                       @"人要走在安全的路上，资金要投在稳健的投资渠道中~"];
    
    self.tagArr = @[@[@"挣一个亿",@"买一套房",@"买辆好车",@"出国旅游",@"生个娃娃",@"喜结连理",@"学会乐器",@"保持身材",@"身体健康"],
                    @[@"多喝热水",@"坚持运动",@"我要晨跑",@"拒绝油腻",@"拒绝奶茶",@"每周健身",@"多吃水果",@"多吃蔬菜",@"每年体检"],
                    @[@"每周一书",@"每日一记",@"练习英语",@"读书笔记",@"心理书籍",@"与人沟通",@"修身养性",@"提升学历",@"考取证书"],
                    @[@"学会放松",@"精致生活",@"学会感恩",@"认真护肤",@"要断舍离",@"养一只狗",@"与邻为善",@"打扫卫生",@"养护花草"],
                    @[@"理财计划",@"阅读书籍",@"开源节流",@"合理支出",@"积累财富",@"资产分配",@"安享晚年",@"投资基金",@"学习股票"]];
    NSArray *tagselectArr = @[@[],@[],@[],@[],@[]];
    self.selectedTagArr = [NSMutableArray arrayWithArray:tagselectArr];
}
- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
-(void)sendData{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/editSaveWishPersonal"];
    if (self.selectedTagArr.count<5) {
        [self showHint:@"请正确选择您的目标"];
        return;
    }
    NSArray *Arr = self.selectedTagArr[0];
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
    for (NSString *str in Arr) {
        [mutArr addObject:kStringFormat(@"%@&1",str)];
    }
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"compId":User_Companyid,
                               @"zhuyaoPlan":[self zhuzuZhuangjson:mutArr],
                               @"healthPlan":[self zhuzuZhuangjson:self.selectedTagArr[1]],
                               @"studyPlan":[self zhuzuZhuangjson:self.selectedTagArr[2]],
                               @"lifePlan":[self zhuzuZhuangjson:self.selectedTagArr[3]],
                               @"managePlan":[self zhuzuZhuangjson:self.selectedTagArr[4]],

    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            [self showHint:@"新增成功"];
            FMZPShowWishVC *pushVC = [[FMZPShowWishVC alloc] init];
            [self.navigationController pushViewController:pushVC animated:YES];

        }else {
            [self showHint:responseObject[@"msg"]];
            

            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
-(void)creatMianUI{
    UILabel *titleLabel = [self.view createLabelFrame:CGRectMake(20,NavHeight+ 50, KDeviceWith-40, 40) textColor:[UIColor blackColor] font:kBOLDFONT(36)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    titleLabel.text = self.titleArr[self.pageIndex];
    UILabel *detailLabel = [self.view createLabelFrame:CGRectMake(20, NavHeight+100, KDeviceWith-40, 40) textColor:[UIColor grayColor] font:kFONT(18)];
    detailLabel.numberOfLines = 2;
    detailLabel.textAlignment = NSTextAlignmentCenter;
    self.detailLabel = detailLabel;
    detailLabel.text = self.detailArr[self.pageIndex];
    detailLabel.numberOfLines = 2;

    
    FMTagSelelctView *tagView = [[FMTagSelelctView alloc] initWithFrame:CGRectMake(10, NavHeight+180,KDeviceWith-20 , KDeviceHeight-180-100-SafeAreaBottomHeight-NavHeight-30) withData:self.tagArr[self.pageIndex] selelctArr:self.selectedTagArr[self.pageIndex]];
    [self.view addSubview:tagView];
    self.tagView = tagView;
    [self creatBottomView];
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-100-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 100+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    self.bottomView = bottomView;
    
    UIButton *beforeBtn = [bottomView createButtonFrame:CGRectMake(20, 20, (KDeviceWith-60)/2, 60) title:@"上一步" textColor:IOSMainColor font:kFONT(18) image:nil target:self method:@selector(beforeBtnClicked)];
    beforeBtn.backgroundColor =IOSCancleBtnColor;
    UIButton *nextBtn = [bottomView createButtonFrame:CGRectMake(20, 20, KDeviceWith-40, 60) title:@"1/5 下一步" textColor:[UIColor whiteColor] font:kFONT(18) image:nil target:self method:@selector(nextBtnClicked)];
    nextBtn.backgroundColor = IOSMainColor;
    self.nextBtn = nextBtn;
    self.beforeBtn = beforeBtn;
    beforeBtn.hidden = YES;
    beforeBtn.topleftValue = 10;
    beforeBtn.toprightValue = 30;
    beforeBtn.bottomleftValue = 10;
    beforeBtn.bottomrightValue = 10;
    [beforeBtn drawMyRect];
    
    nextBtn.topleftValue = 10;
    nextBtn.toprightValue = 30;
    nextBtn.bottomleftValue = 10;
    nextBtn.bottomrightValue = 10;
    [nextBtn drawMyRect];
    
}
-(void)beforeBtnClicked{
    self.pageIndex--;
    if (self.pageIndex==0){
        self.beforeBtn.hidden = YES;
        self.nextBtn.frame = CGRectMake(20, 20, KDeviceWith-40, 60);
        self.nextBtn.topleftValue = 10;
        self.nextBtn.toprightValue = 30;
        self.nextBtn.bottomleftValue = 10;
        self.nextBtn.bottomrightValue = 10;
        [self.nextBtn drawMyRect];
    }
    [self.nextBtn setTitle:kStringFormat(@"%li/5 保存心愿单",self.pageIndex+1) forState:0];

    self.titleLabel.text = self.titleArr[self.pageIndex];
    self.detailLabel.text =self.detailArr[self.pageIndex];
    [self.tagView removeFromSuperview];
    self.tagView = nil;
    FMTagSelelctView *tagView = [[FMTagSelelctView alloc] initWithFrame:CGRectMake(10, NavHeight+180,KDeviceWith-20 , KDeviceHeight-180-100-SafeAreaBottomHeight-NavHeight-30) withData:self.tagArr[self.pageIndex] selelctArr:self.selectedTagArr[self.pageIndex]];
    [self.view addSubview:tagView];
    self.tagView = tagView;

}
-(void)nextBtnClicked{

    if (self.tagView.selelctedArr.count==0) {
        [self showHint:@"请先选择您的目标"];
        return;
    }
    self.pageIndex++;
    self.beforeBtn.hidden = NO;
    [self.selectedTagArr replaceObjectAtIndex:self.pageIndex-1 withObject:self.tagView.selelctedArr];

    if (self.pageIndex==4) {
        [self.nextBtn setTitle:kStringFormat(@"5/5 保存心愿单") forState:0];
    }else if (self.pageIndex>=5){
        self.pageIndex--;
        [self sendData];
        return;
    }else if (self.pageIndex==1){
        self.nextBtn.frame = CGRectMake(KDeviceWith/2+10, 20, (KDeviceWith-60)/2, 60);
        self.nextBtn.topleftValue = 10;
        self.nextBtn.toprightValue = 30;
        self.nextBtn.bottomleftValue = 10;
        self.nextBtn.bottomrightValue = 10;
        [self.nextBtn drawMyRect];
    }
    [self.nextBtn setTitle:kStringFormat(@"%li/5 保存心愿单",self.pageIndex+1) forState:0];


    self.titleLabel.text = self.titleArr[self.pageIndex];
    self.detailLabel.text =self.detailArr[self.pageIndex];
    self.detailLabel.numberOfLines = 2;

    
    [self.tagView removeFromSuperview];
    self.tagView = nil;
    FMTagSelelctView *tagView = [[FMTagSelelctView alloc] initWithFrame:CGRectMake(10, NavHeight+180,KDeviceWith-20 , KDeviceHeight-180-100-SafeAreaBottomHeight-NavHeight-30) withData:self.tagArr[self.pageIndex] selelctArr:self.selectedTagArr[self.pageIndex]];
    [self.view addSubview:tagView];
    self.tagView = tagView;

    
}
- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];


}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"IOSGuanbi"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 35,35);

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    

}


#pragma mark ---点击事件----
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
