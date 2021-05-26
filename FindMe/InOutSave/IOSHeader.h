//
//  IOSHeader.h
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#ifndef IOSHeader_h
#define IOSHeader_h
#import "UIView+creatViews.h"
#import "UIView+Frame.h"
#import "UIView+IOSSize.h"
#import "CYCustomArcImageView.h"
#import "YNPageViewController.h"
#import <JSONModel.h>
#import <TZImagePickerController/TZImagePickerController.h>

#import "AFNetHelp.h"
#import "UIImage+ColorImage.h"

#import "IOSMessageAlertView.h"
#import "UIButton+SSEdgeInsets.h"
#import "UIImage+imageSize.h"
#define IOSMainColor RGBA(46, 153, 146, 1)
#define IOSSubTitleColor [UIColor grayColor]
#define IOSCancleBtnColor RGBA(234, 245, 246, 1)
#define IOSTitleColor RGBA(51, 51, 51, 1)

#define kFONT(f)            [UIFont systemFontOfSize:(f)]
#define kBOLDFONT(f)        [UIFont boldSystemFontOfSize:(f)]
#define FONT_ITALIC_SIZE(f)     [UIFont italicSystemFontOfSize:(f)]
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;

//View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//字符串拼接
#define kStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
#endif /* IOSHeader_h */
