//
//  IOSGodsListM.h
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN
/*
 "id": "KH20210506162723953072",                   // 商品ID(货号)
 "goodsName": "魅族18",                            // 商品名称
 "companyId": "15",                                // 员工所在公司ID
 "img": "/s/document/company/supplier/fda725.jpg", // 商品图片路径
 "inStockNum": 0,                                  // 待入库数量(可先忽略)
 "outStockNum": 0,                                 // 待出库数量(可先忽略)
 "stockNum": 4,                                    // 库存量
 "warnNum": 2,                                     // 库存预警数量
 "price": 556,                                     // 采购单价
 "brand": "华为",                                  // 品牌
 "style": null,                                    // 分类(可忽略)
 "unit": "台",                                     // 单位
 "batchNo": "20210506003",                         // 批号
 "detail": "麻花辫 批次为 20210506001 入库数量为",   // 商品详情
 "toStatus": 1,                                    // 可忽略
 "purchDay": null,                                 // 采购周期<天>(可忽略)
 "qrCode": null,                                   // 忽略
 "createTime": "2021-05-06 16:27:24",              // 创建时间
 "createId": null,                                 // 创建人ID
 "updateTime": "2021-05-06 16:39:03",              // 修改时间
 "updateId": "89",                                 // 修改人ID
 "isRecycle": 1,                                   // 1:不可回收 2:可回收
 "companyType": "2"                                // 3:装修公司 2:供应商
 **/
@interface IOSGodsListM : JSONModel
@property (nonatomic,strong) NSString *GodsId,*goodsName,*img,*companyId,*brand,*unit,*batchNo,*detail,*createTime,*updateTime,*price,*companyType;
@property (nonatomic,assign) NSInteger status,stockNum,warnNum,isRecycle,inStockNum,outStockNum;
@end

NS_ASSUME_NONNULL_END
