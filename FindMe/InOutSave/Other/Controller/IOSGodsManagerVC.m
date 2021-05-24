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
@interface IOSGodsManagerVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) IOSTongJiHeaderView *mainHview;
@property (nonatomic,strong) UIView *cellHeaderView;
@property (nonatomic,strong) NSMutableArray *headerButArr;

@end

@implementation IOSGodsManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavbutton];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSManagerGodsTBCell" bundle:nil] forCellReuseIdentifier:@"IOSManagerGodsTBCell"];
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
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSManagerGodsTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSManagerGodsTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

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
        _mainHview.titleNumArray = @[@"50",@"3",@"12333",@"45"];
        _mainHview.lastLabel.textColor = RGBA(247, 198, 71, 1);
        
    }
    return _mainHview;
}
-(UIView *)creatHeaderView{
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
        if (i==0) {
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
    [button setBackgroundImage:ImageNamed(@"ioscaigouHeaderBG") forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    button.titleLabel.font = FONT(18);
}
-(NSMutableArray *)headerButArr{
    if (!_headerButArr) {
        _headerButArr = [NSMutableArray array];
    }
    return _headerButArr;
}
@end
