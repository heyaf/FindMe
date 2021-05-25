//
//  IOSGodspinpaiM.h
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*
 "id": "39944108f73f4041a854b4bffdca447d",    // 进销存使用的码表ID
 "companyId": "15",                           // 公司ID
 "name": "个",                                // 名称
 "status": 3,                                 // 1:品牌 3:单位
 "createTime": "2021-05-06 18:17:45",         // 创建时间
 "sort": 0,                                   // 忽略
 "img": null,                                 // 忽略
 "empId": null                                // 忽略
 */
@interface IOSGodspinpaiM : JSONModel
@property (nonatomic,strong) NSString *companyId,*name,*createTime,*pinpaiId;
@property (nonatomic,assign) NSInteger status;

@end

NS_ASSUME_NONNULL_END
