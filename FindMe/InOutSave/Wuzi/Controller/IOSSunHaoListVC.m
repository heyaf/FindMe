//
//  IOSSunHaoListVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSSunHaoListVC.h"
#import "IOSInStoreListTBCell.h"
#import "IOSSunHaoDetailVC.h"
#import "IOSHuiShouAddVC.h"
#import "IOSSunhaoListModel.h"
@interface IOSSunHaoListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSSunHaoListVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavbutton];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSInStoreListTBCell" bundle:nil] forCellReuseIdentifier:@"IOSInStoreListTBCell"];
    self.tabelView.backgroundColor = RGBA(245, 245, 245, 1);
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"物资损耗" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"IOSaddItem"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(addItem) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;

}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)addItem{
    IOSHuiShouAddVC *pushVC = [[IOSHuiShouAddVC alloc] init];
    pushVC.type = 1;
    [self.navigationController pushViewController:pushVC animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initialData];
}
-(void)initialData{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdLoss/getList"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            
            self.dataSource = [IOSSunhaoListModel arrayOfModelsFromDictionaries:responseObject[@"data"] error:nil];
            [self.tabelView reloadData];
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

#pragma mark ---代理事件----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSInStoreListTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSInStoreListTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSSunhaoListModel *huishouM = self.dataSource[indexPath.row];
    cell.sunhaoM = huishouM;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    IOSSunhaoListModel *huishouM = self.dataSource[indexPath.row];

//    IOSHuiShouDetailVC *storeDetailVC = [[IOSHuiShouDetailVC alloc] init];
//    IOSHuishouListM *huishouM = [self manageChooseDate][indexPath.row];
//
//    storeDetailVC.type = huishouM.type ;
//    storeDetailVC.recoveryId = huishouM.recoveryId;
//    [self.navigationController pushViewController:storeDetailVC animated:YES];
    IOSSunHaoDetailVC *pushVC = [[IOSSunHaoDetailVC alloc] init];
    pushVC.lossId = huishouM.lossId;
    [self.navigationController pushViewController:pushVC animated:YES];
}



@end
