//
//  IOSChooseGoodsViewController.h
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "MyBaseShowTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IOSChooseGoodsViewController : MyBaseShowTableViewController

@property (nonatomic,copy) void(^chooseGodsBlock)(NSArray *godsArr);
@end

NS_ASSUME_NONNULL_END
