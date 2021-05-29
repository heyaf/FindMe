//
//  IOSPanDianHisDetailVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSPanDianHisDetailVC.h"
#import "IOSPandianHisDetailTBCell.h"
#import "IOSCaiGouHeaderTBCell.h"
#import "IOSPandianShouM.h"
@interface IOSPanDianHisDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *headerButArr;
@property (nonatomic,strong) UIView *cellHeaderView;

@property (nonatomic,strong) NSDictionary *dataDic;
@property (nonatomic,assign) NSInteger seletedIndex; //选中的buttonindex

@end

@implementation IOSPanDianHisDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.seletedIndex = 0;
    [self initialData];
    [self CreatMainUI];
}
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
}

-(void)initialData{
    //盘点单首页
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCheck/list"];
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"checkId":self.checkId
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            self.dataDic =responseObject[@"data"];
            
            self.dataSource = [IOSPandianShouM arrayOfModelsFromDictionaries:responseObject[@"data"][@"list"] error:nil];
            NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:self.dataDic];
            
            [mutDic setValue:@([self managernum]) forKey:@"totalNum"];
            self.dataDic = mutDic;
            [self.tabelView reloadData];
            [self creatBottomView];
//            [self ChargePrice];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.dataSource removeAllObjects];
            [self.tabelView reloadData];
            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
}
//主视图
-(void)CreatMainUI{
    
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSPandianHisDetailTBCell" bundle:nil] forCellReuseIdentifier:@"IOSPandianHisDetailTBCell"];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSCaiGouHeaderTBCell" bundle:nil] forCellReuseIdentifier:@"IOSCaiGouHeaderTBCell"];
    [self setNavBackStr:@"盘点单"];
//

    
}
-(void)creatBottomView{

    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:bottomView];
    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(20, 0, KDeviceWith-40, 60)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    bgView.backgroundColor = IOSCancleBtnColor;
    [bottomView addSubview:bgView];
    


    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-150-30-30, 20)];
    [bgView addSubview:priceLabel];
    NSString *priceStr =kStringFormat(@"盈亏合计%li",[self managernum1]);
    NSString *numStr = kStringFormat(@"%li",[self managernum1]);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr.length)];

    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(4, numStr.length)];
    priceLabel.attributedText = attriStr;
    
    UILabel *label2 = [bgView createLabelFrame:CGRectMake(bgView.yz_width-155, 20, 145, 20) textColor:IOSMainColor font:kFONT(16)];
    NSString *priceStr1 =kStringFormat(@"￥%@",[self managerPrice]);
    NSMutableAttributedString *attriStr1 = [[NSMutableAttributedString alloc] initWithString:priceStr1];
    [attriStr1 addAttributes: @{NSFontAttributeName :kBOLDFONT(18),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, priceStr1.length)];

    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(priceStr1.length-3, 3)];
    [attriStr1 addAttributes: @{NSFontAttributeName :kFONT(12),NSForegroundColorAttributeName:IOSMainColor,} range:NSMakeRange(0, 1)];
    label2.attributedText = attriStr1;
    label2.textAlignment = NSTextAlignmentRight;
    

}
-(void)makeSureBtnClicked{

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return [self manageChooseDate].count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 140;
    }
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        IOSCaiGouHeaderTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSCaiGouHeaderTBCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setpandianHisHeadView:self.dataDic];
        return cell;
    }
    IOSPandianHisDetailTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSPandianHisDetailTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSPandianShouM *pandianM = [self manageChooseDate][indexPath.row];
    cell.listHisModel = pandianM;
    return cell;
}
-(NSArray *)manageChooseDate{
    if (self.seletedIndex==0) {
        return self.dataSource;
    }
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
        for (IOSPandianShouM *listModel in self.dataSource) {
            if (listModel.isRecycle!=self.seletedIndex) {
                [mutArr addObject:listModel];
            }
        }
        return mutArr;
    
}
-(NSInteger)managernum{
    NSInteger count = 0;
    for (IOSPandianShouM *listModel in self.dataSource) {
            count+=listModel.checkNum;
    }
    return count;
}

-(NSInteger)managernum1{
    NSInteger count = 0;
    for (IOSPandianShouM *listModel in self.dataSource) {
            count+=listModel.num;
    }
    return count;
}
-(NSString *)managerPrice{
    CGFloat count = 0.00;
    for (IOSPandianShouM *listModel in self.dataSource) {
            count+=[listModel.sumpaid floatValue];
    }
    return kStringFormat(@"%.2f",count);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0.001)];
        return view;
    }
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 44)];
    [headView addSubview:self.cellHeaderView];
    return headView;
}

-(UIView *)cellHeaderView{
    if (!_cellHeaderView) {
        _cellHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 44)];
        _cellHeaderView.backgroundColor = RGBA(245, 245, 245, 245);
        [self addHeaderSubViews];
    }
    return _cellHeaderView;
}
-(void)addHeaderSubViews{
    NSArray *titleArr = @[@"全部",@"可回收",@"不可回收"];
    for (int i =0; i<titleArr.count; i++) {
        UIButton *but = [UIButton buttonWithType:0];
        but.frame = CGRectMake(KDeviceWith/3*i, 0, KDeviceWith/3, 44);
        [but setTitle:titleArr[i] forState:0];
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
        but.titleLabel.font = kFONT(16);
        if (i==0) {
            [but setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
            [but setTitleColor:[UIColor blackColor] forState:0];
            but.titleLabel.font = FONT(18);
        }
        
        but.tag = 521+i;
        [but addTarget:self action:@selector(buttonClikced:) forControlEvents:UIControlEventTouchUpInside];
         
        [self.headerButArr addObject:but];
        [self.cellHeaderView addSubview:but];
        
    }
}
-(void)buttonClikced:(UIButton *)button{
    for (UIButton *but in self.headerButArr) {
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
        but.titleLabel.font = kFONT(16);
    }
    [button setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    button.titleLabel.font = FONT(18);
    self.seletedIndex = button.tag-521;
    [self.tabelView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
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
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
