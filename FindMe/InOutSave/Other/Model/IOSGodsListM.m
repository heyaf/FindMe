//
//  IOSGodsListM.m
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import "IOSGodsListM.h"

@implementation IOSGodsListM
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"GodsId":@"id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end
