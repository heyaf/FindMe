//
//  NSString+DataStr.m
//  FindMe
//
//  Created by mac on 2021/5/29.
//

#import "NSString+DataStr.h"

@implementation NSString (DataStr)

+(NSString *)getNowData{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:currentDate];
    return currentDateStr;
}

+(NSString *)getbeforeDataWithindex:(NSInteger) dayCount{
    NSDate * date = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //秒数
    NSTimeInterval time = dayCount * 24 * 60 * 60;
    //几天后就把"-"去掉
    NSDate *lastWeek = [date dateByAddingTimeInterval:-time];
    NSString *startDate =  [dateFormatter stringFromDate:lastWeek];
    return startDate;
}
@end
