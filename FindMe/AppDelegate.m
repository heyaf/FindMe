//
//  AppDelegate.m
//  BatDog
//
//  Created by 郑州聚义 on 2018/11/7.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarViewController.h"
#import "HomeViewController.h"
#import "MyBaseViewController.h"
//#import <AMapFoundationKit/AMapFoundationKit.h>
//#import "MyTabBarViewController.h"
//#import "EmployLoginViewController.h"
//#import "AppDelegate+Hyphenate.h"
////极光
//#import "JPUSHService.h"
//#ifdef NSFoundationVersionNumber_iOS_9_x_Max
//#import <UserNotifications/UserNotifications.h>
//#endif
//#import <EBBannerView.h>
//#import "HomeMainJinDuViewController.h"
//#import "HomeYeWuYuYueInfoInputViewController.h"
//#import "HomeSheJiYuQingInputViewController.h"
//#import "HomeDingjinHeTongWebViewController.h"
//#import "HomeHeTongOptionsProduteViewController.h"
//#import "HomeHeTongOptionslistViewController.h"
//#import "HomeSheJiYiciYuYueInputViewController.h"
//#import "HomeCanyurenListViewController.h"
//#import "KaiGongZhunbeiViewController.h"
//#import "HomeJiDayTimeInpuViewController.h"
//#import "HomeFenbaoXieyiWebViewController.h"
//#import "XingxiangWuziSonghuoViewController.h"
//#import "BeginWorkYuJianAddViewController.h"
//#import "KaigongyishiViewController.h"
//#import "XingxiangBaohuViewController.h"
//#import "HomeShenhheHeTongWebViewController.h"
//#import "XiangxiangwuziDanViewController.h"
//#import "WuyeshouxuViewController.h"
//#import "YezhuJiesuanDetailViewController.h"
//#import "YezhulastJiesuanDetailViewController.h"
//#import "ShishuiYuJianAddViewController.h"
//#import "TuzhihuishenViewController.h"
//#import "ChaichuXianchangFangxianViewController.h"
//#import "ChaiChuGongZuoViewController.h"
//#import "TujianFangxianViewController.h"
//#import "ShuidianJiaodiViewController.h"
//#import "ShuidianFangxianViewController.h"
//#import "DaYaJiluViewController.h"
//#import "XiangxiangwuziTuiDanViewController.h"
//#import "YouQiCaiLiaoTuiDanViewController.h"
//#import "FangShuiBishuiShiyanViewController.h"
//#import "NigongZhiZuoViewController.h"
//#import "JiedianWuMobanYanshouViewController.h"
//#import "JunGongYanshouViewController.h"
//#import "YouQiGongCailiaoDanViewController.h"
//#import "WuziSonghuoSupplierListViewController.h"
//#import "XiangxiangwuziYanshouViewController.h"
#import "IOSHomeViewController.h"
static NSString *DID_ENTER_BACKGROUND = @"CustomNotificationApplicationDidEnterBackground";
static NSString *DID_BECOME_ACTIVE = @"CustomNotificationApplicationDidBecomeActive";
static NSString *DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE = @"CustomNotificationDidReceiveLocalNotificationInActive";
static NSString *DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE = @"CustomNotificationDidReceiveLocalNotificationStateActive";
static NSString *DID_FINISH_LAUNCHING_WITH_OPTIONS = @"CustomNotificationDidFinishLaunchingWithOptions";

@interface AppDelegate ()

@end

@implementation AppDelegate

+(NSString *)CUSTOM_NOTIFICATION_DID_ENTER_BACKGROUND{
    return DID_ENTER_BACKGROUND;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_BECOME_ACTIVE{
    return DID_BECOME_ACTIVE;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE{
    return DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_FINISH_LAUNCHING_WITH_OPTIONS{
    return DID_FINISH_LAUNCHING_WITH_OPTIONS;
}

+(NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE{
    return DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NSUserDefaults standardUserDefaults] setObject:@"372"  forKey:User_id_key];
    [[NSUserDefaults standardUserDefaults] setObject: @"41" forKey:User_Companyid_key];

    ////职位ID
    [[NSUserDefaults standardUserDefaults] setObject: @"1" forKey:@"zhiwuId"];
    [[NSUserDefaults standardUserDefaults] setObject: @"1" forKey:@"userPic"];
    [[NSUserDefaults standardUserDefaults] setObject: @"1" forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject: @"1"  forKey:@"userBackgroundPicture"];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[IOSHomeViewController alloc]init] ];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return  YES;
    

    
}

@end
