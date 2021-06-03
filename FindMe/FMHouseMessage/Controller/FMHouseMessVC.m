//
//  FMHouseMessVC.m
//  FindMe
//
//  Created by mac on 2021/6/3.
//

#import "FMHouseMessVC.h"
#import "YewuLiangfangleverTableViewCell.h"
#import "FMHouseMesCM.h"
@interface FMHouseMessVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FMHouseMessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tabelView registerNib:[UINib  nibWithNibName:@"YewuLiangfangleverTableViewCell" bundle:nil] forCellReuseIdentifier:@"YewuLiangfangleverTableViewCell"];
}
-(void)initData{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dJiaodiTemplate/selectAllTemp"];

    NSDictionary *paramDic = @{@"pid":@"0",
                               @"types":@"2",
                               @"companyId":@"41"
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSArray *arr = responseObject[@"code"];
            NSArray *arr1 = [FMHouseMesCM arrayOfModelsFromDictionaries:arr error:nil];
            

        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YewuLiangfangleverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YewuLiangfangleverTableViewCell"];
    return cell;
}

@end
