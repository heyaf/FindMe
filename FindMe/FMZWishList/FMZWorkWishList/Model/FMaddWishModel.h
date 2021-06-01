//
//  FMaddWishModel.h
//  FindMe
//
//  Created by mac on 2021/6/1.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMaddWishModel : JSONModel
@property (nonatomic,strong) NSString *tagStr;
@property (nonatomic,strong) NSString *titleString;
@property (nonatomic,strong) NSString *detailStr;
@property (nonatomic,strong) NSString *placeholder;

@end

NS_ASSUME_NONNULL_END
