//
//  NSDate+BRAdd.m
//  BRPickerViewDemo
//
//  Created by 任波 on 2017/8/11.
//  Copyright © 2017年 renb. All rights reserved.
//

#import "NSDate+BRAdd.h"

@implementation NSDate (BRAdd)

#pragma mark - 获取当前的时间
+ (NSString *)currentDateString {
    return [self currentDateStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}
#pragma mark - 获取当前的时分秒
+ (NSString *)currentHMSDateString {
    return [self currentDateStringWithFormat:@"HH:mm:ss"];
}
#pragma mark - 获取当前年月日的时间
+ (NSString *)currentYMDDateString {
    return [self currentDateStringWithFormat:@"yyyy-MM-dd"];
}
#pragma mark - 获取当前年月日时分的时间
+ (NSString *)currentYMDHMDateString {
    return [self currentDateStringWithFormat:@"yyyy-MM-dd HH:mm"];
}
#pragma mark - 获取当前年月
+ (NSString *)currentYYMMateString {
    return [self currentDateStringWithFormat:@"yyyy-MM"];
}
#pragma mark - 按指定格式获取当前的时间
+ (NSString *)currentDateStringWithFormat:(NSString *)formatterStr {
    // 获取系统当前时间
    NSDate *currentDate = [NSDate date];
    // 用于格式化NSDate对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置格式：yyyy-MM-dd HH:mm:ss
    formatter.dateFormat = formatterStr;
    // 将 NSDate 按 formatter格式 转成 NSString
    NSString *currentDateStr = [formatter stringFromDate:currentDate];
    // 输出currentDateStr
    return currentDateStr;
}

#pragma mark - 获取当前的时间的后n天YMD
+ (NSString *)currentNextDateYMDWithFormatwith:(NSInteger )tian{
    NSDate *date = [NSDate date];//当前时间
    
    NSDate *nextDay = [NSDate dateWithTimeInterval:24*60*60*tian sinceDate:date];//后n天
    
    // 用于格式化NSDate对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置格式：yyyy-MM-dd HH:mm:ss
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 将 NSDate 按 formatter格式 转成 NSString
    NSString *currentDateStr = [formatter stringFromDate:nextDay];
//    MyLog(@"%@", currentDateStr);
    return currentDateStr;
}


@end
