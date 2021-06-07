//
//  FMHouseMessVC.m
//  FindMe
//
//  Created by mac on 2021/6/3.
//

#import "FMHouseMessVC.h"
#import "YewuLiangfangleverTableViewCell.h"
#import "FMHouseMesCM.h"
#import "FMHouseMesCell.h"
#import "FMHouseMesChooseTBCell.h"
@interface FMHouseMessVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *allItemArr;
@end

@implementation FMHouseMessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tabelView.estimatedRowHeight = 213;
    self.tabelView.rowHeight = UITableViewAutomaticDimension;
    [self.tabelView registerNib:[UINib  nibWithNibName:@"YewuLiangfangleverTableViewCell" bundle:nil] forCellReuseIdentifier:@"YewuLiangfangleverTableViewCell"];
    [self.tabelView registerNib:[UINib  nibWithNibName:@"FMHouseMesCell" bundle:nil] forCellReuseIdentifier:@"FMHouseMesCell"];
    [self.tabelView registerNib:[UINib  nibWithNibName:@"FMHouseMesChooseTBCell" bundle:nil] forCellReuseIdentifier:@"FMHouseMesChooseTBCell"];
}
-(void)initData{
//    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dJiaodiTemplate/selectAllTemp"];
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dJiaodiTemplate/selectAllTempCengji"];
    NSDictionary *paramDic = @{
                               @"companyId":@"41"
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSArray *arr = responseObject[@"data"];
            NSArray *dataArr = [FMHouseMesCM arrayOfModelsFromDictionaries:arr error:nil];
            for (FMHouseMesCM *houseM in dataArr) {
                NSArray *dataArr1 = [FMHouseMesCM arrayOfModelsFromDictionaries:houseM.lowerLevelData error:nil];
                houseM.lowerLevelData = dataArr1;
                NSMutableArray *cellArr =[NSMutableArray arrayWithCapacity:0];
                [cellArr addObject:dataArr1];
                houseM.cellArr = cellArr;
//                NSLog(@"----%li",houseM.cellArr.count);
                
            }
            self.dataSource = [NSMutableArray arrayWithArray:dataArr];
            [self.tabelView reloadData];
            for (FMHouseMesCM *houseM in self.dataSource) {
//                NSLog(@"122----%li",houseM.cellArr.count);

            }

//            NSLog(@"------%@",dataArr);
            
        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
    
//    NSString *url2 = [AppServerURL stringByAppendingString:@"/d/api/dJiaodiTemplate/selectAllTemp"];
//
//    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url2 body:paramDic sucess:^(id responseObject) {
//
//        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
//            NSArray *arr = responseObject[@"data"];
//            self.allItemArr = [FMHouseMesCM arrayOfModelsFromDictionaries:arr error:nil];
//
//
//        }else {
//            [self showHint:responseObject[@"msg"]];
//
//        }
//
//    } failure:^(NSError *error) {
//
//
//    }];
}
-(void)creatDataWithMessageID:(NSString *)messageId indexPath:(NSIndexPath*) indexpath{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dJiaodiTemplate/selectAllTemp"];
    NSDictionary *paramDic = @{
                               @"companyId":@"41",
                               @"pid":messageId,
                               @"type":@"2"
    };
    [self showHudInView:self.view hint:@"加载中"];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];

        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSArray *arr = responseObject[@"data"];
            FMHouseMesCM *mesmodel = self.dataSource[indexpath.section];
            NSMutableArray *mutCellArr = [NSMutableArray arrayWithArray:mesmodel.cellArr];
            NSArray *dataArr = [FMHouseMesCM arrayOfModelsFromDictionaries:arr error:nil];
            [mutCellArr addObject:dataArr];
//            for (FMHouseMesCM *houseM in dataArr) {
//                NSArray *dataArr1 = [FMHouseMesCM arrayOfModelsFromDictionaries:houseM.lowerLevelData error:nil];
//                houseM.lowerLevelData = dataArr1;
//                NSMutableArray *cellArr =[NSMutableArray arrayWithCapacity:0];
//                [cellArr addObject:dataArr1];
//                houseM.cellArr = cellArr;
////                NSLog(@"----%li",houseM.cellArr.count);
//
//            }
            
            mesmodel.cellArr = mutCellArr;
//            self.dataSource = [NSMutableArray arrayWithArray:dataArr];
            [self.tabelView reloadData];
           
            
        }else {
            [self showHint:responseObject[@"msg"]];
            
        }
        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
//-(void)managerDataWithmesID:(NSString *)messageID{
//
//}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FMHouseMesCM *cellModel = self.dataSource[section];
    NSLog(@".....%lu",(unsigned long)cellModel.cellArr.count);
    return cellModel.cellArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FMHouseMesCM *model = self.dataSource[indexPath.section];
//    if (model.pid ==0) {
//        FMHouseMesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FMHouseMesCell"];
//        cell.selectionStyle= UITableViewCellSelectionStyleNone;
//        cell.titleLabel.text = model.name;
//        if (indexPath.row==0) {
//            cell.topView.hidden = YES;
//        }
//        return cell;
//    }
    FMHouseMesChooseTBCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FMHouseMesChooseTBCell class])
                                                                  owner:self
                                                                options:nil] objectAtIndex:0];
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    [cell creatsubViewswithArr:model.cellArr[indexPath.row] type:[model.selectType integerValue] titleName:model.name];
    kWeakSelf(self);
    cell.clickedBlock = ^(NSString * _Nonnull mesId) {
//        [weakself creatDataWithMessageID:mesId indexPath:indexPath];
    };
//    NSArray *titleArr = @[@"123323",@"jhsadjasdsa",@"wwwdsssdsd",@"sdsdsdfsdfdsfsdf"];
//    [cell creatChooseBtnArr:titleArr isSingleChoose:YES];
    return cell;

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FMHouseMesCM *model = self.dataSource[section];

    FMHouseMesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FMHouseMesCell"];
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    cell.titleLabel.text = model.name;
    if (section==0) {
        cell.topView.hidden = YES;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}











//-(void)initialFirstData{
//    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
//    for (FMHouseMesCM *houseM in self.allItemArr) {
//        if (houseM.pid ==0) {
//            [mutArr addObject:houseM];
//        }
//    }
//    NSMutableArray *mutArr1 = [NSMutableArray arrayWithCapacity:0];
//
//    for (FMHouseMesCM *houseM1 in mutArr) {
//        for (FMHouseMesCM *houseM in self.allItemArr) {
//
//            if (houseM.pid ==[houseM1.houseMessId integerValue]) {
//                [mutArr1 addObject:houseM];
//            }
//        }
//
//    }
//    [mutArr1 addObjectsFromArray:mutArr];
//    self.dataSource = [NSMutableArray arrayWithArray:[self sortArr:mutArr1]];
//    [self setModelLeavelArrWithArr:self.dataSource];
//
//}
/////根据id大小进行排序
//-(NSArray *)sortArr:(NSArray *)sortArr{
//
//    NSMutableArray *mutSortArr = [NSMutableArray arrayWithArray:sortArr];
//    for (int i =0; i<mutSortArr.count-1; i++) {
//        for (int j=i+1; j<mutSortArr.count; j++) {
//            FMHouseMesCM *model = mutSortArr[i];
//            FMHouseMesCM *model1 = mutSortArr[j];
//
//            if ([model.houseMessId  integerValue]>[model1.houseMessId integerValue]) {
//                NSDictionary *dic = mutSortArr[i];
//                mutSortArr[i] = mutSortArr[j];
//                mutSortArr[j] = dic;
//            }
//        }
//    }
//    return mutSortArr;
//
//}
//-(void)setModelLeavelArrWithArr:(NSMutableArray *)arr{
//    for (FMHouseMesCM *houseM1 in arr) {
//        NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
//
//        for (FMHouseMesCM *houseM in self.allItemArr) {
//
//            if (houseM.pid ==[houseM1.houseMessId integerValue]) {
//                [mutArr addObject:houseM];
//                [arr removeObject:houseM];
//            }
//        }
//        houseM1.lowerLevelData = mutArr;
//
//    }
//}
@end
