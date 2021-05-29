//
//  IOSHuiShouAddVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSHuiShouAddVC.h"
#import "IOSHuiShouListTBCell.h"
#import "IOSHuiSHouAddDetailVC.h"
#import "IOSChoHuishouM.h"
@interface IOSHuiShouAddVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSHuiShouAddVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-100;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSHuiShouListTBCell" bundle:nil] forCellReuseIdentifier:@"IOSHuiShouListTBCell"];
    self.tabelView.backgroundColor = RGBA(245, 245, 245, 1);
    [self creatBottomView];
    [self setNavBackStr:@"新增"];
    [self initialData];
}
-(void)initialData{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdRecovery/recoveryGetList"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSArray *dateArr= responseObject[@"data"];
            self.dataSource = [IOSChoHuishouM arrayOfModelsFromDictionaries:dateArr error:nil];
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
//设置导航栏
-(void)setNavbutton{
    self.navigationItem.title = @"选择物品领用单";
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"addPhotoSet"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 35,35);

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;



}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ---代理事件----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSHuiShouListTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSHuiShouListTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSChoHuishouM *huishouModel = self.dataSource[indexPath.row];
    cell.huishouM = huishouModel;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSChoHuishouM *huishouModel = self.dataSource[indexPath.row];
    for (IOSChoHuishouM *huishouM in self.dataSource) {
        huishouM.isSelect = NO;
    }
    huishouModel.isSelect = YES;
    [tableView reloadData];
    
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
    [makeSureBtn setTitle:@"确认" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)makeSureBtnClicked{
    IOSChoHuishouM *huishouModel;
    for (IOSChoHuishouM *huishouM in self.dataSource) {
        if (huishouM.isSelect) {
            huishouModel = huishouM;
        }
    }
    if (!huishouModel) {
        [self showHint:@"请先选择物资领用单"];
        return;
    }
    
    IOSHuiSHouAddDetailVC *pushVC = [[IOSHuiSHouAddDetailVC alloc] init];
    pushVC.mateId = huishouModel.mateId;
    [self.navigationController pushViewController:pushVC animated:YES];
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

@end
