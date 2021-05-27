//
//  MyBaseViewController.h
//  LedRoad
//
//  Created by 郑州聚义 on 16/8/8.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyBaseViewController : UIViewController

@property (nonatomic, assign) BOOL isOneShow;

//ios11判断
-(UIEdgeInsets)panduanIOS11With:(UIView *)view;

-(void)TTAlert:(NSString *)message;

//设置字体的间距
-(NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace;


#pragma mark -时间转化年月日时分秒字符串
- (NSString *)getDateTimeHMSWithString:(NSDate *)date;
#pragma mark -时间转化年月日字符串
- (NSString *)getDateTimeWithString:(NSDate *)date;
#pragma mark -时间转化年月字符串
- (NSString *)getDateYYYYMMWithString:(NSDate *)date;
#pragma mark -时间转化月字符串
- (NSString *)getDateMMWithString:(NSDate *)date;
#pragma mark -时间转化年字符串
- (NSString *)getDateYYYYWithString:(NSDate *)date;
//字符串转成时间
-(NSDate *)getYMDStringWith:(NSString *)time;
//字符串转成ymdhm时间
-(NSDate *)getYMDHMStringWith:(NSString *)time;
//根据两个字符串计算间隔天数
-(NSString *)getIntervalChunYMDStringWith:(NSString *)begintime withYMDEndTime:(NSString *)endtime;
//根据两个字符串计算间隔天数
-(NSString *)getIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime;
//根据两个字符串计算间隔分钟数
-(NSString *)getFenZhongIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime ;
//根据两个字符串计算间隔小时数
-(NSString *)getXiaoShiIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime ;
- (NSString *)getTimeAddDayAfter:(NSInteger )distance withbengin:(NSString *)nowtime;
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

#pragma mark --- 将时间转换成时间戳
- (NSString *)getTimestampFromTime:(NSString *)time;
#pragma mark --- 将时间YYYY-MM-dd转换成时间戳
- (NSString *)getTimesYYYYMMddtampFromTime:(NSString *)time;
//大量字符串在文本框中显示, 计算这些字符串在文本框中的高度
- (CGFloat)jisuanLabelHight:(CGFloat )fontSize cgsizeMake:(CGFloat )withLeng labelStr:(NSString *)str;

//1. 整形判断
- (BOOL)isPureInt:(NSString *)string;

//2.浮点形判断：
- (BOOL)isPureFloat:(NSString *)string;

//使用NSString的trimming方法。判断一个字符串中是否都是数字
- (BOOL)isPureNumandCharacters:(NSString *)string;

//判断是否全是空格
- (BOOL)isEmptyTong:(NSString *)str;

////原价。。现价
- (NSAttributedString *)recombinePrice:(NSString *)CNPrice withYuanSize:(NSInteger )yuanSize orderPrice:(NSString *)unitPrice withXianSize:(NSInteger )xianSize;

//获得这个月的天数
-(NSUInteger )getDayNumOfThisMonth;

//颜色转图片
- (UIImage*) createImageWithColor: (UIColor*) color;

//设置上图下文的按钮
-(UIButton *)settingBarButtonItemImageName:(NSString *)image withTittle:(NSString *)str;

-(NSString *)zhuzuZhuangjson:(NSArray *)jsonarr;
-(NSString *)zidianzhuangjson:(NSDictionary *)jsondic;

-(NSDictionary *)jsonzhuanzidianmap:(NSString *)json;
-(NSArray *)jsonzhuanHuaArr:(NSString *)json;
- (NSInteger )shijianTimeZhuanShijianchu:(NSString *)time;

////看大图
//-(void)lookdatuaction:(UIButton *)sender;
////根据图片路径看大图
//-(void)lookBigImgWithImgUrl:(NSString *)imgurl;
//获取wifi名字
-(NSString *)getWifiInfo;
- (NSDictionary *)currentWifiInfo;
// 属性字符串
- (NSMutableAttributedString *)attributeText:(NSArray *)attrInfos;


// 底部按钮背景视图
@property (nonatomic, strong) UIView *fview;
#pragma mark - 底部按钮自定义
/**
 * 添加底部按钮
 * buttonTitles  按钮标题集合
 * btnBgColors   按钮背景色集合
 * btnTColors    按钮文字颜色集合
 */
- (void)addBottomButtons:(NSArray<NSString *> *_Nullable)buttonTitles
             btnBgColors:(NSArray<UIColor *> *_Nullable)btnBgColors
              btnTColors:(NSArray<UIColor *> *_Nullable)btnTColors
                 actions:(NSArray *_Nullable)actions;

// 修改底部按钮标题
- (void)setBottomBtnTitle:(NSString *_Nullable)title btnIndex:(NSInteger)btnIndex;

// 修改底部按钮标题颜色
- (void)setBottomBtnTitleColor:(UIColor *_Nullable)titleColor btnIndex:(NSInteger)btnIndex;

// 修改底部按钮背景颜色
- (void)setBottomBtnBgColor:(UIColor *_Nullable)bgColor btnIndex:(NSInteger)btnIndex;

// 设置底部按钮是否可以点击
- (void)setBottomBtnEnable:(BOOL)enable btnIndex:(NSInteger)btnIndex;

// 修改底部按钮图标
- (void)setBottomBtnIcon:(NSString *_Nullable)iconName btnIndex:(NSInteger)btnIndex;

// 获取底部指定按钮
- (UIButton *_Nullable)bottomBtnWithIndex:(NSInteger)btnIndex;

// 底部按钮点击事件
- (void)bottomBtnAction:(UIButton *)btn;

@end
