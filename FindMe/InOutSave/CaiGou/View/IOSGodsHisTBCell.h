//
//  IOSGodsHisTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import <UIKit/UIKit.h>
@class IOSGodsHisModel;
NS_ASSUME_NONNULL_BEGIN

@interface IOSGodsHisTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *userHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *PriceLabel;
@property (nonatomic,strong) CYCustomArcImageView *tagbgview;
@property (nonatomic,strong) UILabel *taglabel;
@property (nonatomic,strong) IOSGodsHisModel *hisModel;
@end

NS_ASSUME_NONNULL_END
