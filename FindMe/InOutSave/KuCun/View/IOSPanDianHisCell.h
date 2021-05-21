//
//  IOSPanDianHisCell.h
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSPanDianHisCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *pandianName;
@property (weak, nonatomic) IBOutlet UILabel *pandianTimerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userHeaderImV;
@property (weak, nonatomic) IBOutlet UILabel *usrNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIView *mainBgView;

@end

NS_ASSUME_NONNULL_END
