//
//  IOSTongJiYingKuiVC.m
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "IOSTongJiYingKuiVC.h"
#import "IOSTongjiYingKuiTBCell.h"
#import "IOSTongjiMainHView.h"
#import "IOSTongji2M.h"
@interface IOSTongJiYingKuiVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *cellSelectArr;
@property (nonatomic,strong) IOSTongjiMainHView *mainHview;
@end

@implementation IOSTongJiYingKuiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSTongjiYingKuiTBCell" bundle:nil] forCellReuseIdentifier:@"IOSTongjiYingKuiTBCell"];
//    self.tabelView.backgroundColor = RGBA(245, 245, 245, 1);
    [self initialDataWithStartTime:[NSString getNowData] endTime:[NSString getNowData]];
}
-(void)initialDataWithStartTime:(NSString *)startStr endTime:(NSString *)endStr{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdPurch/getDetail"];
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"type":@(4),
                               @"startTime":startStr,
                               @"endTime":endStr
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            
            NSDictionary *dic = responseObject[@"data"];
            self.dataSource = [IOSTongji2M arrayOfModelsFromDictionaries:dic[@"list"] error:nil];
            [self.tabelView reloadData];
            
            self.mainHview.titleNumArray = @[kStringFormat(@"%@",dic[@"count"]),kStringFormat(@"%@",dic[@"sum"]),kStringFormat(@"%@",dic[@"sumPrice"])];

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
    [backButton setTitle:@"盈亏明细" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"IOSsearch"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(IOSSearch) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;

}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)IOSSearch{
    
}
#pragma mark ---代理事件----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSTongjiYingKuiTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSTongjiYingKuiTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([self.cellSelectArr containsObject:@(indexPath.row)]) {
        cell.bottomBgView.hidden = NO;
        cell.arrowImageView.image = ImageNamed(@"IOSshangArrow");
    }else{
        cell.bottomBgView.hidden = YES;
        cell.arrowImageView.image = ImageNamed(@"IOSxiaArrow");
    }
    IOSTongji2M *tongjiM = self.dataSource[indexPath.row];
    cell.tongji2M = tongjiM;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.cellSelectArr containsObject:@(indexPath.row)]) {
        return 190;
    }
    return 110;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.cellSelectArr containsObject:@(indexPath.row)]) {
        [self.cellSelectArr removeObject:@(indexPath.row)];
    }else{
        [self.cellSelectArr addObject:@(indexPath.row)];
    }

    [UIView performWithoutAnimation:^{

        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44+100+40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.mainHview;
}
-(IOSTongjiMainHView *)mainHview{
    if (!_mainHview) {
        _mainHview = [[IOSTongjiMainHView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 44+100)];
        _mainHview.titleArr= @[@"盘点数",@"库存数",@"盈亏数量",@"采购金额（元）"];
        _mainHview.titleNumArray = @[@"0",@"0",@"0",@"0.00"];
        kWeakSelf(self);
        _mainHview.btnClickedBlock = ^(NSString * _Nonnull startTime) {
            [weakself initialDataWithStartTime:startTime endTime:[NSString getNowData]];
        };    }
    return _mainHview;
}
-(NSMutableArray *)cellSelectArr{
    if (!_cellSelectArr) {
        _cellSelectArr = [NSMutableArray array];
    }
    return _cellSelectArr;
}

@end
