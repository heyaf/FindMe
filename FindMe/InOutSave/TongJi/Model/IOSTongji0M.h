//
//  IOSTongji0M.h
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSTongji0M : JSONModel
/*            {
 "img": "/fandemi-image/20201204160047/20201222.jpg", // 商品图片
 "goodsId": "KH20201204160558361866",                 // 商品ID
 "purchUserName": "凌鸥",                             // 采购员姓名
 "purchTime": "2021-05-11 17:26:27",                  // 采购时间
 "stockUserId": "91",                                 // 库管ID
 "companyId": "7",                                    // 公司ID
 "stockUserName": "",                                 // 库管姓名
 "price": 1,                                          // 商品价格
 "purchId": "C20210511182028",                        // 采购单号
 "inStockId": "I20210512100252721441",                // 入库单号
 "inStockName": "20210512入库单",                     // 入库单名称
 "purchUserId": "293",                               // 采购员ID
 "goodsName": "圆珠笔",                               // 商品名称
 "inStockNum": 2                                     // 入库数量
},*/
@property (nonatomic,strong) NSString *img,
*price,
*goodsId,
*purchUserId,
*purchUserName,
*purchTime,
*purchName,
*stockUserId,
*stockUserName,*purchId,*goodsName;
@property (nonatomic,assign) NSInteger num,type,inStockNum;
@end

NS_ASSUME_NONNULL_END
