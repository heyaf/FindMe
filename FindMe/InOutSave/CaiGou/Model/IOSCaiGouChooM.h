//
//  IOSCaiGouChooM.h
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface IOSCaiGouChooM : BaseModel
@property (nonatomic, strong) NSString *name ,*holderStr , *ChooseStr;
@property (nonatomic,assign) BOOL canInput;  //是否可以输入
@end

NS_ASSUME_NONNULL_END
