//
//  IOSChoHuishouM.h
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSChoHuishouM : JSONModel
/*            "getUserPhoto": "F://images/2.jpg",      // 领取人头像
 "mateName": "凌鸥",                      // 物资单名称
 "STATUS": 1,
 "getTime": "2021-05-15 11:10:00",        // 领取时间
 "getUserName": "凌鸥",                   // 领取人姓名
 "mateId": "M20210515103246518141",       // 物资单号
 "getUserId": "293"                       // 领取人ID*/

@property (nonatomic,strong) NSString *getUserPhoto,*mateName,*getTime,*getUserName,*mateId,*price,*img,*goodsName;
@property (nonatomic,assign) BOOL isSelect,num;
@end

NS_ASSUME_NONNULL_END
