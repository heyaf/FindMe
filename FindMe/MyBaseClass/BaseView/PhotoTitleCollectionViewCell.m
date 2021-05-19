//
//  HotProductCollectionViewCell.m
//  GeneralShop
//
//  Created by 郑州聚义 on 17/2/16.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import "PhotoTitleCollectionViewCell.h"
#import "TittleDetailModel.h"
#import "UIImageView+WebCache.h"
@implementation PhotoTitleCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)showData:(TittleDetailModel *)model {

    NSString *str = [NSString stringWithFormat:@"%@%@", AppServerURL, model.subtittle];
    NSString *str2 = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    [self.photoView sd_setImageWithURL:[NSURL URLWithString: str2] placeholderImage:[UIImage imageNamed:@"placeholder"] completed:nil];
    self.nameLabel.text = [NSString stringWithFormat:@"%@", model.tittle];

}

- (UICollectionViewLayoutAttributes*)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize: layoutAttributes.size];
    CGRect cellFrame = layoutAttributes.frame;
    cellFrame.size.height= size.height;
    layoutAttributes.frame= cellFrame;
    return layoutAttributes;
}




@end
