//
//  IOSPanDianHisVC.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianHisVC.h"
#import "IOSInStoreListTBCell.h"
#import "IOSPanDianHisDetailVC.h"
#import "IOSPanDianHisListM.h"
@interface IOSPanDianHisVC ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation IOSPanDianHisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSInStoreListTBCell" bundle:nil] forCellReuseIdentifier:@"IOSInStoreListTBCell"];
    self.tabelView.backgroundColor = RGBA(250, 250, 250, 1);
    [self initialData];
}
-(void)initialData{
    //盘点单首页
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCheck/getList"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            
  
            self.dataSource = [IOSPanDianHisListM arrayOfModelsFromDictionaries:responseObject[@"data"][@"list"] error:nil];
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
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"盘点历史" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

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
    IOSInStoreListTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSInStoreListTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSPanDianHisListM *listModel = self.dataSource[indexPath.row];
    cell.hisListM = listModel;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSPanDianHisDetailVC *pushVC = [[IOSPanDianHisDetailVC alloc] init];
    IOSPanDianHisListM *listModel = self.dataSource[indexPath.row];
    pushVC.checkId = listModel.checkId;
    [self.navigationController pushViewController:pushVC animated:YES];
}

@end
