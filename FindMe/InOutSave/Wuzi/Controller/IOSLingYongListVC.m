//
//  IOSLingYongListVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSLingYongListVC.h"
#import "IOSInStoreListTBCell.h"
#import "IOSLingYongDetailVC.h"
#import "IOSYingYongAddVC.h"
#import "IOSLingYongListM.h"
@interface IOSLingYongListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSLingYongListVC

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
    [backButton setTitle:@"物资领用历史" forState:0];
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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self initialData];
}
-(void)initialData{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdMate/getList"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            
            self.dataSource = [IOSLingYongListM arrayOfModelsFromDictionaries:responseObject[@"data"] error:nil];
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
-(void)addItem{
    IOSYingYongAddVC *pushVC = [[IOSYingYongAddVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
#pragma mark ---代理事件----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSInStoreListTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSInStoreListTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSLingYongListM *listModel = self.dataSource[indexPath.row];
    cell.lingyongListM = listModel;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    IOSLingYongListM *listModel = self.dataSource[indexPath.row];

    IOSLingYongDetailVC *storeDetailVC = [[IOSLingYongDetailVC alloc] init];
    storeDetailVC.mateId = listModel.mateId;
    [self.navigationController pushViewController:storeDetailVC animated:YES];
}

@end
