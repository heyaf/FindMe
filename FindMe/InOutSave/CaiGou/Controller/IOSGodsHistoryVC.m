//
//  IOSGodsHistoryVC.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSGodsHistoryVC.h"
#import "IOSGodsHisDetailVC.h"
#import "IOSGodsHisTBCell.h"
#import "IOSGodsHisModel.h"
@interface IOSGodsHistoryVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation IOSGodsHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getListData];
}
-(void)getListData{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdPurch/getList"];
    NSDictionary *paramDic = @{@"empId":kUser_id
                               
    };
    NSMutableDictionary *MutparamDic = [NSMutableDictionary
                                     dictionaryWithDictionary:paramDic];
    if (self.type>0) {
        [MutparamDic setValue:@(self.type) forKey:@"type"];
    }

    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:MutparamDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSDictionary *datdic = responseObject[@"data"];
            self.dataSource = [IOSGodsHisModel arrayOfModelsFromDictionaries:datdic[@"list"] error:nil];
            [self.tableView reloadData];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.dataSource removeAllObjects];
            [self.tableView reloadData];

            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];

    
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-50) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"IOSGodsHisTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsHisTBCell"];
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGBA(250, 250, 250, 1);
//        //刷新
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _tableView;
}
- (void)loadNewData {

}
//加载更多
- (void)loadMoreData {
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSGodsHisTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsHisTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSGodsHisModel *model= self.dataSource[indexPath.row];
    cell.hisModel = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSGodsHisDetailVC *pushVC = [[IOSGodsHisDetailVC alloc] init];
    IOSGodsHisModel *model= self.dataSource[indexPath.row];
    pushVC.purchId = model.purchId;
    pushVC.type = model.type;
    [self.navigationController pushViewController:pushVC animated:YES];
}

 
@end
