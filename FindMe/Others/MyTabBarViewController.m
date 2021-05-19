//
//  MyTabBarViewController.m
//  LedRoad
//
//  Created by 郑州聚义 on 16/8/18.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "AppDelegate.h"

@interface MyTabBarViewController () <UITabBarControllerDelegate, UIAlertViewDelegate>
@property (nonatomic, assign)  NSInteger taskCount;

@end

@implementation MyTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.tabBar.tintColor = KAppColor;
//    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KEVNScreenTabBarHeight)];
//    backView.backgroundColor = [UIColor whiteColor];
//    [self.tabBar insertSubview:backView atIndex:0];
//    self.tabBar.opaque = YES;
    
    UITabBarItem *item0 = [self.tabBar.items objectAtIndex:0];
    [item0 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont systemFontOfSize:12], NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,
                                   nil] forState:UIControlStateNormal];
    [item0 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                             [UIFont systemFontOfSize:12], NSFontAttributeName,KAppColor,NSForegroundColorAttributeName,
                                             nil] forState:UIControlStateSelected];
    item0.tag = 0;
    
     UITabBarItem *item1 = [self.tabBar.items objectAtIndex:1];
    [item1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont systemFontOfSize:12], NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,
                                   nil] forState:UIControlStateNormal];
    [item1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIFont systemFontOfSize:12], NSFontAttributeName,KAppColor,NSForegroundColorAttributeName,
                                   nil] forState:UIControlStateSelected];
     item1.tag = 1;
    
    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:2];
    [item2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont systemFontOfSize:12], NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,
                                   nil] forState:UIControlStateNormal];
    [item2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont systemFontOfSize:12], NSFontAttributeName,KAppColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
     item2.tag = 2;

    
    UITabBarItem *item3 = [self.tabBar.items objectAtIndex:3];
    [item3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont systemFontOfSize:12], NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName,
                                   nil] forState:UIControlStateNormal];
    [item3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont systemFontOfSize:12], NSFontAttributeName,KAppColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    item3.tag = 3;

//    //请求版本号，判断是否有新版本
//    [self postIFADfromTheSever];

}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
  
    return YES;
}

//请求版本号，判断是否有新版本
-(void)postIFADfromTheSever {
    //    //请求本地推送数据
//       [[Router sharedManager] postDataLoactionPushAction];
//    NSString *url = [NSString stringWithFormat:@"%@/userAppApi/updateApp",AppServerURL];
//    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:nil sucess:^(id responseObject) {
//        MyLog(@"%@",responseObject);
//        if ([responseObject[@"code"] isEqualToString:@"1"]) {
//            NSDictionary *dataDic = responseObject[@"data"];
//            NSString *ios = dataDic[@"ios"];
//            [self showToAppAtoryDownload:ios];
//        }
//
//    } failure:^(NSError *error) {
//        [self showHint:@"稍后重试"];
//    }];
}

//有新版本，去下载
-(void)showToAppAtoryDownload:(NSString *)appStoreVersion {
    // app版本
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appCurrentVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
      //    if (![app_Version isEqualToString:version]) {
    if ([appCurrentVersion compare:appStoreVersion options:NSNumericSearch] == NSOrderedAscending) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"有新版本，快更新吧" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        NSURL *url = [[ NSURL alloc ] initWithString: @"itms-apps://itunes.apple.com/cn/app/id1434804894"];
        [[UIApplication sharedApplication] openURL:url];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
