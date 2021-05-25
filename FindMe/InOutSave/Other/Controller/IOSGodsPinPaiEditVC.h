//
//  IOSGodsPinPaiEditVC.h
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import "MyBaseShowTableViewController.h"
@class IOSGodspinpaiM;
NS_ASSUME_NONNULL_BEGIN

@interface IOSGodsPinPaiEditVC : MyBaseShowTableViewController
@property (nonatomic,assign) NSInteger status;// 1:品牌 3:单位
@property (nonatomic,assign) NSInteger type;// 1:新增 2:修改

@property (nonatomic,strong) IOSGodspinpaiM *pinpaiModel;
@end

NS_ASSUME_NONNULL_END
