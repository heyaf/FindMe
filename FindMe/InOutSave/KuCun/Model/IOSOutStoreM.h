//
//  IOSOutStoreM.h
//  FindMe
//
//  Created by mac on 2021/5/29.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSOutStoreM : JSONModel
@property (nonatomic,strong) NSString *stockUserPhoto,*createTime,*stockUserName,*price,*purchId,*outStockId,*outStockName,*img,*goodsName,*goodsId,*mateId,*outStockTime,*getUserName,*getUserPhoto;
@property (nonatomic,assign) NSInteger num,stockNum,inStockNum,isRecycle,outStockNum;
@end

NS_ASSUME_NONNULL_END
