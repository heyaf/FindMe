//
//  IOSManagerGodsTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class IOSGodsListM;
@interface IOSManagerGodsTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainPicImageView;
@property (weak, nonatomic) IBOutlet UIView *xinghaoBGView;
@property (weak, nonatomic) IBOutlet UILabel *xinghaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rukulabel;
@property (weak, nonatomic) IBOutlet UILabel *chukulabel;
@property (weak, nonatomic) IBOutlet UILabel *kucunlabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;


@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic,strong) IOSGodsListM *godsModel;
@end

NS_ASSUME_NONNULL_END
