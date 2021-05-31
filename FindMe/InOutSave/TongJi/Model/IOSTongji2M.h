//
//  IOSTongji2M.h
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSTongji2M : JSONModel
/*            {
 "img": "/fandemi-image/20201204162453/20201251.jpg", // 商品图片
 "checkNum": 5,                                       // 盘点数量
 "goodsId": "KH20201204160558361866",                 // 商品ID
 "num": 1,                                            // 盈亏数量
 "checkUserId": "91",                                 // 盘点人ID
 "checkName": "20210513盘点单",                        // 盘点单名称
 "type": 2,                                           // 1:盘点中 2:完成盘点
 "companyId": "7",                                    // 公司ID
 "checkTime": "2021-05-13 11:30:30",                  // 盘点时间
 "price": 1,                                          // 商品价格
 "stockNum": 4,                                       // 当前库存数量
 "checkUserName": "童少供货",                          // 盘点人名称
 "checkId": "Check20210513112530687084",              // 盘点单号
 "goodsName": "圆珠笔",                               // 商品名称
 "sumpaid": 1                                         // 盈亏金额
},*/
@property (nonatomic,strong) NSString *img,
*price,
*sumpaid,
*goodsId,
*checkUserId,
*checkUserName,
*checkTime,
*checkName,
*stockUserId,
*stockUserName,*checkId,*goodsName;
@property (nonatomic,assign) NSInteger stockNum,checkNum,num,type;
@end

NS_ASSUME_NONNULL_END
