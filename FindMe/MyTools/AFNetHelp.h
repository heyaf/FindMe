//
//  AFNetHelp.h
//  GeneralShop
//
//  Created by 郑州聚义 on 17/2/24.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class WifiCoontResultDequView;
@interface AFNetHelp : NSObject
@property (nonatomic, strong) AFHTTPSessionManager *sessionManger;

@property (nonatomic, strong) NSTimer *wifiTimer;

@property (nonatomic, strong) WifiCoontResultDequView *shareView;


+ (AFNetHelp *)shareAFNetworking;


-(void)shettingRequstHeader;

///GET网络请求
- (void)getInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure ;

///post请求
- (void)postInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure;

- (void)postWuGongsiTypeInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure;

- (void)UpWordOnePOST:(NSString *)URLString
                    parameters:(id)parameters
             withType:(NSString *)type
            withgeshi:(NSString *)geshi
         withfileName:(NSString *)name
constructingBodyWithdata:(NSData *)data
              success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure ;

- (void)UpVideoOnePOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithdata:(NSData *)data
                       success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

- (void)UpImageArrPOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithDataArr:(NSArray *)dataarr
                      dataType:(NSString *)type
                       success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;
- (void)UpOneImagePOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithDataArr:(UIImage *)image
                      dataimgname:(NSString *)name
                       success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

/// 截取网络视频第一帧图片
-(UIImage *)getImage:(NSString *)videoURL;
/// 截取视频
/// @param videoUrl 视频url
/// @param timeBySecond 时间
-(UIImage *)thumbnailImageRequestWithVideoUrl:(NSURL *)videoUrl andTime:(CGFloat)timeBySecond;

//获取wifi名字
-(NSString *)getWifiInfoName;

//网络发生变化，告知服务器
-(void)appWifiChangePostSever;

@end
