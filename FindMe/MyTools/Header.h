//
//  Header.h
//  SubtleRecruitment
//
//  Created by 郑州聚义 on 2018/7/12.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#ifndef Header_h
#define Header_h


//head.h文件一般用于添加宏定义, 以及一些比较常用的api, 比如NSLog, 公司后台的接口地址,等
//常用宏
//转字符串 对后台返回的空字符串进行g转换
#define AowString(string) (([[NSString stringWithFormat:@"%@", (string)] isEqualToString:@"(null)"] || [[NSString stringWithFormat:@"%@", (string)] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@", (string)] isEqualToString:@"null"])?@"":[NSString stringWithFormat:@"%@", (string)])
#pragma mark -获取整个app delegate
#define MJGET_APP_DELEGATE   ((AppDelegate *)[UIApplication sharedApplication].delegate)
//屏幕宽
#define KDeviceWith [UIScreen mainScreen].bounds.size.width
//屏幕高
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kDevice_Is_iPhoneX ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

#define IsiPhone11 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPhone11Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define IsiPhone11ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhone12_Mini
#define DX_Is_iPhone12_Mini ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 2340), [[UIScreen mainScreen] currentMode].size) && !DX_UI_IS_IPAD : NO)
//判断iPhone12 | 12Pro
#define DX_Is_iPhone12 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) && !DX_UI_IS_IPAD : NO)
//判断iPhone12 Pro Max
#define DX_Is_iPhone12_ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size) && !DX_UI_IS_IPAD : NO)
// 判断 iPad
#define DX_UI_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define KEVNScreenStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define KEVNScreenNavigationBarHeight 44.f
#define KEVNScreenTopStatusNaviHeight (KEVNScreenStatusBarHeight + KEVNScreenNavigationBarHeight)

#define KEVNScreenTabBarHeight ((kDevice_Is_iPhoneX ||IsiPhone11||IsiPhone11Pro|| IsiPhone11ProMax ) ? (49.f+34.f) : 49.f)
// MARK: 安全区底部高度
#define KEVNScreenTabBarSafeBottomMargin ((kDevice_Is_iPhoneX ||IsiPhone11||IsiPhone11Pro|| IsiPhone11ProMax ) ? 34.f : 0.f)

//打印API
#define showLogInfo 1
#if showLogInfo
#    define MyLog(...) NSLog(__VA_ARGS__)
#else
#    define MyLog(...)
#endif
#pragma mark - 弱引用
#define MJDefineWeakSelf       __weak typeof(self) weakSelf = self
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

#pragma mark - 获取最大值和最小值
#define kMax(value1,value2) (value1 > value2 ? value1 : value2)
#define kMin(value1,value2) (value1 > value2 ? value2 : value1)
//颜色
#define RGBA(r, g, b, a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//确认按钮的颜色
#define KDequeColor RGBA(254, 182, 9, 1)
//确认按钮字体的颜色
#define KDequeTextColor [UIColor blackColor]
//主题颜色
#define KAppColor RGBA(255, 192, 0, 1)
//转字符串 对后台返回的空字符串进行g转换
#define AowString(string) (([[NSString stringWithFormat:@"%@", (string)] isEqualToString:@"(null)"] || [[NSString stringWithFormat:@"%@", (string)] isEqualToString:@"<null>"] || [[NSString stringWithFormat:@"%@", (string)] isEqualToString:@"null"])?@"":[NSString stringWithFormat:@"%@", (string)])
#pragma mark - 字符串转化
#define kEmptyStr @""
#define kIntToStr(i) [NSString stringWithFormat: @"%d", i]//把int 转成string
#define kIntegerToStr(i) [NSString stringWithFormat: @"%ld", i]//把Integer 转成string
#define kFloatToStr(i) [NSString stringWithFormat: @"%.2f", i]//把float 转成string

// 环信聊天用的昵称和头像（发送聊天消息时，要附带这3个属性）
#define kChatUserId @"ChatUserId" // 环信账号
#define kChatUserNick @"ChatUserNick"
#define kChatUserPic @"ChatUserPic"

/** token 字段 */
#define User_token_key @"userToken"
#define KUser_token [[NSUserDefaults standardUserDefaults] valueForKey:User_token_key]

/** uid 字段 */
#define User_id_key @"employeeId"
#define kUser_id [[NSUserDefaults standardUserDefaults] valueForKey:User_id_key]

#define User_Companyid_key @"userCompanyid"
#define User_Companyid [[NSUserDefaults standardUserDefaults] valueForKey:User_Companyid_key]
//用户类型：2供应商；3装修公司
#define User_ComType_key @"userComType"
#define KUser_ComType [[NSUserDefaults standardUserDefaults] valueForKey:User_ComType_key]

// 设置图片
#define MJImgUrl(i) [NSURL URLWithString:[NSString stringWithFormat:@"%@",ServiceStrEncode(i)]]//图片URL
#define ServiceStrEncode(__imageUrl) [__imageUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]
#define ServiceUrlStr(__imageUrl) [NSString stringWithFormat:@"%@%@",AppServerURL,ServiceStrEncode(__imageUrl)]
#define KSeverImageUrl(__imageUrl) [NSURL URLWithString:ServiceUrlStr(__imageUrl)]

//是建材端
#define AppProIsType ({BOOL isGongyingshang = NO;if ([[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"] isEqualToString:@"com.findme.supplier"]) {isGongyingshang = YES;}(isGongyingshang);})

#define AppProChange(urlstr) ({NSString *jiekou = urlstr;if ([[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"] isEqualToString:@"com.findme.supplier"]) {jiekou=[urlstr stringByReplacingOccurrencesOfString:@"/d/" withString:@"/s/"];}(jiekou);})

#define KImageUrlset(str) [NSURL URLWithString:[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]]
#define KImageSdsetPlacehod(phototView,str)     [phototView sd_setImageWithURL:KImageUrlset(str) placeholderImage:[UIImage imageNamed:@"placeholder"] completed:nil];

#define AppServerURL @"http://192.168.2.11:81"
//#define AppServerURL @"http://114.116.231.149"
////http://wolaikanyanhua.oicp.net:8011

#define AppGongRenServerURL @"http://114.116.231.149:9020"
//#define AppGongRenServerURL @"http://192.168.2.116:8084"

//考勤相关
//全部刘海屏幕
#define  iPhone4      ([[UIScreen mainScreen] bounds].size.height==480)
#define  iPhone5      ([[UIScreen mainScreen] bounds].size.height==568)
#define  iPhone4_5    (iPhone4 || iPhone5)
#define  iPhone6      ([[UIScreen mainScreen] bounds].size.height==667)
#define  iPhoneX       (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size))
#define  iPhoneXR      (CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size))
#define  iPhone_Xs_Max (CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size))
#define  iPhone12_mini (CGSizeEqualToSize(CGSizeMake(1080, 2340), [[UIScreen mainScreen] currentMode].size))
#define  iPhone12      (CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size))
#define  iPhone12_Max  (CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size))
#define iPhoneXAll (iPhoneX || iPhoneXR || iPhone_Xs_Max || iPhone12_mini || iPhone12 || iPhone12_Max)
#define  iPad         ([[UIDevice currentDevice].model isEqualToString:@"iPad"])
#define NavHeight        (iPhoneXAll ? 88.0 : (iPad?90.0:64.0))
#define TabHeight        (iPhoneXAll ? 83.0 : 49.0)
#define BottomHeight     (iPhone4_5?55:(iPhone6?60:65))
#define StatusBarHeight  (iPhoneXAll? 44.0 : 20.0)
#define SafeAreaBottomHeight (iPhoneXAll ?34 : 0)
#define SafeAreaTopHeight (iPhoneXAll ? 44.f : 20.f)
#define TitleColor       RGB(51, 51, 51)
#define BaiSe            RGB(254,254,254)
/*! 弱引用宏 */
#define WeakObj(o)       try{}@finally{} __weak typeof(o) Weak##o = o;
#define WeakSelf         @WeakObj(self)
/*! 提示 */
#define WAITING         [MBProgressHUD showMessage:@"加载中"];
#define DISMISS         [MBProgressHUD hideHUD];
#define ERRORWith(a)    [MBProgressHUD showError:a];
#define INFOWith(a)     [MBProgressHUD showInfo:a];
#define SUCCESS(a)      [MBProgressHUD showSuccess:a];
// 设置图片
#define ImageNamed(name) [UIImage imageNamed:name]
// 比较字符串是否相等
#define StringEqual(str1,str2) [str1 isEqualToString:str2]
// 字符串是否是空
#define StringEmpty(str) (str == nil || str.length == 0)
#define FONT(a)    [UIFont systemFontOfSize:a]
#define String(a)          [NSString stringWithFormat:@"%@",a]

#endif /* Header_h */
