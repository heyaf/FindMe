//
//  FMWWishListM.h
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMWWishListM : JSONModel
/*                "wishType": "2",//1个人计划 2工作计划
 "cycleTime": "1",//1今日计划 2本周计划 3本月计划 4本季计划 5本年计划
 "qiandanNum": 10,//签单量
 "luruNum": 1,//录入量
 "qiandanPrice": "100",//签单金额
 "levleName": "排长",//级别名称
 "levleId": 12,//级别id
 "startLevleName": "巨门星",//星级名称
 "startLevleId": 3932,//星级id
 "qiandanStatus": "2",//1完成 2未完成
 "luruStatus": "2",//1完成 2未完成
 "qiandanPriceStatus": "2",//1完成 2未完成 签单金额是否完成
 "levleStatus": "2",//级别是否达到 1达到2未达到
 "startLevleStatus": "2",//星级是否达到 1达到 2未达到
 "wishStatus": "2",//心愿单是否完成 1完成 2未完成luruStatus*/

@property (nonatomic,strong) NSString *cycleTime,*qiandanPrice,*levleName,*startLevleName,*qiandanStatus,*qiandanPriceStatus,*levleStatus,*startLevleStatus,*wishStatus,*luruStatus,*name;
@property (nonatomic,assign) NSInteger luruNum,qiandanNum,stockNum,num;
@end

NS_ASSUME_NONNULL_END
