//
//  IOSGodsHistoryVC.h
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "MyBaseShowTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IOSGodsHistoryVC : MyBaseViewController

@property (nonatomic,assign) NSInteger type; //1:采购中 2:采购完成 空值:全部
@property (nonatomic,strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
