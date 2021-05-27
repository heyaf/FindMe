//
//  IOSGodsHisModel.m
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import "IOSGodsHisModel.h"

@implementation IOSGodsHisModel
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"godsId":@"id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
