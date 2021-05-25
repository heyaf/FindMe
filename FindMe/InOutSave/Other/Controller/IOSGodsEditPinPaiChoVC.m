//
//  IOSGodsEditPinPaiChoVC.m
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import "IOSGodsEditPinPaiChoVC.h"
#import "IOSGodspinpaiM.h"
#import "IOSGodsPinPaiTBCell.h"
#import "IOSGodsPinPaiEditVC.h"
@interface IOSGodsEditPinPaiChoVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSGodsEditPinPaiChoVC


- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.status==1) {
        self.navigationItem.title = @"选择品牌";
    }else{
        self.navigationItem.title = @"选择单位";
    }
    self.view.backgroundColor = RGBA(250, 250, 250, 1);
    [self creatMainUI];
    [self getListData];
    [self setNavbutton];
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
    return 60;
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
    IOSGodsPinPaiEditVC *pushVC = [[IOSGodsPinPaiEditVC alloc] init];
    pushVC.pinpaiModel = pinModel;
    pushVC.status = self.status;
    pushVC.type = 2;
    [self.navigationController pushViewController:pushVC animated:YES];

}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"IOSBackChaHao"] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;

    

}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
