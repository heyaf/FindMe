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
//#import <YYKit/YYKit.h>
#import "FMProfitManagerVC.h"
#import "testViewController.h"
static NSString *KAppid = @"20210302000712958";
static NSString *KSercKey = @"OEcXq1U5G9U8xP3OqcA6";
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
    [IOSBtn3 setTitle:@"利润管理" forState:0];
    [IOSBtn3 setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn3 addTarget:self action:@selector(houseMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn3];
    
    
    
    
}

-(void)InOutSave{
    
    
    testViewController *pushVC = [[testViewController alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
    
//    NSString *salt = @"1221321312",
//             *appid = KAppid,
//             *key = KSercKey,
//             *fromLang = @"zh",
//             *toLang = @"en",
//             *mac = @"mac",
//             *cuid = @"APICUID";
//    UIImage *image = [UIImage imageNamed:@"EMWLFooterView.png"];
//
//    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(image, 1)];
//    NSString *imageMD5 = [imageData md5String];  // 这里用的YY的哈希方法，可以自己实现
//    //d03d864b7f43db9ce34df5f720509d0e
//    NSString *beforeSign = [NSString stringWithFormat:@"%@%@%@%@%@%@", appid, imageMD5, salt, cuid, mac, key];
//    
//    NSString *sign = [beforeSign md5String];
//    //20210302000712958d03d864b7f43db9ce34df5f720509d0e3APICUIDmacOEcXq1U5G9U8xP3OqcA6
//    //23ea298200379ce3f81c5030ba950316
//    AFHTTPSessionManager *httpSessionManager = [AFHTTPSessionManager manager];
//    
//    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
//    [requestSerializer setValue:@"mutipart/form-data" forHTTPHeaderField:@"Content-Type"];
//    
//    AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
//    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"application/json", @"text/html", @"text/json", nil];
//    
//    httpSessionManager.requestSerializer = requestSerializer;
//    httpSessionManager.responseSerializer = responseSerializer;
//    
//    NSString *url = @"https://fanyi-api.baidu.com/api/trans/sdk/picture";
//    NSDictionary *dic = @{
//        @"from"  : fromLang,
//        @"to"    : toLang,
//        @"appid" : appid,
//        @"salt" : salt,
//        @"cuid" : cuid,
//        @"mac"  : mac,
//        @"sign" : sign,
//        @"erase":@(1)
//    };
//    
//    NSURLSessionDataTask *task = [httpSessionManager POST:url
//                  parameters:dic headers:@{}
//   constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        [formData appendPartWithFileData:imageData
//                                    name:@"image"
//                                fileName:@"1.jpg"
//                                mimeType:@"image/png"];   // fileName、mimeType 我这里写死了，最好根据图片类型传
//    }
//                    progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"[ing]， %@", uploadProgress);
//    }
//                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"[成功]， %@", responseObject);
//    }
//                     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"[失败]， %@", error);
//    }];
//    
//    [task resume];
    
//        IOSEnterHomeVC *pushVC = [[IOSEnterHomeVC alloc] init];
//        [self.navigationController pushViewController:pushVC animated:YES];
  


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
    FMProfitManagerVC *pushVC = [[FMProfitManagerVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
@end
