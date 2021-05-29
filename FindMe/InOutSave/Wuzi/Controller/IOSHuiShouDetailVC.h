//
//  IOSHuiShouDetailVC.h
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import "MyBaseShowTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IOSHuiShouDetailVC : MyBaseShowTableViewController

//是否已经回收
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,strong) NSString *recoveryId;

@end

NS_ASSUME_NONNULL_END
