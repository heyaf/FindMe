//
//  IOSGodspinpaiM.m
//  FindMe
//
//  Created by mac on 2021/5/25.
//

#import "IOSGodspinpaiM.h"

@implementation IOSGodspinpaiM
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"pinpaiId":@"id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
