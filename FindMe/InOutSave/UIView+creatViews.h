//
//  UIView+creatViews.h
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_OPTIONS(NSUInteger, LeShadowPathType) {
    LeShadowPathLeft,
    LeShadowPathRight,
    LeShadowPathBottom,
    LeShadowPathTop,
    LeShadowPathAround,
    LeShadowPathCommon,
};
@interface UIView (creatViews)
/**
 按钮的圆角设置
 
 
 @param corner UIRectCorner要切除的圆角
 @param color 边框颜色
 @param width 边框宽度
 
 */
- (void)setRectCorners:(UIRectCorner)corner CornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)color borderWidth:(CGFloat)width;

/** 快速创建label */
- (UILabel *)createLabelFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font;


/** 快速创建按钮 */
- (UIButton *)createButtonFrame:(CGRect)frame title:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font image:(UIImage *)image target:(id)target method:(SEL)method;

/** 快速创建输入框 */
- (UITextField *)createTextFieldFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font;
        
/**
 *  Create a shadow on the UIView
 *
 *  @param offset  Shadow's offset
 *  @param opacity Shadow's opacity
 *  @param radius  Shadow's radius
 */
- (void)createShadow:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius color:(UIColor *)color;

/**
 *  Create a corner radius shadow on the UIView
 *
 *  @param cornerRadius Corner radius value
 *  @param offset       Shadow's offset
 *  @param opacity      Shadow's opacity
 *  @param radius       Shadow's radius
 */
- (void)createCornerShadow:(CGFloat)cornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius  color:(UIColor *)color;


///创建单边阴影
- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(LeShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;

///创建线条
- (UIView *)createLineFrame:(CGRect)frame lineColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
