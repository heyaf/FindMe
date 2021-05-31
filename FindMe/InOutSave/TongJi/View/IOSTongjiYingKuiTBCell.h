//
//  IOSTongjiYingKuiTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class IOSTongji2M;

@interface IOSTongjiYingKuiTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainPicImageView;
@property (weak, nonatomic) IBOutlet UIView *xinghaoBGView;
@property (weak, nonatomic) IBOutlet UILabel *xinghaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThr;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UIImageView *tagImageV;


@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIView *bottomBgView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabelThr;
@property (nonatomic,strong) IOSTongji2M *tongji2M;

@end

NS_ASSUME_NONNULL_END
