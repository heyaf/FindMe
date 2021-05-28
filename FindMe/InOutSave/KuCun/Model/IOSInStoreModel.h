//
//  IOSInStoreModel.h
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*            "stockUserPhoto": "/company/supplier/10_.jpeg",
 "companyId": "7",
 "createTime": "2021-05-21 16:37:38",
 "stockUserName": "童少供货",
 "price": 31,
 "num": 2,
 "purchId": "C20210521143307",
 "inStockId": "I20210521163737031393",
 "inStockName": "20210521入库单"*/

/*                "id": "I20210512100252693852",            // 入库表ID
 "purchId": "C20210511182028",             // 采购单号
 "inStockName": "20210512入库单",           // 入库单名称
 "inStockId": "I20210512100252721441",     // 入库单号
 "companyId": "7",                         // 所属公司ID
 "goodsId": "KH20201204160919272037",      // 商品ID
 "goodsName": "笔记本",                     // 商品名称
 "img": "/fandemi-image/20201204160722/202012839.jpg",  // 商品图片
 "itemNo": null,                           // 忽略
 "purchUserId": "293",                     // 采购员ID
 "purchUserName": "凌鸥",                  // 采购员名称
 "stockUserId": "91",                      // 库管ID
 "stockUserName": "童少供货",              // 库管名称
 "purchTime": "2021-05-11 17:26:27",      // 采购时间
 "inStockNum": 2,                         // 入库数量
 "price": 14.5,                           // 入库价格
 "batchNo": null,                         // 入库批次
 "createTime": "2021-05-12 10:02:53",     // 入库时间
 "isRecycle": 1,                          // 1:不可回收 2:可回收
 "createId": "91",                        // 入库操作人ID
 "type": 1,                               // 1:采购入库 2:其他入库
 "stockNum": 10                           // 商品目前库存*/
@interface IOSInStoreModel : JSONModel
@property (nonatomic,strong) NSString *stockUserPhoto,*createTime,*stockUserName,*price,*purchId,*inStockId,*inStockName,*img,*goodsName,*goodsId;
@property (nonatomic,assign) NSInteger num,stockNum,inStockNum,isRecycle;
@end

NS_ASSUME_NONNULL_END
