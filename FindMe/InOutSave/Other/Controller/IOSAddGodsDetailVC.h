//
//  IOSAddGodsDetailVC.h
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import "MyBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IOSAddGodsDetailVC : MyBaseViewController
@property (nonatomic,strong) NSString *detailstring;
@property (nonatomic,copy) void(^ResultBlock)(NSString *chooseStr);

@end

NS_ASSUME_NONNULL_END
