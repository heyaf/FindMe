//
//  IOSCaiGouChooseVC.m
//  BatDog
//
//  Created by mac on 2021/5/18.
//  Copyright © 2021 郑州聚义. All rights reserved.
//

#import "IOSCaiGouChooseVC.h"
#import "UIView+Frame.h"
#import "IOSCaiGouChooseTBCell.h"
#import "IOSCaiGouChooM.h"
@interface IOSCaiGouChooseVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSArray *NameArr;
@property (nonatomic,strong) NSArray *holderArr;
@property (nonatomic,strong) NSMutableArray *choosedArr; //选择商品的数组
@end

@implementation IOSCaiGouChooseVC
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(NSMutableArray *)choosedArr{
    if (!_choosedArr) {
        _choosedArr = [NSMutableArray array];
    }
    return _choosedArr;
}
//-(NSArray *)NameArr{
//    if (!_NameArr) {
//        _NameArr = [NSArray array];
//    }
//    return _NameArr;
//}
//-(NSArray *)holderArr{
//    if (!_holderArr) {
//        _holderArr = [NSArray array];
//    }
//    return _holderArr;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavbutton];
    [self initialData];

    [self CreatMainUI];
}
-(void)initialData{
    self.NameArr =@[@"采购人",@"采购时间",@"采购商品"];
    self.holderArr = @[@"请选择采购人员",@"请选择采购时间",@"请选择采购商品"];
    for (int i=0; i<self.NameArr.count; i++) {
        IOSCaiGouChooM *chooseM = [[IOSCaiGouChooM alloc] init];
        chooseM.name = self.NameArr[i];
        chooseM.holderStr = self.holderArr[i];
        
        [self.dataArr addObject:chooseM];
        
    }
    
}
//主视图
-(void)CreatMainUI{
    
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-80;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self creatBottomView];
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSCaiGouChooseTBCell" bundle:nil] forCellReuseIdentifier:@"IOSCaiGouChooseTBCell"];
    
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-80-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 80+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:bottomView];
    
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(KDeviceWith-30-120, 10, 120, 60);
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bottomView addSubview:makeSureBtn];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:makeSureBtn.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    makeSureBtn.layer.mask = shapeLayer;
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, KDeviceWith-120-30-30, 20)];
    priceLabel.text = @"共0件商品，共计0.00元";
    [bottomView addSubview:priceLabel];

}
#pragma mark ---delegate----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.choosedArr.count>0) {
        return 2;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return self.NameArr.count;
    }
    return self.choosedArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return 100;
    }
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        IOSCaiGouChooseTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSCaiGouChooseTBCell"];
        IOSCaiGouChooM *caigouModel = self.dataArr[indexPath.row];
        cell.CaigouChooseModel = caigouModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
        
    }
    UITableViewCell *cell;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1) {
        return;
    }
    switch (indexPath.row) {
        case 0: {
            [self postallBumeninfoDataFromSever];
        }
        case 1:{
            
        }
        case 2:{
            
        }
            
            break;
            
        default:
            break;
    }
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"采购" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"baiopan"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(goCaigouHistory) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

#pragma mark ---点击事件----
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

//请求所有的部门信息
- (void)postallBumeninfoDataFromSever {
    [self showHudInView:self.view hint:@"加载数据"];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: User_Companyid,@"companyId",@"0",@"parentId",KUser_ComType,@"type",nil];
    NSString *url = [NSString stringWithFormat:@"%@/d/api/department/list",AppServerURL];
    NSMutableArray *bumenarr = [NSMutableArray array];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:params sucess:^(id responseObject) {
        
        MyLog(@"%@", responseObject);
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
                
                NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
                IOSCaiGouChooM *caigouModel = self.dataArr[0];
                caigouModel.ChooseStr = @"工作人员";
                    [self.dataArr replaceObjectAtIndex:indexPath.row withObject:caigouModel];
                    [self.tabelView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];


        } else {
            [self showHint:responseObject[@"msg"]];
            
        }
        [self hideHud];
        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
}
//采购历史
-(void)goCaigouHistory{
    MyLog(@"采购历史");
}
@end
