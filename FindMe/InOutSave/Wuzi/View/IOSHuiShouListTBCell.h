//
//  IOSHuiShouListTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import <UIKit/UIKit.h>
@class IOSChoHuishouM;
NS_ASSUME_NONNULL_BEGIN

@interface IOSHuiShouListTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selelctButton;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *LabelTwo;
@property (weak, nonatomic) IBOutlet UIImageView *UserHeaderImageV;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *StateLabel;

@property (nonatomic,strong) IOSChoHuishouM *huishouM;
@end

NS_ASSUME_NONNULL_END
