//
//  IOSGodsDetailHeaderView.h
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSGodsDetailHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *userHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *godsNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *godsTimerLabel;
@property (weak, nonatomic) IBOutlet UILabel *godsStateLAbel;
@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;

@end

NS_ASSUME_NONNULL_END
