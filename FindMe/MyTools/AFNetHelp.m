//
//  AFNetHelp.m
//  GeneralShop
//
//  Created by 郑州聚义 on 17/2/24.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import "AFNetHelp.h"
#import "WifiCoontResultDequView.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import "SystemConfiguration/CaptiveNetwork.h"

@implementation AFNetHelp


-(WifiCoontResultDequView *)shareView {
    if (_shareView == nil) {
        self.shareView = [WifiCoontResultDequView createViewFromNib];
        [self.shareView showInWindow];
    }
    return _shareView;
}

- (AFHTTPSessionManager *)sessionManger {
    if (_sessionManger == nil) {
        self.sessionManger = [AFHTTPSessionManager manager];
        self.sessionManger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"multipart/form-data",nil];
//        if (KUser_token) {
//            [self.sessionManger.requestSerializer setValue:KUser_token forHTTPHeaderField:@"websiteAccessToken"];
//        }
    }
    return _sessionManger;
}
-(void)shettingRequstHeader {
    if (KUser_token) {
        [self.sessionManger.requestSerializer setValue:KUser_token forHTTPHeaderField:@"websiteAccessToken"];
    }

}

//单例
+ (AFNetHelp *)shareAFNetworking {
    static AFNetHelp *afnHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        afnHelper = [[AFNetHelp alloc] init];
    });
    return afnHelper;
}

///GET网络请求
- (void)getInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure {
    [self.sessionManger GET:urlStr parameters:bodyDic headers:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            sucess(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
//    [self.sessionManger GET:urlStr parameters:bodyDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//
//    }];
    
}

//post请求
- (void)postWuGongsiTypeInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure {
    NSMutableDictionary *parem = [NSMutableDictionary dictionaryWithDictionary:bodyDic];
    
    [self.sessionManger POST:urlStr parameters:parem headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//post请求
- (void)postInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure {
    NSMutableDictionary *parem = [NSMutableDictionary dictionaryWithDictionary:bodyDic];
    [parem setValue:KUser_ComType forKey:@"companyType"];
    
    NSString *posturl = urlStr;
    if ([urlStr containsString:@"/d/api/goods/showPGoodsTypeList"] ||
        [urlStr containsString:@"/d/api/goods/cloud/car/add"] ||
        [urlStr containsString:@"/d/api/goods/cloud/car/list"] ||
        [urlStr containsString:@"/d/api/goods/cloud/add"] ||
        [urlStr containsString:@"/d/api/goods/findCloudSupplier"] ||
        [urlStr containsString:@"/d/api/goods/findSupplier"] ||
        [urlStr containsString:@"/s/api/supplier/list"]||
        [urlStr containsString:@"/d/api/remind/list"]||
        [urlStr containsString:@"/d/api/goods/selectGoodsOne"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/basicsJL"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/songhuoList"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/plumberJDJL"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/plumberJDJSJ"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/zhucaiNo"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/plumberJSJSave"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/basicsJL"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/list"]||
        [urlStr containsString:@"/d/api/employee/selectlist"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/cailiaoShenHe"]||
        [urlStr containsString:@"/d/api/budget/series/selectBGHX"]||
        [urlStr containsString:@"/d/api/budget/series/createXDY"]||
        [urlStr containsString:@"/d/api/projectItems/selectProjectItemsParams"]||
        [urlStr containsString:@"/d/api/projectItems/updateOrderStatus"]||
        [urlStr containsString:@"/d/api/projectItems/overApply"]||
        [urlStr containsString:@"/d/api/projectItems/selectApplyParticipations"]||
        [urlStr containsString:@"/d/api/projectItems/selectParticipations"]||
        [urlStr containsString:@"/d/api/projectItems/launchContract"]||
        [urlStr containsString:@"/d/api/decorationShopping/localShoppingIndex"]||
        [urlStr containsString:@"/d/api/decorationShopping/goodsMore"]||
        [urlStr containsString:@"/d/api/decorationGoodsNew/getGoodsMessage"]||
        [urlStr containsString:@"/d/api/decorationShopping/getGoodsDetilsLocalAndCloudShoping"]||
        [urlStr containsString:@"/d/api/decorationShopping/findAttributeList"]||
        [urlStr containsString:@"/d/api/decorationShopping/findPropertiesPrice"]||
        [urlStr containsString:@"/d/api/decorationGoodsNew/decorationAndCustomerAddCar"]||
        [urlStr containsString:@"/d/api/projectItems/selectWorkUserTime"]||
        [urlStr containsString:@"/d/api/employee/searchForEmployees"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/selectBeiHuo"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/beihuo"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/saveCaiLiao"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/selectSonghuo"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/noReservation"]||
        [urlStr containsString:@"/d/api/budget/series/selectAddTempXM"]||
        [urlStr containsString:@"/d/api/budget/series/selectAddTempNeirong"]||
        [urlStr containsString:@"/d/api/budget/series/selectAddTemp"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/selectAnGYS"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/anzhuangOk"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/anzhanghongSQAN"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/selectSupxijie"]||
        [urlStr containsString:@"/d/api/mainprocess/dMainProcessAlbum/xijieSupOk"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/anzhanghongSQAN"]||
        [urlStr containsString:@"/d/api/dMainProcessNodeGoods/anzhuangOk"]||
        [urlStr containsString:@"/d/api/overMoney/closeGYSConfirePriceNew"]||
        [urlStr containsString:@"/d/api/overMoney/listCLSMXNew"]||
        [urlStr containsString:@"/d/api/overMoney/closeGYSJSSSHZCZYNew"]||
        [urlStr containsString:@"/d/api/overMoney/closeGYSRequest"]) {
        
        
        
    }else {
        posturl = AppProChange(urlStr);
    }
    
    [self.sessionManger POST:posturl parameters:parem headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

- (void)UpWordOnePOST:(NSString *)URLString
                    parameters:(id)parameters
             withType:(NSString *)type
            withgeshi:(NSString *)geshi
         withfileName:(NSString *)name constructingBodyWithdata:(NSData *)data
                       success:(void (^)(id responseObject))success
failure:(void (^)(NSError *error))failure {

    [self.sessionManger POST:URLString parameters:parameters headers:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        if ([type isEqualToString:@"4"]) {
            [formData appendPartWithFileData:data name:@"file" fileName:[NSString stringWithFormat:@"%@",name] mimeType:@"application/cad"];
        }else if ([type isEqualToString:@"5"]) {
            [formData appendPartWithFileData:data name:@"file" fileName:[NSString stringWithFormat:@"%@",name]  mimeType:@"application/vnd.ms-excel"];

        }else if ([type isEqualToString:@"6"]) {
            [formData appendPartWithFileData:data name:@"file" fileName:[NSString stringWithFormat:@"%@",name]  mimeType:@"application/msword"];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];

}

- (void)UpVideoOnePOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithdata:(NSData *)data
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure {

    [self.sessionManger POST:URLString parameters:parameters headers:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:@"iosvideo.mp4"  mimeType:@"video/mp4"];

    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];

}

- (void)UpOneImagePOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithDataArr:(UIImage *)image
                      dataimgname:(NSString *)name
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure{
    [self.sessionManger POST:URLString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSData *imgdata = UIImagePNGRepresentation(image);

            [formData appendPartWithFileData:imgdata name:name fileName:@"iosimg.png"  mimeType:@"image/png"];


    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];

}
- (void)UpImageArrPOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithDataArr:(NSArray *)dataarr
                      dataType:(NSString *)type
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure {
    [self.sessionManger POST:URLString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UIImage *image in dataarr) {
            NSData *imgdata = UIImagePNGRepresentation(image);

            if ([type isEqualToString:@"2"]) {
                [formData appendPartWithFileData:imgdata name:@"file" fileName:@"iosimg.png"  mimeType:@"image/png"];

            }else if ([type isEqualToString:@"3"]) {
                [formData appendPartWithFileData:imgdata name:@"file" fileName:@"iosvideo.mp4"  mimeType:@"video/mp4"];

            }

        }


    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];

}


-(UIImage *)getImage:(NSString *)videoURL{

    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:videoURL] options:nil];

    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];

    gen.appliesPreferredTrackTransform = YES;

    CMTime time = CMTimeMakeWithSeconds(0.0, 600);

    NSError *error = nil;

    CMTime actualTime;

    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];

    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];

    CGImageRelease(image);

    return thumb;
}

/// 获取指定时间的视频截图
/// @param videoUrl videoUrl description
/// @param timeBySecond
-(UIImage *)thumbnailImageRequestWithVideoUrl:(NSURL *)videoUrl andTime:(CGFloat)timeBySecond {
    if (videoUrl == nil) {
        return nil;
    }
    
    AVURLAsset *urlAsset = [AVURLAsset assetWithURL:videoUrl];
    
    //根据AVURLAsset创建AVAssetImageGenerator
    AVAssetImageGenerator *imageGenerator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    /*截图
     * requestTime:缩略图创建时间
     * actualTime:缩略图实际生成的时间
     */
    NSError *error = nil;
    CMTime requestTime = CMTimeMakeWithSeconds(timeBySecond, 10); //CMTime是表示电影时间信息的结构体，第一个参数表示是视频第几秒，第二个参数表示每秒帧数.(如果要活的某一秒的第几帧可以使用CMTimeMake方法)
    CMTime actualTime;
    CGImageRef cgImage = [imageGenerator copyCGImageAtTime:requestTime actualTime:&actualTime error:&error];
    if(error){
        NSLog(@"截取视频缩略图时发生错误，错误信息：%@", error.localizedDescription);
        return nil;
    }
    
    CMTimeShow(actualTime);
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    UIImage *finalImage = nil;
//    if (self.shootingOrientation == UIDeviceOrientationLandscapeRight)
//    {
//        finalImage = [self rotateImage:image withOrientation:UIImageOrientationDown];
//    }
//    else if (self.shootingOrientation == UIDeviceOrientationLandscapeLeft)
//    {
        finalImage = [self rotateImage:image withOrientation:UIImageOrientationUp];
//    }
//    else if (self.shootingOrientation == UIDeviceOrientationPortraitUpsideDown)
//    {
//        finalImage = [self rotateImage:image withOrientation:UIImageOrientationLeft];
//    }
//    else
//    {
//        finalImage = [self rotateImage:image withOrientation:UIImageOrientationRight];
//    }
    
    return finalImage;
}
/**
 *  图片旋转
 */
- (UIImage *)rotateImage:(UIImage *)image withOrientation:(UIImageOrientation)orientation {
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    return newPic;
}

//网络发生变化，告知服务器
-(void)appWifiChangePostSever {
    if (AowString(kUser_id).length==0) {
        return;
    }
    NSString *wifiname = [[AFNetHelp shareAFNetworking] getWifiInfoName];
    NSDictionary *dic = @{@"wifiName":AowString(wifiname),@"empId":kUser_id};
    NSString *url = [NSString stringWithFormat:@"%@/d/api/remind/wifiChange",AppServerURL];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:dic sucess:^(id responseObject) {
        MyLog(@"%@",responseObject);
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            
            if ([AowString(responseObject[@"data"]) isEqualToString:@"3"]) {
                //1:不用操作  ; 3:开始轮训查询提醒状态,开始计时
                self.wifiTimer = [NSTimer timerWithTimeInterval:16 target:self selector:@selector(postUserWifiTimeData) userInfo:nil repeats:YES];
                [[NSRunLoop currentRunLoop] addTimer:self.wifiTimer forMode:NSRunLoopCommonModes];

            }
            
        }

    } failure:^(NSError *error) {
    }];
}

//轮训请求此接口，获取用户是否提醒的状态
-(void)postUserWifiTimeData {
    if (AowString(kUser_id).length==0) {
        return;
    }
    NSDictionary *dic = @{@"empId":kUser_id};
    NSString *url = [NSString stringWithFormat:@"%@/d/api/remind/getRemindStatue",AppServerURL];
    __weak typeof(self) weakSelf = self;
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:dic sucess:^(id responseObject) {
        MyLog(@"%@",responseObject);
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
            
            if ([AowString(responseObject[@"data"]) isEqualToString:@"2"]) {
                [weakSelf.wifiTimer invalidate];
                weakSelf.wifiTimer = nil;
            
                //0:进入公司区域1：用户离开 2：15分钟已到（弹框让用户选择是否）；3:用户选择回来4:用户已回来5：申请外勤 6：不同意 7：同意
                [weakSelf.shareView setHuilaiblock:^{
                      //回来
                    [weakSelf postUserGoBackConntWifi:@"3"];
                    weakSelf.shareView = nil;
                }];
                [weakSelf.shareView setWaiqinblock:^{
                   //外勤
                    [weakSelf postUserGoBackConntWifi:@"4"];
                    weakSelf.shareView = nil;
                }];
                [weakSelf.shareView setXiabanblock:^{
                   //下班
                    [weakSelf postUserGoBackConntWifi:@"8"];
                    weakSelf.shareView = nil;
                }];
            }
            
        }

    } failure:^(NSError *error) {
    }];
}

//选择wifi中断结果
-(void)postUserGoBackConntWifi:(NSString *)chooseType {
    if (AowString(kUser_id).length==0) {
        return;
    }
    NSDictionary *dic = @{@"empId":kUser_id,@"chooseType":chooseType};
    NSString *url = [NSString stringWithFormat:@"%@/d/api/remind/empChoose",AppServerURL];
    [[AFNetHelp shareAFNetworking] postInfoFromSeverWithStr:url body:dic sucess:^(id responseObject) {
        MyLog(@"%@",responseObject);
        if ([AowString(responseObject[@"code"]) isEqualToString:@"1"]) {
                        
        }
        [JRToast showWithText:responseObject[@"msg"]];

    } failure:^(NSError *error) {
    }];
}


//获取wifi名字
-(NSString *)getWifiInfoName {
    id info = nil;
    NSString *wifiName = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        wifiName = info[@"SSID"];
//        NSString *str2 = info[@"BSSID"];
//        NSString *str3 = [[ NSString alloc] initWithData:info[@"SSIDDATA"] encoding:NSUTF8StringEncoding];
        MyLog(@"wifiName：%@",wifiName);
//        MyLog(@"BSSID：%@",str2);
//        MyLog(@"SSIDDATA：%@",str3);
    }
  
    return wifiName;
}

@end
