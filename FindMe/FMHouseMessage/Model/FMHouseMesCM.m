//
//  FMHouseMesCM.m
//  FindMe
//
//  Created by mac on 2021/6/3.
//

#import "FMHouseMesCM.h"
@implementation OrderModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"houseMessId":@"id"}];
}
@end
@implementation FMHouseMesCM
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"houseMessId":@"id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
@end

