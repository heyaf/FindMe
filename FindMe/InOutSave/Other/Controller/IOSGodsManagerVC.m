//
//  IOSGodsManagerVC.m
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "IOSGodsManagerVC.h"
#import "IOSTongJiHeaderView.h"
#import "IOSManagerGodsTBCell.h"
#import "IOSAddGodsVC.h"
#import "IOSGodsListM.h"
@interface IOSGodsManagerVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) IOSTongJiHeaderView *mainHview;
@property (nonatomic,strong) UIView *cellHeaderView;
@property (nonatomic,strong) NSMutableArray *headerButArr;

@property (nonatomic,strong) NSDictionary *dicData;

@property (nonatomic,assign) NSInteger selectIndex;
@end

@implementation IOSGodsManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    
    self.selectIndex = 0;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSManagerGodsTBCell" bundle:nil] forCellReuseIdentifier:@"IOSManagerGodsTBCell"];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getListDataWithkey:@""];

}
-(void)getListDataWithkey:(NSString *)keywords{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdGoods/getList"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    NSMutableDictionary *MutparamDic = [NSMutableDictionary
                                     dictionaryWithDictionary:paramDic];
    if (self.selectIndex>0) {
        NSInteger index = self.selectIndex ==1?2:1;
        [MutparamDic setValue:@(index) forKey:@"isRecycle"];
    }
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:MutparamDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSDictionary *datdic = responseObject[@"data"];
            self.dicData = datdic;
            self.dataSource = [IOSGodsListM arrayOfModelsFromDictionaries:datdic[@"list"] error:nil];
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


    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"IOSaddItem"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(IOSaddGods) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;

}

-(void)IOSaddGods{
    IOSAddGodsVC *pushVC = [[IOSAddGodsVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
#pragma mark ---代理事件----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSManagerGodsTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSManagerGodsTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSGodsListM *godsModel = self.dataSource[indexPath.row];
    cell.godsModel = godsModel;

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return 120;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44+100;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self creatHeaderView];
}
-(IOSTongJiHeaderView *)mainHview{
    if (!_mainHview) {
        _mainHview = [[IOSTongJiHeaderView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100)];
        _mainHview.titleArr= @[@"商品总数",@"商品总库存",@"库存成本",@"库存预警"];
        if (self.dicData.count>0) {
            NSString *stockSum =kStringFormat(@"%@",self.dicData[@"stockSum"]);
            NSString *sumStock =kStringFormat(@"%@",self.dicData[@"sumStock"]);
            NSString *priceSum =kStringFormat(@"%@",self.dicData[@"priceSum"]);
            NSString *warnSum =kStringFormat(@"%@",self.dicData[@"warnSum"]);

            _mainHview.titleNumArray = @[stockSum,sumStock,priceSum,warnSum];
        }else{
            _mainHview.titleNumArray = @[@"0",@"0",@"0",@"0"];
        }

        _mainHview.lastLabel.textColor = RGBA(247, 198, 71, 1);
        
    }
    return _mainHview;
}
-(UIView *)creatHeaderView{
    [self.mainHview removeFromSuperview];
    self.mainHview = nil;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100+44)];
    headerView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:self.cellHeaderView];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 100)];
    [headerView addSubview:bgView];
    [bgView addSubview:self.mainHview];
    
    
    return headerView;
    
}
-(UIView *)cellHeaderView{
    if (!_cellHeaderView) {
        _cellHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, KDeviceWith, 44)];
        _cellHeaderView.backgroundColor = RGBA(250, 250, 250, 1);
        [self addHeaderSubViews];
    }
    return _cellHeaderView;
}
-(void)addHeaderSubViews{
    NSArray *titleArr = @[@"全部",@"可回收",@"不可回收"];
    for (int i =0; i<titleArr.count; i++) {
        UIButton *but = [UIButton buttonWithType:0];
        but.frame = CGRectMake(KDeviceWith/3*i, 0, KDeviceWith/3, 44);
        [but setTitle:titleArr[i] forState:0];
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:RGBA(250, 250, 250, 1) size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
        but.titleLabel.font = kFONT(16);
        if (i==self.selectIndex) {
            [but setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
            [but setTitleColor:[UIColor blackColor] forState:0];
            but.titleLabel.font = FONT(18);
        }
        
        but.tag = 521+i;
        [but addTarget:self action:@selector(buttonClikced:) forControlEvents:UIControlEventTouchUpInside];
         
        [self.headerButArr addObject:but];
        [self.cellHeaderView addSubview:but];
        
    }
}
-(void)buttonClikced:(UIButton *)button{
    for (UIButton *but in self.headerButArr) {
        [but setTitleColor:IOSTitleColor forState:0];
        [but setBackgroundImage:[UIImage imageWithColor:RGBA(250, 250, 250, 1) size:CGSizeMake(KDeviceWith/3, 44)] forState:0];
        but.titleLabel.font = kFONT(16);
    }
    self.selectIndex = button.tag-521;
    [button setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    button.titleLabel.font = FONT(18);
    [self getListDataWithkey:@""];
}
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
}
@end
