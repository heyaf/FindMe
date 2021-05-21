//
//  IOSMessageAlertView.h
//  SXAlertView
//
//  Created by mac on 2021/5/21.
//  Copyright © 2021 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum _IOSMesAlertType {
    IOSMesAlertTypeMessage,
    IOSMesAlertTypeChoose,
    IOSMesAlertTypeTF
} IOSMesAlertType;

/**
 *  SXAlertView代理方法
 */
@protocol IOSMessageAlertViewDelegate <NSObject>
-(void)makeSureBtnClickWithinputStr:(NSString *)inputStr;
@optional


@end
@interface IOSMessageAlertView : UIButton

@property (nonatomic,assign) IOSMesAlertType alertType;

@property (nonatomic,strong) NSAttributedString *titleAttriStr;

@property (nonatomic,strong) NSString *cancleBtnName;

@property (nonatomic,strong) NSString *sureBtnName;

@property (nonatomic,strong) NSString *detailStr;

- (instancetype)initWithFrame:(CGRect)frame                 type:(IOSMesAlertType)type
                     titleStr:(NSAttributedString *) titleStr cancleBtnName:(NSString *)cancleBtnName sureBtnName:(NSString *)sureBtnName DetailBtnName:(NSString *)DeatilName;
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

@property (nonatomic, assign) id<IOSMessageAlertViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
