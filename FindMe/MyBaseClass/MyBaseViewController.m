//
//  MyBaseViewController.m
//  LedRoad
//
//  Created by 郑州聚义 on 16/8/8.
//  Copyright © 2016年 郑州聚义. All rights reserved.
//

#import "MyBaseViewController.h"
//#import "WRNavigationBar.h"

@interface MyBaseViewController ()

@end

@implementation MyBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self wr_setNavBarBarTintColor:[UIColor whiteColor]];
//    //    // 设置导航栏按钮和标题颜色
//    [self wr_setNavBarTitleColor:[UIColor blackColor]];
    if (self.navigationController) {

        if (self.navigationController.viewControllers.count > 1) {

            UIBarButtonItem *leftTem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popViewControllerAnimated:)];
            [self.navigationItem setLeftBarButtonItem:leftTem];
        }
      
    }
    
}
//设置导航栏
-(void)setNavBackStr:(NSString *)backTitle{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:backTitle forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
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

//  判断用户输入的密码是否符合规范，符合规范的密码要求：
//    1. 长度大于6位
//    2. 密码中必须同时包含数字和字母
-(BOOL)judgePassWordLegal:(NSString *)pass{
    BOOL result = false;
    if ([pass length] >= 6){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
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
//根据两个字符串计算间隔天数
-(NSString *)getIntervalYMDStringWith:(NSString *)begintime withEndTime:(NSString *)endtime {
    NSDate *endDate = [self getYMDStringWith:endtime];
    NSDate *benginDate = [self getYMDStringWith:begintime];
    NSTimeInterval timeint = [endDate timeIntervalSinceDate:benginDate];
    
    //开始时间和结束时间的中间相差的时间
    int days;
    days = ((int)timeint)/(3600*24);  //一天是24小时*3600秒
    NSString *dateValue = [NSString stringWithFormat:@"%i",days];
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
- (BOOL)isValidMobile:(NSString *)mobile error:(NSError **)error{
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
// 判断字符串是否为空或者空格键
-(BOOL)isBlankString:(NSString *)string
{
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
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
//将数组转换成json格式字符串
-(NSString *)gs_jsonStringCompactFormatForNSArray:(NSArray *)arrJson {
    if (![arrJson isKindOfClass:[NSArray class]] || ![NSJSONSerialization isValidJSONObject:arrJson]) {
        return nil;

    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrJson options:0 error:nil];

    NSString *strJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    return strJson;

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
