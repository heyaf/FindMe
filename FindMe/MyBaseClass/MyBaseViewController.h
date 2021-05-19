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

-(BOOL)judgePassWordLegal:(NSString *)pass;
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
-(NSString *)getIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime;
//根据两个字符串计算间隔分钟数
-(NSString *)getFenZhongIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime ;
//根据两个字符串计算间隔小时数
-(NSString *)getXiaoShiIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime ;

- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

//判断是否正确的手机号码
- (BOOL)isValidMobile:(NSString *)mobile error:(NSError **)error;

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

//字典和json转化
-(NSString *)zidianzhuangjson:(NSDictionary *)jsondic;
-(NSDictionary *)jsonzhuanzidianmap:(NSString *)json;
//将数组转换成json格式字符串
-(NSString *)gs_jsonStringCompactFormatForNSArray:(NSArray *)arrJson;

@end
