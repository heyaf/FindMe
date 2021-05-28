//
//  IOSPandianHisDetailTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class IOSPandianShouM;
@interface IOSPandianHisDetailTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThr;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@property (nonatomic,strong) IOSPandianShouM *listHisModel;
@end

NS_ASSUME_NONNULL_END
