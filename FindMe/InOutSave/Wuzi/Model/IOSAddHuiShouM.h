//
//  IOSAddHuiShouM.h
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSAddHuiShouM : JSONModel
/*            {
 "id": null,
 "mateName": "凌鸥",                                  // 物资单名称
 "mateId": "M20210513193925201410",                   // 物资单号
 "companyId": "7",                                    // 公司ID
 "companyType": "2",                                  // 公司类型  2供应商
 "orderId": null,
 "goodsId": "KH20210513191220066382",                 // 商品ID
 "goodsName": "圆珠笔",                                // 商品名称
 "itemNo": null,
 "img": "/fandemi-image/20201204160047/20201222.jpg", // 商品图片
 "stockNum": 16,                                      // 商品库存数量
 "outStockNum": 2,
 "inNum": 0,
 "num": 2,                                            // 物资单商品数量
 "receiveNum": null,
 "price": 1,                                          // 商品价格
 "stockUserId": "91",                                 // 库管ID
 "stockUserName": "童少供货",                          // 库管名称
 "getUserId": "293",                                  // 领取人ID
 "getUserName": "凌鸥",                               // 领取人名称
 "handleUserId": "293",                               // 操作员ID
 "handleUserName": "凌鸥",                            // 操作员名称
 "outStockTime": "2021-05-13 19:41:17",               // 出库时间
 "getTime": "2021-05-13 20:10:00",                    // 领取时间
 "createId": "91",
 "createTime": "2021-05-13 19:39:26",
 "updateId": "293",
 "updateTime": "2021-05-13 19:41:17",
 "status": 9,
 "type": 1
},*/

@property (nonatomic,strong) NSString *getUserPhoto,*mateName,*getTime,*getUserName,*mateId,*price,*img,*goodsName,*goodsId;
@property (nonatomic,assign) BOOL isSelect;
@property (nonatomic,assign) NSInteger num,stockNum,isRecycle,outStockNum,selectCount;
@end

NS_ASSUME_NONNULL_END
