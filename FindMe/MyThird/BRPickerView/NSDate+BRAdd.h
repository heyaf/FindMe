//
//  NSDate+BRAdd.h
//  BRPickerViewDemo
//
//  Created by 任波 on 2017/8/11.
//  Copyright © 2017年 renb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BRAdd)
/** 获取当前的时间 */
+ (NSString *)currentDateString;
#pragma mark - 获取当前的年月日
+ (NSString *)currentHMSDateString;
#pragma mark - 获取当前年月日的时间
+ (NSString *)currentYMDDateString;
#pragma mark - 获取当前年月日时分的时间
+ (NSString *)currentYMDHMDateString;
#pragma mark - 获取当前年月
+ (NSString *)currentYYMMateString ;
#pragma mark - 获取当前的时间的后n天YMD
+ (NSString *)currentNextDateYMDWithFormatwith:(NSInteger )tian;

@end
