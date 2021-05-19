//
//  MJCustomActionSheet.h
//  MagikareDoctor
//
//  Created by talking　 on 2017/7/14.
//  Copyright © 2017年 talking　. All rights reserved.
////  自定义ActionSheet，类似于系统的UIActionSheet


#import <UIKit/UIKit.h>

@class MJCustomActionSheet;
typedef void(^MJCustomActionSheetItemClickHandle)(MJCustomActionSheet *actionSheet,NSInteger currentIndex, NSString *title);

@interface MJCustomActionSheet : UIView

/**
 *  初始化
 *
 *  @param cancelTitle 取消
 *  @param alertTitle  提示文字
 *  @param title       子控件文本
 */
+ (instancetype)actionSheetWithCancelTitle:(NSString *)cancelTitle alertTitle:(NSString *)alertTitle SubTitles:(NSString *)title,...NS_REQUIRES_NIL_TERMINATION;

- (void)setCustomActionSheetItemClickHandle:(MJCustomActionSheetItemClickHandle)itemClickHandle;

- (void)setActionSheetDismissItemClickHandle:(MJCustomActionSheetItemClickHandle)dismissItemClickHandle;

- (void)show;

@end
