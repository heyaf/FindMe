//
//  IOSGodsChoosePinPaiVC.h
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import "MyBaseShowTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IOSGodsChoosePinPaiVC : MyBaseShowTableViewController
@property (nonatomic,assign) NSInteger status;// 1:品牌 3:单位
@property (nonatomic,copy) void(^chooseBlock)(NSString *chooseStr);
@end

NS_ASSUME_NONNULL_END
