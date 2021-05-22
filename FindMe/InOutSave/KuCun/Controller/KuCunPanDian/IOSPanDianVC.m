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
@interface IOSPanDianVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSPanDianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavbutton];
    [self CreatMainUI];
}
//主视图
-(void)CreatMainUI{
    

    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSPanDianHeaderTBCell" bundle:nil] forCellReuseIdentifier:@"IOSPanDianHeaderTBCell"];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSPanDianHisCell" bundle:nil] forCellReuseIdentifier:@"IOSPanDianHisCell"];
    [self setNavBackStr:@"出库单"];
    
    [self creatBottomView];

    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 140;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        IOSPanDianHeaderTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSPanDianHeaderTBCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    IOSPanDianHisCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSPanDianHisCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        IOSPanDianChoDetailVC *pushVC = [[IOSPanDianChoDetailVC alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
        
    }
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
-(void)pandianHistory{
    IOSPanDianHisVC *pushVC = [[IOSPanDianHisVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
-(void)makeSureBtnClicked{

}

@end
