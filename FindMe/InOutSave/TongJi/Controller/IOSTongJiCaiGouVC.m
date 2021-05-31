//
//  IOSTongJiCaiGouVC.m
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "IOSTongJiCaiGouVC.h"
#import "IOSTongjiListTBCell.h"
#import "IOSTongjiMainHView.h"
#import "IOSTongji0M.h"
@interface IOSTongJiCaiGouVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *cellSelectArr;
@property (nonatomic,strong) IOSTongjiMainHView *mainHview;
@end

@implementation IOSTongJiCaiGouVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSTongjiListTBCell" bundle:nil] forCellReuseIdentifier:@"IOSTongjiListTBCell"];
//    self.tabelView.backgroundColor = RGBA(245, 245, 245, 1);
    [self initialDataWithStartTime:[NSString getNowData] endTime:[NSString getNowData]];
}
-(void)initialDataWithStartTime:(NSString *)startStr endTime:(NSString *)endStr{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdPurch/getDetail"];
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"type":@(1),
                               @"startTime":startStr,
                               @"endTime":endStr
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            
            NSDictionary *dic = responseObject[@"data"];
            self.dataSource = [IOSTongji0M arrayOfModelsFromDictionaries:dic[@"list"] error:nil];
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
    [backButton setTitle:@"采购明细" forState:0];
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
    IOSTongjiListTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSTongjiListTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([self.cellSelectArr containsObject:@(indexPath.row)]) {
        cell.bottomBgView.hidden = NO;
        cell.arrowImageView.image = ImageNamed(@"IOSshangArrow");
    }else{
        cell.bottomBgView.hidden = YES;
        cell.arrowImageView.image = ImageNamed(@"IOSxiaArrow");
    }
    IOSTongji0M *tongjiM = self.dataSource[indexPath.row];
    cell.tongji0M = tongjiM;
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
        _mainHview.titleArr= @[@"采购笔数",@"采购单品数",@"采购金额（元）"];
        _mainHview.titleNumArray = @[@"0",@"0",@"0"];
        _mainHview.titleStr = @"采购明细";
        kWeakSelf(self);
        _mainHview.btnClickedBlock = ^(NSString * _Nonnull startTime) {
            [weakself initialDataWithStartTime:startTime endTime:[NSString getNowData]];
        };
    }
    return _mainHview;
}
-(NSMutableArray *)cellSelectArr{
    if (!_cellSelectArr) {
        _cellSelectArr = [NSMutableArray array];
    }
    return _cellSelectArr;
}

@end
