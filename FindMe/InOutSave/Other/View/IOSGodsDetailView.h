//
//  IOSGodsDetailView.h
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class IOSGodsListM;
@interface IOSGodsDetailView : UIView
- (instancetype)initWithFrame:(CGRect)frame andModel:(IOSGodsListM *)model;
@end

NS_ASSUME_NONNULL_END
