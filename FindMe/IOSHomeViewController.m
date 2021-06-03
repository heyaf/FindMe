//
//  IOSHomeViewController.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSHomeViewController.h"
#import "IOSEnterHomeVC.h"
#import "IOSMessageAlertView.h"
#import "FMZWWishListVC.h"
#import "UIView+HYDiffRadius.h"
#import "FMZPShowWishVC.h"
#import "FMWishFinshView.h"
#import "FMWWishListM.h"
#import "FMHouseMessVC.h"
@interface IOSHomeViewController ()
@property (nonatomic,strong) CYCustomArcImageView *btnTwoBgView;
@property (nonatomic,strong) UIView *tesyView;
@end

@implementation IOSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = RGBA(235, 177, 42, 1);
    
    UIButton *IOSBtn = [UIButton buttonWithType:0];
    IOSBtn.frame = CGRectMake(100, 150, 100, 50);
    IOSBtn.backgroundColor = [UIColor yellowColor];
    [IOSBtn setTitle:@"进销存" forState:0];
    [IOSBtn setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn addTarget:self action:@selector(InOutSave) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn];
    
    UIButton *IOSBtn1 = [UIButton buttonWithType:0];
    IOSBtn1.frame = CGRectMake(100, 250, 100, 50);
    IOSBtn1.backgroundColor = [UIColor yellowColor];
    [IOSBtn1 setTitle:@"心愿单" forState:0];
    [IOSBtn1 setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn1 addTarget:self action:@selector(wishList) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn1];
    

    UIButton *IOSBtn2 = [UIButton buttonWithType:0];
    IOSBtn2.frame = CGRectMake(100, 350, 100, 30);
    IOSBtn2.backgroundColor = [UIColor yellowColor];
    [IOSBtn2 setTitle:@"心愿单弹窗" forState:0];
    [IOSBtn2 setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn2 addTarget:self action:@selector(wishTanchuang) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn2];
    
    UIButton *IOSBtn3 = [UIButton buttonWithType:0];
    IOSBtn3.frame = CGRectMake(100, 430, 100, 30);
    IOSBtn3.backgroundColor = [UIColor yellowColor];
    [IOSBtn3 setTitle:@"房屋信息" forState:0];
    [IOSBtn3 setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn3 addTarget:self action:@selector(houseMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn3];
    
}

-(void)InOutSave{
    
        IOSEnterHomeVC *pushVC = [[IOSEnterHomeVC alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
  


}
-(void)wishList{
    FMZWWishListVC *pushVC = [[FMZWWishListVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}

-(void)wishTanchuang{
    
    [self getWishListData];
}
-(void)getWishListData{
    NSString *url = [AppServerURL stringByAppendingString:@"/d/api/dWishOrder/selectWorkWish"];
    NSDictionary *paramDic = @{@"empId":kUser_id
    };
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:paramDic sucess:^(id responseObject) {
        [self hideHud];
        
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
            for (NSDictionary *dic in responseObject[@"data"]) {
                if ([dic[@"data"] isKindOfClass:[NSDictionary class]]) {
                    FMWWishListM *wishM = [[FMWWishListM alloc] initWithDictionary:dic[@"data"] error:nil];
                    wishM.name = dic[@"name"];

                    [mutArr addObject:wishM];
                }

            }
            FMWishFinshView *wishView = [[FMWishFinshView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceWith) DataDic:mutArr];
            [wishView show];
        }else {
           
            
        }

        
    } failure:^(NSError *error) {
        [self showHint:@"稍后重试"];
        [self hideHud];
        
    }];
}
-(void)houseMessage{
    FMHouseMessVC *pushVC = [[FMHouseMessVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
@end
