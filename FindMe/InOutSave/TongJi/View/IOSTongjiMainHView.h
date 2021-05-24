//
//  IOSTongjiMainHView.h
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class IOSTongJiHeaderView;
@interface IOSTongjiMainHView : UIView
@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) NSArray *titleNumArray;

@property (nonatomic,strong) NSString *titleStr;

@property (nonatomic,strong) IOSTongJiHeaderView *subheadView;
@end

NS_ASSUME_NONNULL_END
