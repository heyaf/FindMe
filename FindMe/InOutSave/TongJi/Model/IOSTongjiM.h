//
//  IOSTongjiM.h
//  FindMe
//
//  Created by mac on 2021/5/29.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSTongjiM : JSONModel
/*            {
 "img": "/fandemi-image/20201204160047/20201222.jpg", // 商品图片
 "goodsId": "KH20201204160558361866",                 // 商品ID
 "num": 2,                                            // 商品采购数量
 "purchUserName": "凌鸥",                             // 采购员姓名
 "purchTime": "2021-05-11 17:26:27",                  // 采购时间
 "stockUserId": "91",                                 // 库管ID
 "companyId": "7",                                    // 公司ID
 "stockUserName": "童少供货",                          // 库管姓名
 "price": 1,                                          // 商品采购价格
 "purchId": "C20210511182028",                        // 采购单号
 "inStockId": "",                                     // 入库单号
 "inStockName": "",                                   // 入库单名称
 "purchUserId": "293",                                // 采购员ID
 "goodsName": "圆珠笔"                                // 商品名称
},*/
@property (nonatomic,strong) NSString *img,
*price,
*goodsId,
*inStockId,
*purchUserId,
*purchUserName,
*purchTime,
*purchName,
*stockUserId,
*stockUserName,*purchId,*goodsName;
@property (nonatomic,assign) NSInteger num,type,inStockNum;

@end

NS_ASSUME_NONNULL_END
