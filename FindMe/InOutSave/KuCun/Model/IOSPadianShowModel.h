//
//  IOSPadianShowModel.h
//  FindMe
//
//  Created by mac on 2021/5/27.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSPadianShowModel : JSONModel
/*checkId": "3e05a636132248e585d71a7c6eb44f51",
 "checkName": "20200822盘点单",
 "checkUserId": "123df8071c4c4414826caacdad17b5ad",
 "checkUserName": "王副总经理",
 "num": 2,
 "createTime": "2020-08-22 14:53:22"*/

@property (nonatomic,strong) NSString *checkId,*checkUserId,*checkUserName,*createTime,*checkName,*checkUserPhoto;
@property (nonatomic,assign) NSInteger num;
@end

NS_ASSUME_NONNULL_END
