//
//  IOSGodsChoosePinPaiVC.m
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import "IOSGodsChoosePinPaiVC.h"
#import "IOSGodspinpaiM.h"
#import "IOSGodsPinPaiTBCell.h"
#import "IOSGodsEditPinPaiChoVC.h"
#import "IOSGodsPinPaiEditVC.h"
@interface IOSGodsChoosePinPaiVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSGodsChoosePinPaiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.status==1) {
        self.navigationItem.title = @"选择品牌";
    }else{
        self.navigationItem.title = @"选择单位";
    }
    self.view.backgroundColor = RGBA(250, 250, 250, 1);
    [self creatMainUI];
    [self setNavbutton];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getListData];

}
-(void)getListData{
    NSString *url = [AppServerURL stringByAppendingString:@"/s/api/sdCode/list"];
    NSDictionary *paramDic = @{@"empId":kUser_id,
                               @"status":@(self.status)
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSArray *dataarr = responseObject[@"data"];
            self.dataSource = [IOSGodspinpaiM arrayOfModelsFromDictionaries:dataarr error:nil];
            [self.tabelView reloadData];
        }else {
            [self showHint:responseObject[@"msg"]];
            [self.tabelView reloadData];

            
        }
        [self hideHud];

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];

    
}
-(void)creatMainUI{
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tabelView.backgroundColor = RGBA(250, 250, 250, 1);
    [self.tabelView registerNib:[UINib nibWithNibName:@"IOSGodsPinPaiTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsPinPaiTBCell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSGodsPinPaiTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsPinPaiTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSGodspinpaiM *pinModel = self.dataSource[indexPath.row];
    cell.nameLabel.text = pinModel.name;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSGodspinpaiM *pinModel = self.dataSource[indexPath.row];
    if (self.chooseBlock) {
        self.chooseBlock(pinModel.name);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"IOSBackChaHao"] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"IOSEditIcon"] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 35,35);
    [rightBtn addTarget:self action:@selector(EditItem) forControlEvents:UIControlEventTouchUpInside];
    UIButton* rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn1 setImage:[UIImage imageNamed:@"IOSaddItem"] forState:UIControlStateNormal];
    rightBtn1.frame = CGRectMake(0, 0, 35,35);
    [rightBtn1 addTarget:self action:@selector(addItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem*saveBitem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];

    UIBarButtonItem*shareBitem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn1];

    UIBarButtonItem*spaceBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];

    spaceBar.width=5;//间隔作用

    self.navigationItem.rightBarButtonItems=@[shareBitem,spaceBar,saveBitem];

}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)EditItem{
    IOSGodsEditPinPaiChoVC *pushVC = [[IOSGodsEditPinPaiChoVC alloc] init];
    pushVC.status = self.status;
    [self.navigationController pushViewController:pushVC animated:NO];
}
-(void)addItem{
    IOSGodsPinPaiEditVC *pushVC = [[IOSGodsPinPaiEditVC alloc] init];
    pushVC.status = self.status;
    pushVC.type = 1;
    [self.navigationController pushViewController:pushVC animated:YES];
}


@end
