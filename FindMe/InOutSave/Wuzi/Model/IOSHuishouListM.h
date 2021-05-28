//
//  IOSHuishouListM.h
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*            "getUserPhoto": "F://images/2.jpg",    // 领取人头像
 "companyId": "7",                      // 公司ID
 "mateName": "凌鸥",                    // 领用的物资单名称
 "getTime": "2021-05-22 11:30:00",      // 领用时间
 "price": 15.5,                         // 物资回收总金额
 "num": 2,                              // 物资回收总类别数
 "getUserName": "凌鸥",                 // 领取人姓名
 "recoveryId": "R20210522090106878375", // 回收单号
 "type": 1,                             // 1:待回收 2:已回收
 "mateId": "M20210521192226824982",     // 领用的物资单号
 "getUserId": "293",                    // 领取人ID
 "recoveryName": "20210522物资回收单"    // 回收单名称*/
@interface IOSHuishouListM : JSONModel
@property (nonatomic,strong) NSString *getUserPhoto,*mateName,*getTime,*getUserName,*mateId,*price,*img,*goodsName,*goodsId,*recoveryName,*recoveryId;
@property (nonatomic,assign) BOOL isSelect;
@property (nonatomic,assign) NSInteger num,stockNum,isRecycle,outStockNum,type;
@end

NS_ASSUME_NONNULL_END
