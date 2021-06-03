//
//  FMWishFinshView.h
//  FindMe
//
//  Created by mac on 2021/6/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMWishFinshView : UIButton
- (instancetype)initWithFrame:(CGRect)frame
                      DataDic:(NSArray *)DataDic;
/**
 *  显示弹出框
 */
- (void)show;

/**
 *  在指定view上显示弹出框
 */
- (void)showInView:(UIView *)view;

/**
 *  销毁弹出框
 */
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
