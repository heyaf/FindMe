//
//  IOSLingYongListM.h
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*            "getUserPhoto": "F://images/2.jpg",   // 领取人头像
 "mateName": "凌鸥",                   // 物资单名称
 "companyId": "7",                     // 公司ID
 "getTime": "2021-05-15 11:10:00",     // 申请领取时间
 "price": 15.5,                        // 领取物资总价格
 "num": 2,                             // 领取物资总数量
 "getUserName": "凌鸥",                // 领取人姓名
 "type": 1,                            // 可忽略
 "mateId": "M20210515103246518141"     // 物资单ID*/

/*                "id": "W20210512115252529244",        // 物资单表主键ID
 "mateName": 凌鸥,                     // 物资单名称
 "mateId": "M20210512115222099909",    // 物资单号
 "companyId": "7",                     // 公司ID
 "orderId": null,
 "goodsId": "KH20201204160558361866",  // 商品ID
 "goodsName": "圆珠笔",                // 商品名称
 "itemNo": null,
 "img": "/fandemi-image/20201204160047/2020127822.jpg", // 商品图片
 "stockNum": 6,                        // 商品库存数
 "outStockNum": 2,
 "inNum": null,
 "num": 2,                             // 商品领用数
 "receiveNum": null,
 "price": 1,                           // 商品价格
 "stockUserId": "91",                  // 库管ID
 "stockUserName": "童少供货",           // 库管姓名
 "getUserId": "293",                   // 领取人ID
 "getUserName": "凌鸥",                // 领取人姓名
 "handleUserId": null,
 "handleUserName": null,
 "outStockTime": null,
 "getTime": "2021-05-12 00:45:49",     // 领取时间
 "createId": "91",                     // 操作人ID
 "createTime": "2021-05-12 11:52:40",  // 创建时间
 "status": 1,  // 物资单状态 1:未生成采购单 3:备货完成 9:已确认(全部)收货
 "type": 1,                            // 1:库管申请出库 2:其他申请出库
 "isRecycle": 1,                       // 1:不可回收 2:可回收*/
@interface IOSLingYongListM : JSONModel
@property (nonatomic,strong) NSString *getUserPhoto,*mateName,*getTime,*getUserName,*mateId,*price,*img,*goodsName;
@property (nonatomic,assign) NSInteger num,stockNum,isRecycle;
@end

NS_ASSUME_NONNULL_END
