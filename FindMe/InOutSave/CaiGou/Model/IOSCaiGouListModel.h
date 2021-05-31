//
//  IOSCaiGouListModel.h
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*            {
 "img": "/fandemi-image/20201204160047/202082.jpg",// 商品图片
 "companyType": "2",                               // 3:装修公司 2:供应商
 "isRecycle": 1,                                   // 1:不可回收 2:可回收
 "price": 1.28,                                    // 价格
 "stockNum": 18,                                   // 库存数量
 "id": "KH20201204160558361866",                   // 商品ID
 "goodsName": "圆珠笔"                              // 商品名称
},*/
@interface IOSCaiGouListModel : JSONModel
@property (nonatomic,strong) NSString *godsId,*goodsName,*img,*price,*goodsId;
@property (nonatomic,assign) NSInteger status,stockNum,isRecycle,selectCount,inNum,num; //selectCount选择的数量

@property (nonatomic,assign) BOOL isSelected;

@end

NS_ASSUME_NONNULL_END
