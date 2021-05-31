//
//  FMWLHeader.h
//  FindMe
//
//  Created by mac on 2021/5/31.
//

#ifndef FMWLHeader_h
#define FMWLHeader_h

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height

#define kScreenMaxLength (MAX(kScreenW, kScreenH))

#define kISiPhone [[UIDevice currentDevice].model isEqualToString:@"iPhone"]
#define kISiPhoneX (kISiPhone && kScreenMaxLength > 810.0)
//状态栏高度
#define kStatusBarHeight (kISiPhoneX?44:20)
//导航栏高度
#define kNavBarHeight (kStatusBarHeight + 44)
#define FMWZMainColor RGBA(57, 145, 142, 1)

#endif /* FMWLHeader_h */
