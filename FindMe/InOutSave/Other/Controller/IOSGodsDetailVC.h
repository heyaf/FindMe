//
//  IOSGodsDetailVC.h
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import "MyBaseViewController.h"
@class IOSGodsListM;

NS_ASSUME_NONNULL_BEGIN

@interface IOSGodsDetailVC : MyBaseShowTableViewController
@property (nonatomic,strong) IOSGodsListM *godsModel;

@end

NS_ASSUME_NONNULL_END
