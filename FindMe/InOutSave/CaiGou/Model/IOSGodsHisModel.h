//
//  IOSGodsHisModel.h
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSGodsHisModel : JSONModel
/*                "purchName": "20210511采购单",         // 采购单名称
 "price": 31,                          // 采购总价格
 "purchUserPhoto": "F://images/2.jpg", // 采购员头像
 "num": 4,                             // 采购总数量
 "purchId": "C20210511182028",         // 采购单号
 "type": 1,                            // 采购状态 1:采购中 2:采购完成
 "purchUserId": "293",                 // 采购员ID
 "purchUserName": "凌鸥",              // 采购员姓名
 "purchTime": "2021-05-11 17:26:27"    // 采购时间
 */

@property (nonatomic,strong) NSString *purchId,*price,*purchUserPhoto,*purchUserId,*purchUserName,*purchTime,*purchName;
@property (nonatomic,assign) NSInteger num,type; 
@end

NS_ASSUME_NONNULL_END
