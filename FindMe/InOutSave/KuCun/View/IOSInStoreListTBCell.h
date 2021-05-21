//
//  IOSInStoreListTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSInStoreListTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *mainBgView;
@property (weak, nonatomic) IBOutlet UILabel *TItleLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThr;
@property (weak, nonatomic) IBOutlet UIImageView *userImageV;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

NS_ASSUME_NONNULL_END
