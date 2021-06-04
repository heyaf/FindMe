//
//  FMZWEditWishVC.m
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import "FMZWEditWishVC.h"
#import "FMaddwishTBcell.h"
#import "FMaddWishModel.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

#define starBGViewW (KDeviceWith-40-110-60)
@interface FMZWEditWishVC ()<UITableViewDataSource,UITableViewDelegate>
//tableView头部视图
@property(nonatomic, assign)NSInteger  imageHeight;

@property (nonatomic,strong) NSMutableArray *leavelArr;
@property (nonatomic,strong) NSMutableArray *startArr;
@property (nonatomic,strong) UIView *leavlView;
@property (nonatomic,strong) UIView *starView;

@property (nonatomic,strong) NSMutableArray *leavelbtnArr;
@property (nonatomic,strong) NSMutableArray *startbtnArr;

@property (nonatomic,assign) NSInteger leaveIndex;
@property (nonatomic,assign) NSInteger starIndex;

@property (nonatomic,strong) NSMutableArray *inputedArr;

@end

@implementation FMZWEditWishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageHeight = kScreenW/1125*895;// 背景图片的高度
    [self createTableViewHeaderView];
    self.view.backgroundColor =[UIColor whiteColor];
    [self initData];
    [self CreatTableview];
    [self creatBottomView];
    [self.view bringSubviewToFront:self.tabelView];

    
}
-(void)initNetData{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/selectLevel"];
    NSDictionary *paramDic = @{@"compId":User_Companyid
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            self.leavelArr = responseObject[@"data"];
            [self.tabelView reloadData];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.tabelView reloadData];

            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
    NSString *url1 = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/selectStar"];
    NSDictionary *paramDic1 = @{@"compId":User_Companyid,
                               @"empId":kUser_id
    };
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url1 body:paramDic1 sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            self.startArr = responseObject[@"data"];

            [self.tabelView reloadData];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.tabelView reloadData];

            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}

-(void)initData{
    NSArray *titleArr = @[@"录入量(个)",@"签单量(个)",@"签单金额(元)"];
    NSArray *placeHolder =@[@"录入量",@"签单量",@"签单金额"];
    NSArray *detailArr = @[@"说明：录入量为录入有效客户的数量",@"说明:签单量为签下有效单的数量",@"说明：签单金额为签下有效单的金额"];
    NSString *tagStr = @"本日计划";
    switch (self.type) {
        case 2:
            tagStr = @"本周计划";
            break;
        case 3:
            tagStr = @"本月计划";
            break;
        case 4:
            tagStr = @"本季计划";
            break;
        case 5:
            tagStr = @"本年计划";
            break;
        default:
            break;
    }
    NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<titleArr.count; i++) {
        FMaddWishModel *wishModel = [[FMaddWishModel alloc] init];
        wishModel.titleString = titleArr[i];
        wishModel.tagStr = tagStr;
        wishModel.detailStr = detailArr[i];
        wishModel.placeholder = placeHolder[i];
        [dataArr addObject:wishModel];
    }
    self.dataSource = dataArr;
    self.leavelbtnArr = [NSMutableArray arrayWithCapacity:0];
    self.startbtnArr = [NSMutableArray arrayWithCapacity:0];
    self.inputedArr = [NSMutableArray arrayWithArray:@[@"",@"",@""]];
    [self initNetData];
}
#pragma mark - 创建头视图
- (void)createTableViewHeaderView
{
//    UIImageView *headerBackView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, _imageHeight)];
    // 背景图
    UIImageView *headerBackView = [[UIImageView alloc] init];
    headerBackView.backgroundColor = [UIColor whiteColor];
    headerBackView.frame = CGRectMake(0, 0, kScreenW, _imageHeight);
    headerBackView.contentMode = UIViewContentModeScaleAspectFill;
    headerBackView.image = ImageNamed(@"EMWLjishuabgview");
    [self.view addSubview:headerBackView];
    
    UILabel *titleLabel = [headerBackView createLabelFrame:CGRectMake(20, kNavBarHeight+40, KDeviceWith-40, 30) textColor:[UIColor whiteColor] font:kBOLDFONT(30)];
    titleLabel.text = @"添加心愿单";
    
    UILabel *titleLabel1 = [headerBackView createLabelFrame:CGRectMake(20, kNavBarHeight+90, KDeviceWith-40, 35) textColor:[UIColor whiteColor] font:kFONT(17)];
    titleLabel1.numberOfLines = 2;
    titleLabel1.text = @"今日计划按部就班，明日计划秩序井然";
    titleLabel.userInteractionEnabled = YES;
    titleLabel1.userInteractionEnabled = YES;
    headerBackView.userInteractionEnabled = YES;
    
    
}
-(void)CreatTableview{
    self.tabelView.y = -kNavBarHeight;
    self.tabelView.height = KDeviceHeight+kNavBarHeight-100-KEVNScreenTabBarSafeBottomMargin;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.backgroundColor = [UIColor clearColor];
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tabelView.sectionHeaderHeight = _imageHeight-kNavBarHeight;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, _imageHeight-kNavBarHeight)];
        headView.backgroundColor = [UIColor clearColor];
    self.tabelView.tableHeaderView = headView;
    [self.tabelView registerNib:[UINib nibWithNibName:@"FMaddwishTBcell" bundle:nil] forCellReuseIdentifier:@"FMaddwishTBcell"];
    
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-100-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 100+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = RGBA(250, 250, 250, 1);

    [self.view addSubview:bottomView];

    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, 10, KDeviceWith-40, 60)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, KDeviceWith-40, 60);
    [makeSureBtn setTitle:@"保 存" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)makeSureBtnClicked{
    for (NSString *str in self.inputedArr) {
        if (str.length==0) {
            [self showHint:@"请正确输入后再提交"];
            return;
        }
    }
    if (self.leaveIndex<1) {
        [self showHint:@"选择您的目标级别"];
        return;
    }
    
    if (self.starIndex<1) {
        [self showHint:@"选择您的目标星级"];
        return;
    }
    
    NSString *url1 = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/editSaveWishWork"];
    NSDictionary *dateDic = self.leavelArr[self.leaveIndex-1];
    NSDictionary *dateDic1 = self.startArr[self.starIndex-1];

//    NSLog(@"%@,%@,%@,%@,%@",kStringFormat(@"%li",self.type),self.leavelArr[self.leaveIndex][@"levleName"],self.leavelArr[self.leaveIndex][@"levleId"],self.startArr[self.starIndex][@"startLevleName"],self.startArr[self.starIndex][@"levleId"]);
//    NSLog(@"%@,%@",dateDic,dateDic[@"levelName"]);
    NSDictionary *paramDic1 = @{@"compId":User_Companyid,
                               @"empId":kUser_id,
                                @"cycleTime":kStringFormat(@"%li",self.type),
                                @"qiandanNum":self.inputedArr[0],
                                @"luruNum":self.inputedArr[1] ,
                                @"qiandanPrice":self.inputedArr[2],
                                @"levleName":dateDic[@"levelName"],
                                @"levleId":dateDic[@"levelId"],
                                @"startLevleName":dateDic1[@"star_name"],
                                @"startLevleId":dateDic1[@"star_id"],

    };
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url1 body:paramDic1 sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            [self showHint:@"新增成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.tabelView reloadData];

            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger index =3;
    if (self.leavelArr.count>0) {
        index++;
    }
    if (self.startArr.count>0){
        index++;
    }
    return index;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<3) {

        return 150;
    }else if (indexPath.row==3){
        NSInteger height = self.leavlView.height+110;
        return height;
    }else if (indexPath.row==4){
        NSInteger height = self.starView.height+110;
        return height;

    }
    return 150;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取消重用
    FMaddwishTBcell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FMaddwishTBcell class])
                                                           owner:self
                                                         options:nil] objectAtIndex:0];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row<3) {
        FMaddWishModel *wishM = self.dataSource[indexPath.row];
         cell.addWishModel = wishM;
        cell.textfieldEndBlock = ^(NSString * _Nonnull textFieldStr) {
            [self.inputedArr replaceObjectAtIndex:indexPath.row withObject:textFieldStr];
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        cell.textField.text = self.inputedArr[indexPath.row];
    }else{
        NSString *tagStr = @"本日计划";
        switch (self.type) {
            case 2:
                tagStr = @"本周计划";
                break;
            case 3:
                tagStr = @"本月计划";
                break;
            case 4:
                tagStr = @"本季计划";
                break;
            case 5:
                tagStr = @"本年计划";
                break;
            default:
                break;
        }
        if (indexPath.row==3) {
            cell.customerView.height = self.leavlView.height+90;
            [cell.contentView addSubview:self.leavlView];
            [cell setleavelViewwithtagStr:tagStr];

        }else{
            cell.customerView.height = self.starView.height+90;
            [cell.contentView addSubview:self.starView];
            [cell setstartViewwithtagStr:tagStr];

        }

    }

    
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return _imageHeight-kNavBarHeight;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, _imageHeight-kNavBarHeight)];
//    headView.backgroundColor = [UIColor clearColor];
//    return headView;
//}
-(UIView *)leavlView{
    if (!_leavlView) {
        _leavlView = [[UIView alloc] initWithFrame:CGRectMake(90, 40, starBGViewW, 100)];
        [self addleavelSubViews];
    }
    return _leavlView;
}
-(void)addleavelSubViews
    {CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 0;//用来控制button距离父视图的高
    for (int i = 0; i < self.leavelArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 101 + i;
        button.backgroundColor = RGBA(250, 250, 250,1);
        [button addTarget:self action:@selector(leavehandleClick:) forControlEvents:UIControlEventTouchUpInside];
        //根据计算文字的大小
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGFloat length = [self.leavelArr[i][@"levelName"] boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        //为button赋值
        [button setTitle:self.leavelArr[i][@"levelName"] forState:UIControlStateNormal];
        //设置button的frame
        button.frame = CGRectMake(15 + w, h, length + 30 , 25);
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        NSLog(@"%f,,,%f,,,%f",starBGViewW,w,length);

        if( w + length +15+30> starBGViewW){
            w = 0; //换行时将w置为0
            h = h + button.frame.size.height + 15;//距离父视图也变化
            button.frame = CGRectMake(15 + w, h, length + 30, 25);//重设button的frame
        }
        w = button.frame.size.width + button.frame.origin.x;
        [self.leavlView addSubview:button];
        ViewRadius(button, 8);
        [button setTitleColor:RGBA(102, 102, 102,1) forState:0];
        button.titleLabel.font= kFONT(14);
        [self.leavelbtnArr addObject:button];
//        if (i==0) {
//            [button setTitleColor:kRGB(0, 160, 233) forState:0];
//            button.backgroundColor = kRGB(242, 251, 255);
//        }
        
    }
    _leavlView.height = h+30;
    
}
-(void)leavehandleClick:(UIButton *)button{
    for (UIButton *btn in self.leavelbtnArr) {
        btn.backgroundColor = RGBA(250, 250, 250,1);
        [btn setTitleColor:RGBA(102, 102, 102,1) forState:0];

    }
    [button setTitleColor:[UIColor whiteColor] forState:0];
    [button setBackgroundColor:FMWZMainColor];

    self.leaveIndex = button.tag-100;
    

}
-(UIView *)starView{
    if (!_starView) {
        _starView = [[UIView alloc] initWithFrame:CGRectMake(90, 40, starBGViewW, 100)];
        [self addStartSubViews];
    }
    return _starView;
}
-(void)addStartSubViews{
    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 0;//用来控制button距离父视图的高
    for (int i = 0; i < self.startArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 201 + i;
        button.backgroundColor = RGBA(250, 250, 250,1);
        [button addTarget:self action:@selector(starthandleClick:) forControlEvents:UIControlEventTouchUpInside];
        //根据计算文字的大小
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGFloat length = [self.startArr[i][@"star_name"] boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        //为button赋值
        [button setTitle:self.startArr[i][@"star_name"] forState:UIControlStateNormal];
        //设置button的frame
        button.frame = CGRectMake(15 + w, h, length + 30 , 25);
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
//        NSLog(@"%f,,,%f,,,%f",starBGViewW,w,length);
        if(15+ w + length +30> starBGViewW){
            w = 0; //换行时将w置为0
            h = h + button.frame.size.height + 15;//距离父视图也变化
            button.frame = CGRectMake(15 + w, h, length + 30, 25);//重设button的frame
        }
        w = button.frame.size.width + button.frame.origin.x;
        [self.starView addSubview:button];
        ViewRadius(button, 8);
        [button setTitleColor:RGBA(102, 102, 102,1) forState:0];
        button.titleLabel.font= kFONT(14);
        [self.startbtnArr addObject:button];
//        if (i==0) {
//            [button setTitleColor:kRGB(0, 160, 233) forState:0];
//            button.backgroundColor = kRGB(242, 251, 255);
//        }
        
    }
    _starView.height = h+30;
}
-(void)starthandleClick:(UIButton *)button{
    for (UIButton *btn in self.startbtnArr) {
        btn.backgroundColor = RGBA(250, 250, 250,1);
        [btn setTitleColor:RGBA(102, 102, 102,1) forState:0];

    }
    [button setTitleColor:[UIColor whiteColor] forState:0];
    [button setBackgroundColor:FMWZMainColor];

    self.starIndex = button.tag-200;
    

}
- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [[IQKeyboardManager sharedManager] setEnable:YES];
      [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    [[IQKeyboardManager sharedManager] setEnable:NO];


}

@end
