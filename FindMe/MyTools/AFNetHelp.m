//
//  AFNetHelp.m
//  GeneralShop
//
//  Created by 郑州聚义 on 17/2/24.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import "AFNetHelp.h"

@implementation AFNetHelp

- (AFHTTPSessionManager *)sessionManger {
    if (_sessionManger == nil) {
        self.sessionManger = [AFHTTPSessionManager manager];
        self.sessionManger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",nil];
if (KUser_token) {
    [self.sessionManger.requestSerializer setValue:KUser_token forHTTPHeaderField:@"app_accessToken"];
}

    }
    return _sessionManger;
}

-(void)shettingRequstHeader {
    if (KUser_token) {
            [self.sessionManger.requestSerializer setValue:KUser_token forHTTPHeaderField:@"app_accessToken"];
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
    [self.sessionManger GET:urlStr parameters:bodyDic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucess(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];
    
}

//post请求
- (void)postInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure {
    NSLog(@"用户token:%@",KUser_token);
     [self.sessionManger POST:urlStr parameters:bodyDic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         if ([AowString(responseObject[@"code"])  isEqualToString:@"501"] ){
//             [MJGET_APP_DELEGATE exitSign];
         }
        sucess(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];
}




- (void)UpImagePOST:(NSString *)URLString withsourcetype:(NSInteger )type
                    parameters:(id)parameters
constructingBodyWithdata:(NSData *)data
                      jindu:(void (^)(NSProgress *))uploadProgress
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure
{
    [self.sessionManger POST:URLString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        double currentTime =  [[NSDate date] timeIntervalSince1970];

        if (type==1) {
            NSString *strTime = [NSString stringWithFormat:@"%.0fios.png",currentTime];
            [formData appendPartWithFileData:data name:@"img" fileName:strTime  mimeType:@"image/png"];

        }else {
            NSString *strTime = [NSString stringWithFormat:@"%.0fiosvideo.mp4",currentTime];

            [formData appendPartWithFileData:data name:@"img" fileName:strTime  mimeType:@"video/mp4"];
        }

    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];

}


- (void)UpImageArrPOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithDataArr:(NSArray *)dataarr
                      jindu:(void (^)(NSProgress *))uploadProgress
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure
{
    [self.sessionManger POST:URLString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSData *data in dataarr) {
//            double currentTime =  [[NSDate date] timeIntervalSince1970];
//            NSString *strTime = [NSString stringWithFormat:@"%.0fios.png",currentTime];

            [formData appendPartWithFileData:data name:@"img" fileName:@"ios.png"  mimeType:@"image/png"];

        }


    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);

    }];

}

@end
