//
//  MyBaseViewController.m
//  LedRoad
//
//  Created by 郑州聚义 on 16/8/8.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "MyBaseViewController.h"
//#import "WRNavigationBar.h"
#import "SystemConfiguration/CaptiveNetwork.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <CoreLocation/CoreLocation.h>

@interface MyBaseViewController ()
// 底部按钮点击回调
@property (nonatomic, strong) NSArray *bottomBtnActions;

@end

@implementation MyBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self wr_setNavBarBarTintColor:KAppColor];
//    [self wr_setNavBarTitleColor:[UIColor blackColor]];
    
    UIImage *image = [UIImage imageNamed:@"back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
 
    
}

//ios11判断
-(UIEdgeInsets)panduanIOS11With:(UIView *)view {
        if (@available(iOS 11.0, *)) {
            return view.safeAreaInsets;
        }
    return UIEdgeInsetsZero;
}

//弹窗
-(void)TTAlert:(NSString *)message {
    UIAlertController *alerC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *dequer = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
//    [alerC addAction:dequer];
    [alerC addAction:cancel];
    [self.view.window.rootViewController presentViewController:alerC animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSAttributedString *)getAttributedStringWithString:(NSString *)htmlString lineSpace:(CGFloat)lineSpace {

    NSAttributedString * attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    

    return attributedString;
}


//把带有图片的属性字符串转成普通的字符串
-(NSString *)textString:(NSAttributedString *)attributedString {
    
    NSMutableAttributedString * resutlAtt = [[NSMutableAttributedString alloc]initWithAttributedString:attributedString];
    
    
    //枚举出所有的附件字符串
    [attributedString enumerateAttributesInRange:NSMakeRange(0, attributedString.length) options:NSAttributedStringEnumerationReverse usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        //key-NSAttachment
        //NSTextAttachment value类型
//        NSTextAttachment * textAtt = attrs[@NSAttachment];//从字典中取得那一个图片
//        if (textAtt)
//        {
//            UIImage * image = textAtt.image;
//            NSString * text = [copy_self stringFromImage:image];
//            [resutlAtt replaceCharactersInRange:range withString:text];
//
//        }
        
        
    }];
    
    
    return resutlAtt.string;
    
}

#pragma mark -时间转化年月日时分秒字符串
- (NSString *)getDateTimeHMSWithString:(NSDate *)date {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strTime = [formatter stringFromDate:date];
    return strTime;
}
- (NSString *)getDateTimeHMWithString:(NSDate *)date {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strTime = [formatter stringFromDate:date];
    return strTime;
}
#pragma mark -时间转化年月日字符串
- (NSString *)getDateTimeWithString:(NSDate *)date {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strTime = [formatter stringFromDate:date];
    return strTime;
}

#pragma mark -时间转化年月字符串
- (NSString *)getDateYYYYMMWithString:(NSDate *)date {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *strTime = [formatter stringFromDate:date];
    return strTime;
}
#pragma mark -时间转化月字符串
- (NSString *)getDateMMWithString:(NSDate *)date {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    NSString *strTime = [formatter stringFromDate:date];
    return strTime;
}

#pragma mark -时间转化年字符串
- (NSString *)getDateYYYYWithString:(NSDate *)date {
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    NSString *strTime = [formatter stringFromDate:date];
    return strTime;
}

//字符串转成ymd时间
-(NSDate *)getYMDStringWith:(NSString *)time {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date = [dateFormat dateFromString:time];
    return date;
}
//字符串转成ymdhm时间
-(NSDate *)getYMDHMStringWith:(NSString *)time {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date = [dateFormat dateFromString:time];
    return date;
}
//字符串转成ymdhmss时间
-(NSDate *)getYMDHMSSStringWith:(NSString *)time {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date = [dateFormat dateFromString:time];
    return date;
}
//根据两个字符串计算间隔天数
-(NSString *)getIntervalChunYMDStringWith:(NSString *)begintime withYMDEndTime:(NSString *)endtime {
    NSDate *endDate = [self getYMDStringWith:endtime];
    NSDate *benginDate = [self getYMDStringWith:begintime];
    NSTimeInterval timeint = [endDate timeIntervalSinceDate:benginDate];
    
    //开始时间和结束时间的中间相差的时间
    float days;
    days = ((float)timeint)/(3600*24);  //一天是24小时*3600秒
    NSString *dateValue = [NSString stringWithFormat:@"%.2f",days];
    return dateValue;
}

//根据两个字符串计算间隔天数
-(NSString *)getIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime {
    NSDate *endDate = [self getYMDHMStringWith:endtime];
    NSDate *benginDate = [self getYMDHMStringWith:begintime];
    NSTimeInterval timeint = [endDate timeIntervalSinceDate:benginDate];
    
    //开始时间和结束时间的中间相差的时间
    float days;
    days = ((float)timeint)/(3600*24);  //一天是24小时*3600秒
    NSString *dateValue = [NSString stringWithFormat:@"%.2f",days];
    return dateValue;
}

//根据两个字符串计算间隔分钟数
-(NSString *)getFenZhongIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime {
    NSDate *endDate = [self getYMDHMStringWith:endtime];
    NSDate *benginDate = [self getYMDHMStringWith:begintime];
    NSTimeInterval timeint = [endDate timeIntervalSinceDate:benginDate];
    
    //开始时间和结束时间的中间相差的时间
    int fenzhong;
    fenzhong = ((int)timeint)/(60);  //一天是24小时*3600秒
    NSString *dateValue = [NSString stringWithFormat:@"%i",fenzhong];
    return dateValue;
}
//根据两个字符串计算间隔小时数
-(NSString *)getXiaoShiIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime {
    NSDate *endDate = [self getYMDHMStringWith:endtime];
    NSDate *benginDate = [self getYMDHMStringWith:begintime];
    NSTimeInterval timeint = [endDate timeIntervalSinceDate:benginDate];
    
    //开始时间和结束时间的中间相差的时间
    int fenzhong;
    fenzhong = ((int)timeint)/(3600);  //一天是24小时*3600秒
    NSString *dateValue = [NSString stringWithFormat:@"%i",fenzhong];
    return dateValue;
}
//最后进行比较，将现在的时间与指定时间比较，如果没达到指定日期，返回-1，刚好是这一时间，返回0，否则返回1
- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        return 1;
    }
    else if (result == NSOrderedAscending){
        return -1;
    }
    return 0;
    
}
#pragma mark --- 将时间转换成时间戳

- (NSString *)getTimestampFromTime:(NSString *)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];// ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
//设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
 //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
 //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
     NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    
    NSDate *datenow = [formatter dateFromString:time];
//    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
//    NSString *nowtimeStr = [formatter stringFromDate:datenow];//----------将nsdate按formatter格式转成nsstring
//    NSLog(@"%@", nowtimeStr);

    // 时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
        
    return timeSp;
    
}

- (NSInteger )shijianTimeZhuanShijianchu:(NSString *)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];// ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
//设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
 //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
 //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
     NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    
    NSDate *datenow = [formatter dateFromString:time];
//    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
//    NSString *nowtimeStr = [formatter stringFromDate:datenow];//----------将nsdate按formatter格式转成nsstring
//    NSLog(@"%@", nowtimeStr);

        
    return (long)[datenow timeIntervalSince1970];
    
}

#pragma mark --- 将时间YYYY-MM-dd转换成时间戳

- (NSString *)getTimesYYYYMMddtampFromTime:(NSString *)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
     NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    
    NSDate *datenow = [formatter dateFromString:time];
//    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
//    NSString *nowtimeStr = [formatter stringFromDate:datenow];//----------将nsdate按formatter格式转成nsstring
//    NSLog(@"%@", nowtimeStr);

    // 时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
        
    return timeSp;
    
}
- (NSString *)getTimeAddDayAfter:(NSInteger )distance withbengin:(NSString *)nowtime{
    
    NSDate *nowDate = [self getYMDHMSSStringWith:nowtime];
//    NSInteger distance = 3; // 加的天数
    
//    [NSDate date];
//    NSTimeInterval  oneDay = 24 * 60 * 60 * 1;  //1天的长度
    // 加N天
//    NSDate *otherDate = [nowDate initWithTimeIntervalSinceNow: +oneDay* distance ];
    // 减去
    //theDate = [nowDate initWithTimeIntervalSinceNow: -oneDay*dis ];
    // 方法2
    NSDate *newDate = [nowDate dateByAddingTimeInterval:24 * 60 * 60  * distance];
    
    return [self getDateTimeHMSWithString:newDate];
}
    
//大量字符串在文本框中显示, 计算这些字符串在文本框中的高度
- (CGFloat )jisuanLabelHight:(CGFloat )fontSize cgsizeMake:(CGFloat )withLeng labelStr:(NSString *)str {
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGRect rect = [str boundingRectWithSize:CGSizeMake(withLeng, 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}


//1. 整形判断
- (BOOL)isPureInt:(NSString *)string{
    NSScanner * scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

//2.浮点形判断：
- (BOOL)isPureFloat:(NSString *)string{
    NSScanner * scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

//使用NSString的trimming方法。判断一个字符串中是否都是数字
- (BOOL)isPureNumandCharacters:(NSString *)string {
    NSCharacterSet *set = [NSCharacterSet decimalDigitCharacterSet];
    string = [string stringByTrimmingCharactersInSet:set];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

//判断是否全是空格
- (BOOL)isEmptyTong:(NSString *) str {
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
    if ([trimedString length] == 0) {
        return YES;
    } else {
        return NO;
    }
    
}

//判断是否正确的手机号码
- (BOOL)isValidMobile:(NSString *)mobile error:(NSError **)error;
{
    NSDictionary *errorUserInfo;
    
    if (mobile.length <= 0) {
        errorUserInfo = [NSDictionary dictionaryWithObject:@"请输入手机号"                                                                      forKey:NSLocalizedDescriptionKey];
//        *error = [NSError errorWithDomain:kCustomErrorDomain code:eCustomErrorCodeFailure userInfo:errorUserInfo];
        return NO;
    }
    
    if (mobile.length != 11) {
        errorUserInfo = [NSDictionary dictionaryWithObject:@"手机号长度只能是11位"                                                                      forKey:NSLocalizedDescriptionKey];
//        *error = [NSError errorWithDomain:kCustomErrorDomain code:eCustomErrorCodeFailure userInfo:errorUserInfo];
        return NO;
    } else {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        } else {
            errorUserInfo = [NSDictionary dictionaryWithObject:@"请输入正确的电话号码"                                                                      forKey:NSLocalizedDescriptionKey];
//            *error = [NSError errorWithDomain:kCustomErrorDomain code:eCustomErrorCodeFailure userInfo:errorUserInfo];
            return NO;
        }
    }
}

//判断是否正确的密码格式
- (BOOL)isValidPassword:(NSString *)password error:(NSError **)error
{
    NSDictionary *errorUserInfo;
    
    if (password.length < 6) {
        errorUserInfo = [NSDictionary dictionaryWithObject:@"密码长度必须六位以上" forKey:NSLocalizedDescriptionKey];
//        *error = [NSError errorWithDomain:kCustomErrorDomain code:eCustomErrorCodeFailure userInfo:errorUserInfo];
        return NO;
    }
    
    return YES;
}

//原价格和现在的价格
- (NSAttributedString *)recombinePrice:(NSString *)CNPrice withYuanSize:(NSInteger )yuanSize orderPrice:(NSString *)unitPrice withXianSize:(NSInteger )xianSize
{
    NSMutableAttributedString *mutableAttributeStr = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",unitPrice] attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:xianSize]}];
    
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",CNPrice] attributes:@{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:yuanSize]}];
    
    [mutableAttributeStr appendAttributedString:string1];
    [mutableAttributeStr appendAttributedString:string2];
    return mutableAttributeStr;
}

//获得这个月的天数
-(NSUInteger )getDayNumOfThisMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDate *firstDay;
//    [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&firstDay interval:nil forDate:[NSDate date]];
//    NSDateComponents *lastDateComponents = [calendar components:NSCalendarUnitMonth | NSCalendarUnitYear |NSCalendarUnitDay fromDate:firstDay];
    NSUInteger dayNumberOfMonth = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]].length;
//    NSInteger day = [lastDateComponents day];
//
//    [lastDateComponents setDay:day+dayNumberOfMonth-1];
//    NSDate *lastDay = [calendar dateFromComponents:lastDateComponents];
    return dayNumberOfMonth;
}

//颜色转图片
- (UIImage*) createImageWithColor: (UIColor*) color {
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


//设置上图下文的按钮
-(UIButton *)settingBarButtonItemImageName:(NSString *)image withTittle:(NSString *)str {
    UIButton *riview = [UIButton buttonWithType:UIButtonTypeSystem];
    riview.frame = CGRectMake(0, 0, 56, 40);
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    imageview.frame = CGRectMake(18, 0, 20, 20);
    UILabel *tittle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 56, 20)];
    tittle.text = str;
    tittle.font = [UIFont systemFontOfSize:13];
    tittle.textColor = [UIColor whiteColor];
    [riview addSubview:imageview];
    [riview addSubview:tittle];
    return riview;
}
-(NSString *)zhuzuZhuangjson:(NSArray *)jsonarr {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonarr options:0 error:nil];
    NSString *strJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return strJson;
}

-(NSString *)zidianzhuangjson:(NSDictionary *)jsondic {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsondic options:0 error:nil];
    NSString *strJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return strJson;
}

-(NSDictionary *)jsonzhuanzidianmap:(NSString *)json {
    NSError * error;
       NSData * m_data = [json  dataUsingEncoding:NSUTF8StringEncoding];
       NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:m_data options:NSJSONReadingMutableContainers error:&error];
       return dict;
}

-(NSArray *)jsonzhuanHuaArr:(NSString *)json {
    NSError * error;
          NSData * m_data = [json  dataUsingEncoding:NSUTF8StringEncoding];
          NSArray *arr = [NSJSONSerialization  JSONObjectWithData:m_data options:NSJSONReadingMutableContainers error:&error];
          return arr;
}
//
////看大图
//-(void)lookdatuaction:(UIButton *)sender {
//    if (sender.currentBackgroundImage) {
//        SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
//        browser.currentImageIndex = 0;
//        browser.sourceImagesContainerView = sender;
//        browser.imageCount = 1;
//        UIImage *img = sender.currentBackgroundImage;
//        [browser showDanOneBigImg:img];
//    }
//}
//
////根据图片路径看大图
//-(void)lookBigImgWithImgUrl:(NSString *)imgurl {
//    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
//    browser.currentImageIndex = 0;
//    browser.sourceImagesContainerView = self.view;
//    browser.imageCount = 1;
//    [browser showDanOneBigWithImgUrl:imgurl];
//}
//获取当前连接的wifi信息 @{@"BSSID":mac地址,@"SSID":wifi名}
- (NSDictionary *)currentWifiInfo {
    NSArray *ifs = CFBridgingRelease(CNCopySupportedInterfaces());
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    
    // 解析wifi信息
    NSDictionary *dic = (NSDictionary *)info;
    
    // 处理wifi mac地址 不足的位数补0 如:0c:4b:54:56:da:26
    NSString *BSSID = dic[@"BSSID"];
    if (BSSID.length > 0) {
        NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:dic];
        NSMutableArray *Bssids = [NSMutableArray arrayWithArray:[BSSID componentsSeparatedByString:@":"]];
        for (int i = 0; i < Bssids.count; i++) {
            NSString *str = Bssids[i];
            if (str.length == 1) {
                str = [NSString stringWithFormat:@"0%@",str];
                [Bssids replaceObjectAtIndex:i withObject:str];
            }
        }
        [dictM setObject:[Bssids componentsJoinedByString:@":"] forKey:@"BSSID"];
        dic = [dictM copy];
    }
    
    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
        return dic;
    }else {
        return @{
            @"BSSID":@"",
            @"SSID":@"",
            @"SSIDDATA":@""
        };
    }
}
//获取wifi名字
-(NSString *)getWifiInfo {
    id info = nil;
    NSString *wifiName = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        wifiName = info[@"SSID"];
//        NSString *str2 = info[@"BSSID"];
//        NSString *str3 = [[ NSString alloc] initWithData:info[@"SSIDDATA"] encoding:NSUTF8StringEncoding];
        MyLog(@"wifiName：%@",wifiName);
//        MyLog(@"BSSID：%@",str2);
//        MyLog(@"SSIDDATA：%@",str3);

    }
  
    return wifiName;
}
// 属性字符串
- (NSMutableAttributedString *)attributeText:(NSArray *)attrInfos
{
    NSString *fullStr = @"";
    for (NSDictionary *dic in attrInfos) {
        fullStr = [fullStr stringByAppendingString:dic[@"text"]];
    }
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:fullStr];
    for (NSDictionary *dict in attrInfos) {
        NSRange range = [fullStr rangeOfString:dict[@"text"]];
        [attrStr addAttributes:dict[@"attr"] range:range];
    }
    
    return attrStr;
}
//把回车键当做退出键盘的响应键  textView退出键盘的操作
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (UIView *)fview {
    if (!_fview) {
        _fview = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - SafeAreaBottomHeight - 60, KDeviceWith, 60 + SafeAreaBottomHeight)];
        _fview.backgroundColor = [UIColor whiteColor];
    }
    return _fview;
}

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
                 actions:(NSArray *_Nullable)actions {
    if (buttonTitles.count == 0) return;
    
    self.bottomBtnActions = actions;
    [self.view addSubview:self.fview];
    
    NSInteger btnCount = buttonTitles.count;
    CGFloat bothMargin = 15.0;
    CGFloat centerMargin = 10.0;
    CGFloat btnY = 10;
    CGFloat btnW = (KDeviceWith - bothMargin * 2.0 - centerMargin * (btnCount - 1))/btnCount;
    CGFloat btnH = 40.0;
    for (int i = 0; i < buttonTitles.count; i++) {
        NSString *btnTitle = buttonTitles[i];
        CGFloat btnX = bothMargin + (centerMargin + btnW) * i;
        UIButton *bottomBtn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        bottomBtn.tag = 2000 + i;
        bottomBtn.titleLabel.font = FONT(15);
        [bottomBtn setTitle:btnTitle forState:UIControlStateNormal];
        [bottomBtn addTarget:self action:@selector(bottomBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [bottomBtn setBackgroundColor:(btnBgColors.count > i ? btnBgColors[i] : nil)];
        [bottomBtn setTitleColor:(btnTColors.count > i ? btnTColors[i] : nil) forState:UIControlStateNormal];
        bottomBtn.layer.cornerRadius = 20;
        bottomBtn.layer.masksToBounds = YES;
        [self.fview addSubview:bottomBtn];
    }
}

// 底部按钮点击事件
- (void)bottomBtnAction:(UIButton *)btn {
    NSInteger index = btn.tag - 2000;
    if (self.bottomBtnActions.count > index) {
        void (^block)(void) = self.bottomBtnActions[index];
        if (block) {
            block();
        }
    }
}

// 修改底部按钮标题
- (void)setBottomBtnTitle:(NSString *_Nullable)title btnIndex:(NSInteger)btnIndex
{
    UIView *subV = [self.fview viewWithTag:2000 + btnIndex];
    if (subV && [subV isKindOfClass:[UIButton class]]) {
        [(UIButton *)subV setTitle:title forState:UIControlStateNormal];
    }
}

// 修改底部按钮标题颜色
- (void)setBottomBtnTitleColor:(UIColor *_Nullable)titleColor btnIndex:(NSInteger)btnIndex
{
    UIView *subV = [self.fview viewWithTag:2000 + btnIndex];
    if (subV && [subV isKindOfClass:[UIButton class]]) {
        [(UIButton *)subV setTitleColor:titleColor forState:UIControlStateNormal];
    }
}

// 修改底部按钮背景颜色
- (void)setBottomBtnBgColor:(UIColor *_Nullable)bgColor btnIndex:(NSInteger)btnIndex
{
    UIView *subV = [self.fview viewWithTag:2000 + btnIndex];
    if (subV && [subV isKindOfClass:[UIButton class]]) {
        subV.backgroundColor = bgColor;
    }
}

// 修改底部按钮图标
- (void)setBottomBtnIcon:(NSString *_Nullable)iconName btnIndex:(NSInteger)btnIndex
{
    UIView *subV = [self.fview viewWithTag:2000 + btnIndex];
    if (subV && [subV isKindOfClass:[UIButton class]]) {
        [(UIButton *)subV setImage:ImageNamed(iconName) forState:UIControlStateNormal];
        [(UIButton *)subV setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
}

// 获取底部指定按钮
- (UIButton *_Nullable)bottomBtnWithIndex:(NSInteger)btnIndex
{
    UIView *subV = [self.fview viewWithTag:2000 + btnIndex];
    return (UIButton *)subV;
}

// 设置底部按钮是否可以点击
- (void)setBottomBtnEnable:(BOOL)enable btnIndex:(NSInteger)btnIndex
{
    UIView *subV = [self.fview viewWithTag:2000 + btnIndex];
    if (subV && [subV isKindOfClass:[UIButton class]]) {
        [(UIButton *)subV setUserInteractionEnabled:enable];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
