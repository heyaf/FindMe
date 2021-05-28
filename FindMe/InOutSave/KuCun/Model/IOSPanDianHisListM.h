//
//  IOSPanDianHisListM.h
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSPanDianHisListM : JSONModel
/*            {
 "checkUserPhoto": "/company/supplier/4b6.jpeg", // 盘点人头像
 "checkTime": "2021-05-21 18:04:28",             // 盘点时间
 "num": 0,                                       // 盈亏数量
 "checkUserId": "91",                            // 盘点人ID
 "checkUserName": "童少供货",                     // 盘点人姓名
 "checkName": "20210521盘点单",                  // 盘点单名称
 "checkId": "Check20210521180251518071",         // 盘点单号
 "sumpaid": -13.5                                // 盈亏金额
},*/

@property (nonatomic,strong) NSString *checkUserPhoto,*checkTime,*checkUserId,*checkUserName,*checkName,*checkId,*sumpaid;
@property (nonatomic,assign) NSInteger num;
@end

NS_ASSUME_NONNULL_END
