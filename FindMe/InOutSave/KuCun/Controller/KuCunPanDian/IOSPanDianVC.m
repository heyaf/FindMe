//
//  IOSPanDianVC.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianVC.h"
#import "IOSPanDianHisVC.h"
#import "IOSPanDianHeaderTBCell.h"
#import "IOSPanDianHisCell.h"
#import "IOSPanDianChoDetailVC.h"
#import "IOSPadianShowModel.h"
@interface IOSPanDianVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) NSInteger sum;

@property (nonatomic,strong) UILabel *priceLabel;

@end

@implementation IOSPanDianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavbutton];
    [self CreatMainUI];
    
    [self initialData];
}

-(void)initialData{
    //盘点单首页
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCheck/main"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            self.sum = [responseObject[@"data"][@"sum"] integerValue];
            self.dataSource = [IOSPadianShowModel arrayOfModelsFromDictionaries:responseObject[@"data"][@"list"] error:nil];
            [self.tabelView reloadData];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.dataSource removeAllObjects];
            [self.tabelView reloadData];

            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
}
//-(void)initialData1WithCheckId:(NSString *)checkId{
//    //盘点单首页
//    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCheck/list"];
//    NSDictionary *paramDic = @{@"empId":kUser_id,
//                               @"checkId":checkId
//    };
//    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
//        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
//            self.DataDic= responseObject[@"data"];
//
//            [self.tabelView reloadData];
//        }else {
//            [self showHint:responseObject[@"msg"]];
//            [self.dataSource removeAllObjects];
//            [self.tabelView reloadData];
//
//
//        }
//        [self hideHud];
//
//
//    } failure:^(NSError *error) {
//        [self showHint:@"稍后重试"];
//        [self hideHud];
//
//    }];
//
//}
//主视图
-(void)CreatMainUI{
    

    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSPanDianHeaderTBCell" bundle:nil] forCellReuseIdentifier:@"IOSPanDianHeaderTBCell"];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSPanDianHisCell" bundle:nil] forCellReuseIdentifier:@"IOSPanDianHisCell"];
    [self setNavBackStr:@"盘点单"];
    
    [self creatBottomView];

    
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 150;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        IOSPanDianHeaderTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSPanDianHeaderTBCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.godsNumLabel.text = kStringFormat(@"查看未选择商品(%li)",self.sum);
        if (self.dataSource.count>0) {
            [cell.startButton setTitle:@"继续盘点" forState:0];
        }else{
            [cell.startButton setTitle:@"开始盘点" forState:0];

        }
        return cell;
    }
    IOSPanDianHisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSPanDianHisCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSPadianShowModel *pandinaModel = self.dataSource[indexPath.row];
    cell.pandianshouModel = pandinaModel;

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        IOSPanDianChoDetailVC *pushVC = [[IOSPanDianChoDetailVC alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        
    }
}
-(void)ChargePrice{
    NSInteger count =0;
    CGFloat Price = 0.00;
    for (IOSPadianShowModel *caigouModel in self.dataSource) {
        Price+=caigouModel.num;
    }
    NSString *priceStr =kStringFormat(@"本单合计 %li 件商品",count);
    NSString *countStr = kStringFormat(@"%li",count);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(6, countStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
   
    self.priceLabel.attributedText = attriStr;

}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"盘点单" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"baiopan"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(pandianHistory) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bottomView];
    
    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(KDeviceWith-30-120, 10, 120, 50)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 25;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, 120, 50);
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];

    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-120-30-30, 20)];
    self.priceLabel = priceLabel;
    [bottomView addSubview:priceLabel];
    NSString *priceStr =kStringFormat(@"本单合计 0 件商品");
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:priceStr];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, priceStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kBOLDFONT(16),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(5, 1)];
   
    self.priceLabel.attributedText = attriStr;
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pandianHistory{
    IOSPanDianHisVC *pushVC = [[IOSPanDianHisVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
-(void)makeSureBtnClicked{

}

@end
