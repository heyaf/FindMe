//
//  IOSCaiGouListModel.m
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import "IOSCaiGouListModel.h"

@implementation IOSCaiGouListModel
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"godsId":@"id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
