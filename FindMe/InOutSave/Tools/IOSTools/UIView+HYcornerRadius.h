//
//  UIView+HYcornerRadius.h
//  FindMe
//
//  Created by mac on 2021/6/1.
//

#import <UIKit/UIKit.h>
#import "CYAnyCornerRadiusUtil.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HYcornerRadius)
/**
 * Border radii.
 */
@property (nonatomic, assign) CGFloat borderRadius;
@property (nonatomic, assign) CGFloat borderTopLeftRadius;
@property (nonatomic, assign) CGFloat borderTopRightRadius;
@property (nonatomic, assign) CGFloat borderBottomLeftRadius;
@property (nonatomic, assign) CGFloat borderBottomRightRadius;


/**
 * Border colors (actually retained).
 */
@property (nonatomic, assign) CGColorRef borderTopColor;
@property (nonatomic, assign) CGColorRef borderRightColor;
@property (nonatomic, assign) CGColorRef borderBottomColor;
@property (nonatomic, assign) CGColorRef borderLeftColor;
@property (nonatomic, assign) CGColorRef borderColor;

/**
 * Border widths.
 */
@property (nonatomic, assign) CGFloat borderTopWidth;
@property (nonatomic, assign) CGFloat borderRightWidth;
@property (nonatomic, assign) CGFloat borderBottomWidth;
@property (nonatomic, assign) CGFloat borderLeftWidth;
@property (nonatomic, assign) CGFloat borderWidth;

@property (nonatomic, assign) CornerRadii cornerRadii;

-(void)drawHYCornerRaiuswithborderTopLeftRadius:(CGFloat)borderTopLeftRadius borderTopRightRadius:(CGFloat )borderTopRightRadius borderBottomLeftRadius:(CGFloat)borderBottomLeftRadius
    borderBottomRightRadius:(CGFloat)borderBottomRightRadius;
@end

NS_ASSUME_NONNULL_END
