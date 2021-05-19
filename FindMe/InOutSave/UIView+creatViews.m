//
//  UIView+creatViews.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "UIView+creatViews.h"

@implementation UIView (creatViews)
/**
 按钮的圆角设置
 

 @param corner UIRectCorner要切除的圆角
 @param color 边框颜色
 @param width 边框宽度

 */
- (void)setRectCorners:(UIRectCorner)corner CornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)color borderWidth:(CGFloat)width {
    
//    CAShapeLayer *mask=[CAShapeLayer layer];
//    UIBezierPath * path= [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(15,10)];
//    mask.path=path.CGPath;
//    mask.frame=self.bounds;
//
//
//    CAShapeLayer *borderLayer=[CAShapeLayer layer];
//    borderLayer.path=path.CGPath;
//    borderLayer.fillColor = [UIColor clearColor].CGColor;
//    if (color) {
//        borderLayer.strokeColor = color.CGColor;
//        borderLayer.lineWidth = width;
//    }
//    borderLayer.frame = self.bounds;
//    self.layer.mask = mask;
//    [self.layer addSublayer:borderLayer];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    self.layer.mask = shapeLayer;
  
}

- (UIView *)createLineFrame:(CGRect)frame lineColor:(UIColor *)color {

    UIView *view = [[UIView alloc] initWithFrame:frame];

    view.backgroundColor = color;
    [self addSubview:view];
    return view;
}

- (UILabel *)createLabelFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font {

    UILabel *view = [[UILabel alloc] initWithFrame:frame];

    view.textColor = color;
    view.font = font;
    [self addSubview:view];
    //view.textAlignment = alignment;
    return view;
}

- (UITextField *)createTextFieldFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font {
    
    UITextField *view = [[UITextField alloc] initWithFrame:frame];
    
    view.textColor = color;
    view.font = font;
    [self addSubview:view];
    return view;
}


- (UIButton *)createButtonFrame:(CGRect)frame title:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font image:(UIImage *)image target:(id)target method:(SEL)method {
    
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    view.frame = frame;
    if (text) {
        [view setTitle:text forState:UIControlStateNormal];
        view.titleLabel.font = font;
        [view setTitleColor:color forState:UIControlStateNormal];
    }
    if (image) {
        [view setImage:image forState:UIControlStateNormal];

    }
    view.adjustsImageWhenHighlighted = NO;
    [view addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:view];
    return view;
}


// Shadows
- (void)createShadow:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius color:(UIColor *)color {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = opacity;//透明度
    self.layer.shadowOffset = offset; //偏离量
    self.layer.shadowRadius = radius;//阴影半径
    self.layer.masksToBounds = NO;
}

- (void)createCornerShadow:(CGFloat)cornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius  color:(UIColor *)color {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.masksToBounds = NO;
    //当shouldRasterize设成true时，layer被渲染成一个bitmap，并缓存起来
//    self.layer.shouldRasterize = YES;
    self.layer.cornerRadius = cornerRadius;
    
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
//    self.layer.mask = shapeLayer;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:cornerRadius] CGPath];
}



- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(LeShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth{
    
    self.layer.masksToBounds = NO;//必须要等于NO否则会把阴影切割隐藏掉
    self.layer.shadowColor = shadowColor.CGColor;// 阴影颜色
    self.layer.shadowOpacity = shadowOpacity;// 阴影透明度，默认0
    self.layer.shadowOffset = CGSizeZero;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = shadowRadius;//阴影半径，默认3
    CGRect shadowRect = CGRectZero;
    CGFloat originX,originY,sizeWith,sizeHeight;
    originX = 0;
    originY = 0;
    sizeWith = self.bounds.size.width;
    sizeHeight = self.bounds.size.height;
    
    if (shadowPathType == LeShadowPathTop) {
        shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == LeShadowPathBottom){
        shadowRect = CGRectMake(originY, sizeHeight-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == LeShadowPathLeft){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == LeShadowPathRight){
        shadowRect = CGRectMake(sizeWith-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == LeShadowPathCommon){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, 2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth/2);
    }else if (shadowPathType == LeShadowPathAround){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth);
    }
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = bezierPath.CGPath;//阴影路径
}
@end
