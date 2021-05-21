//
//  IOSPanDianHisVC.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianHisVC.h"
#import "IOSInStoreListTBCell.h"

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
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSInStoreListTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSInStoreListTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}


@end
