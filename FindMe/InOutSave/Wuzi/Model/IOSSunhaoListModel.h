//
//  IOSSunhaoListModel.h
//  FindMe
//
//  Created by mac on 2021/5/29.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSSunhaoListModel : JSONModel
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


/*            "mateId": "M20210515103246518141",       // 物资单号
 "mateName": "凌鸥",                      // 物资单名称
 "lossId": "L20210515133525187090",       // 物资损耗单号
 "lossName": "20210515物资损耗单",         // 物资损耗单名称
 "lossTime": "2021-05-15 13:35:26",       // 损耗单时间
 "goodsName": "圆珠笔,笔记本,",            // 损耗单物资名称
 "getUserId": "293",                      // 领取人ID
 "getUserName": "凌鸥",                   // 领取人姓名
 "getUserPhoto": "F://images/2.jpg",      // 领取人头像
 "num": "2",                              // 领物资种类数
 "price": "31.00"                         // 领物总价格*/
@property (nonatomic,strong) NSString *getUserPhoto,*mateName,*getTime,*getUserName,*mateId,*price,*img,*goodsName,*goodsId,*lossName,*lossId,*lossTime;
@property (nonatomic,assign) BOOL isSelect;
@property (nonatomic,assign) NSInteger num,stockNum,isRecycle,outStockNum,type;
@end

NS_ASSUME_NONNULL_END
