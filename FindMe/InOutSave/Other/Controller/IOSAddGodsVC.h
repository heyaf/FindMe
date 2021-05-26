//
//  IOSAddGodsVC.h
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import "MyBaseShowTableViewController.h"
@class IOSGodsListM;
NS_ASSUME_NONNULL_BEGIN

@interface IOSAddGodsVC : MyBaseShowTableViewController
@property (nonatomic,strong) IOSGodsListM *godsModel;
@property (nonatomic,copy) void(^ChangeBlock)(IOSGodsListM *godsModel); //修改商品

@end

NS_ASSUME_NONNULL_END
