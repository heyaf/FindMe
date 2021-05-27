//
//  IOSPandianShouM.h
//  FindMe
//
//  Created by mac on 2021/5/27.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*                "checkId": "Check20210513113708769829",          // 盘点单号
 "checkName": "20210513盘点单",                    // 盘点单名称
 "checkUserId": "91",                             // 盘点人ID
 "checkUserName": "童少供货",                      // 盘点人姓名
 "checkTime": "2021-05-13 11:37:26",              // 盘点时间
 "goodsId": "KH20201204160558361866",             // 商品ID
 "goodsName": "圆珠笔",                            // 商品名称
 "img": "/fandemi-image/20201204162453/20201251.jpg", // 商品图片
 "checkNum": 5,                                   // 盘点数量
 "stockNum": 4,                                   // 当前库存数量
 "num": 1,                                        // 盈亏数量
 "price": 1,                                      // 商品价格
 "sumpaid": 1,                                    // 盈亏金额
 "type": 2,                                       // 1:盘点中 2:完成盘点
 "companyId": "7",                                // 所属公司ID
 "companyType": "2",                              // 公司类型 3装修公司 2供应商
 "createTime": "2021-05-13 11:37:09",             // 创建时间
 "isRecycle": 1                                   // 所属公司ID
}*/
@interface IOSPandianShouM : JSONModel
@property (nonatomic,strong) NSString *checkName,*checkUserId,*checkUserName,*checkTime;
@property (nonatomic,assign) NSInteger checkNum;
@end

NS_ASSUME_NONNULL_END
