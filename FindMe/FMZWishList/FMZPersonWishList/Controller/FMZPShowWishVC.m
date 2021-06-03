//
//  FMZPShowWishVC.m
//  FindMe
//
//  Created by mac on 2021/6/2.
//

#import "FMZPShowWishVC.h"
#import "FMZPChooWishVC.h"
@interface FMZPShowWishVC ()

@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) NSMutableArray *tagArr;
@property (nonatomic,strong) UIImageView *mainbgImG;
@property (nonatomic,assign) NSInteger wishId;

@end

@implementation FMZPShowWishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
//    NSArray *arr = @[@[@"挣一个亿&2",@"买一套房&1",@"身体健康&2"],
//                    @[@"多喝热水",@"坚持运动",@"我要晨跑",@"拒绝油腻",@"拒绝奶茶",@"每周健身",@"多吃水果",@"多吃蔬菜",@"每年体检"],
//                    @[@"每周一书",@"每日一记",@"练习英语",@"读书笔记",@"心理书籍",@"与人沟通",@"修身养性",@"提升学历",@"考取证书"],
//                    @[@"学会放松",@"精致生活",@"学会感恩",@"认真护肤",@"要断舍离",@"养一只狗",@"与邻为善",@"打扫卫生",@"养护花草"],
//                    @[@"理财计划",@"阅读书籍",@"开源节流",@"合理支出",@"积累财富",@"资产分配",@"安享晚年",@"投资基金",@"学习股票"]];
    [self creatMainView];
    [self popParentVC];
    [self initData];

}
-(void)initData{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/selectPersonalPlan"];

    NSDictionary *paramDic = @{@"empId":kUser_id,
                              

    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSDictionary *dic = responseObject[@"data"];
            self.wishId = [dic[@"id"] intValue];
            NSArray *arr = @[[self jsonzhuanHuaArr:dic[@"zhuyaoPlan"]],
                             [self jsonzhuanHuaArr:dic[@"healthPlan"]],
                             [self jsonzhuanHuaArr:dic[@"studyPlan"]],
                             [self jsonzhuanHuaArr:dic[@"lifePlan"]],
                             [self jsonzhuanHuaArr:dic[@"managePlan"]]];
            self.tagArr = [NSMutableArray arrayWithArray:arr];
            [self creatSubViews];

        }else {
            [self showHint:responseObject[@"msg"]];
            

            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
-(void)sendData{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/editSaveWishPersonal"];
    if (self.tagArr.count<5) {
        [self showHint:@"数据错误"];
        return;
    }
    if (self.wishId==0) {
        [self showHint:@"请稍后重试"];
        return;
    }
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"compId":User_Companyid,
                               @"zhuyaoPlan":[self zhuzuZhuangjson:self.tagArr[0]],
                               @"healthPlan":[self zhuzuZhuangjson:self.tagArr[1]],
                               @"studyPlan":[self zhuzuZhuangjson:self.tagArr[2]],
                               @"lifePlan":[self zhuzuZhuangjson:self.tagArr[3]],
                               @"managePlan":[self zhuzuZhuangjson:self.tagArr[4]],
                               @"id":kStringFormat(@"%li",self.wishId)

    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
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
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    [self sendData];


}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    self.mainScrollView.contentSize = CGSizeMake(KDeviceWith, KDeviceHeight*2);
}
-(void)creatMainView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -NavHeight, KDeviceWith, KDeviceHeight+NavHeight)];
    scrollView.contentSize = CGSizeMake(KDeviceWith, KDeviceHeight*5);
    [self.view addSubview:scrollView];
    self.mainScrollView = scrollView;
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight*5)];
    UIImage *bgImage = ImageNamed(@"EMWLbgviewcell");
    bgImageView.image = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(100, 30, 80, 30) resizingMode:UIImageResizingModeStretch];
    [scrollView addSubview:bgImageView];
    self.mainbgImG = bgImageView;
    
}
-(void)creatSubViews{
    NSArray *imageNameArr = @[@"EMWLbgview52",@"EMWLbgview42",@"bgview32",@"EMWLbgview22",@"EMWLbgview12"];
    NSArray *NameArr = @[@"",@"健康类",@"学习成长类",@"生活类",@"理财类"];

    CGFloat mainHieght = 300.0;
    for (int i=0; i<self.tagArr.count; i++) {
        UIView *cellBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100)];
        cellBgView.backgroundColor = [UIColor clearColor];
        CGFloat cellheight = 150.0;
        NSArray *cellArr = self.tagArr[i];
        CGFloat marginY = 20.0;
        if (i==0) {
            for (int j=0;j<cellArr.count;j++) {
                
                NSString *btnStr = cellArr[j];
                UIButton *cellBtn = [self buttonWithData:btnStr];
                cellBtn.frame = CGRectMake(0, (marginY+20)*j+100, 105, 20);
                cellBtn.centerX = cellBgView.centerX;
                [cellBgView addSubview:cellBtn];
                cellheight+=(marginY+20);
            }
            cellBgView.height = cellheight+20;
            
        }
        else{
            for (int j=0;j<cellArr.count;j++) {
                NSString *btnStr = cellArr[j];
                UILabel *cellLabel = [self detailLabelWithtext:btnStr];
                cellLabel.frame = CGRectMake(0, (marginY+20)*j+marginY+70, 105, 20);
                cellLabel.centerX = cellBgView.centerX;
                if (i==2) {
                    cellLabel.textColor = [UIColor whiteColor];
                }
                [cellBgView addSubview:cellLabel];
                cellheight+=(marginY+20);
            }
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, KDeviceWith-40, 30)];
            nameLabel.textAlignment = NSTextAlignmentCenter;
            nameLabel.font = kBOLDFONT(30);
            nameLabel.text = NameArr[i];
            nameLabel.textColor = RGBA(57, 89, 199, 1);
            if (i==2) {
                nameLabel.textColor = [UIColor whiteColor];
            }
            [cellBgView addSubview:nameLabel];
            cellBgView.height = cellheight+20;
        }
        
        
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, KDeviceWith-40, cellBgView.height)];
        UIImage *bgImage = ImageNamed(imageNameArr[i]);
        bgImageView.image = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(120, 100, 30, 30) resizingMode:UIImageResizingModeStretch];
        [cellBgView addSubview:bgImageView];
        [cellBgView sendSubviewToBack:bgImageView];
        cellBgView.y = mainHieght;

        mainHieght+=cellBgView.height;
        [self.mainScrollView addSubview:cellBgView];
    }
    self.mainScrollView.contentSize = CGSizeMake(KDeviceWith, mainHieght+300);
    self.mainbgImG .height = mainHieght+300;
    UIImage *bgImage = ImageNamed(@"EMWLbgviewcell");
    self.mainbgImG.image = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(50, 40, 50, 40) resizingMode:UIImageResizingModeStretch];
}
-(UIButton*)buttonWithData:(NSString *)btnStr
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, 105, 20);

    button.selected = NO;
    NSArray *sepArr = [btnStr componentsSeparatedByString:@"&"];
    if ([sepArr[1] isEqualToString:@"2"]) {
        button.selected = YES;
    }
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.minimumScaleFactor = 0.8;
    [button.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    
//    [button setTintColor:[UIColor purpleColor]];
    
    [button addTarget:self action:@selector(buttonCilcked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:sepArr[0] forState:UIControlStateNormal];
    button.titleLabel.textColor = RGBA(57, 89, 199, 1);
    [button setImage:ImageNamed(@"FMWLSIngleCho") forState:0];
    [button setImage:ImageNamed(@"FMWLSIngleChod") forState:UIControlStateSelected];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 85)];


    return button;
}
-(void)buttonCilcked:(UIButton *)btn{
    btn.selected = !btn.isSelected;
    NSString *btnstr = btn.titleLabel.text;
    if (btn.isSelected) {
        btnstr = kStringFormat(@"%@&2",btnstr);
    }else{
        btnstr = kStringFormat(@"%@&1",btnstr);

    }
    
    for (int i =0; i<self.tagArr.count; i++) {
        NSArray *tagArr = self.tagArr[i];
        NSMutableArray *mutTagArr = [NSMutableArray arrayWithArray:tagArr];
        for (int j=0;j<tagArr.count;j++) {
            NSString *str = tagArr[j];
            if ([str containsString:btn.titleLabel.text] ) {
                [mutTagArr replaceObjectAtIndex:j withObject:btnstr];
                break;
            }
        }
        [self.tagArr replaceObjectAtIndex:i withObject:mutTagArr];
    }
    
}

-(UILabel *)detailLabelWithtext:(NSString *)text{
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    detailLabel.text = text;
    detailLabel.textAlignment = NSTextAlignmentCenter;
    detailLabel.textColor = RGBA(57, 89, 199, 1);
    detailLabel.font = kFONT(16);
    return detailLabel;
}

//父级视图出栈
- (void)popParentVC
{
    if (self.navigationController.viewControllers.count >= 3) {//viewControllers.count大于3 才有中间页面
        NSMutableArray *array = self.navigationController.viewControllers.mutableCopy;
    
        NSMutableArray *arrRemove = [NSMutableArray array];

        for (UIViewController *vc in array) {
        //判断需要销毁的控制器 加入数组
        if ([vc isKindOfClass:[FMZPChooWishVC class]]) {
            
        }else{
            [arrRemove addObject:vc];
        }
    }
    
    if (arrRemove.count) {
        [self.navigationController setViewControllers:arrRemove animated:NO];
    }
    
   }
    self.hidesBottomBarWhenPushed = YES;

}
@end
