//
//  AFNetHelp.h
//  GeneralShop
//
//  Created by 郑州聚义 on 17/2/24.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFNetHelp : NSObject
@property (nonatomic, strong) AFHTTPSessionManager *sessionManger;

+ (AFNetHelp *)shareAFNetworking;

-(void)shettingRequstHeader;

///GET网络请求
- (void)getInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure ;

///post请求
- (void)postInfoFromSeverWithStr:(NSString *)urlStr body:(NSDictionary *)bodyDic sucess:(void(^)(id))sucess failure:(void(^)(NSError *))failure;



- (void)UpImagePOST:(NSString *)URLString  withsourcetype:(NSInteger )type
                    parameters:(id)parameters
constructingBodyWithdata:(NSData *)data
                      jindu:(void (^)(NSProgress *))uploadProgress
                       success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;

- (void)UpImageArrPOST:(NSString *)URLString
                    parameters:(id)parameters
constructingBodyWithDataArr:(NSArray *)dataarr
                      jindu:(void (^)(NSProgress *))uploadProgress
                       success:(void (^)(id responseObject))success
               failure:(void (^)(NSError *error))failure;

@end
