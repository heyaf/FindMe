//
//  IOSTongji1M.h
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSTongji1M : JSONModel
/*            {
 "outStockNum": 2,                                    // 出库数量
                 "img": "/fandemi-image/20201204160722/20201239.jpg", // 商品图片
                 "goodsId": "KH20201204160919272037",                 // 商品ID
                 "outStockId": "O20210512154503141382",               // 出库单号
                 "outStockName": "20210512出库单",                    // 出库单名称
                 "outStockTime": "2021-05-12 15:45:25",               // 出库时间
                 "stockUserId": "91",                                 // 库管ID
                 "companyId": "7",                                    // 公司ID
                 "stockUserName": "童少供货",                          // 库管姓名
                 "price": 14.5,                                       // 商品价格
                 "getUserName": "凌鸥",                               // 领取人姓名
                 "goodsName": "笔记本",                               // 商品名称
                 "getUserId": "293"                                   // 领取人ID
},*/
@property (nonatomic,strong) NSString *img,
*price,
*goodsId,
*purchUserId,
*purchUserName,
*purchTime,
*purchName,
*stockUserId,
*stockUserName,*purchId,*goodsName,*outStockId;
@property (nonatomic,assign) NSInteger num,type,outStockNum;
@end

NS_ASSUME_NONNULL_END
