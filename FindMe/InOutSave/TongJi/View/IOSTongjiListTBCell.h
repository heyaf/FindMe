//
//  IOSTongjiListTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSTongjiListTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainPicImageView;
@property (weak, nonatomic) IBOutlet UIView *xinghaoBGView;
@property (weak, nonatomic) IBOutlet UILabel *xinghaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThr;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIView *bottomBgView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabelThr;

@end

NS_ASSUME_NONNULL_END
