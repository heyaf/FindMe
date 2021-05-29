//
//  NSString+DataStr.h
//  FindMe
//
//  Created by mac on 2021/5/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DataStr)
//获取当前日期
+(NSString *)getNowData;
//获取若干天前的日期
+(NSString *)getbeforeDataWithindex:(NSInteger) dayCount;
@end

NS_ASSUME_NONNULL_END
