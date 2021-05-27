//
//  IOSPanDianHisCell.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianHisCell.h"
#import "IOSPadianShowModel.h"
@implementation IOSPanDianHisCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.mainBgView.backgroundColor = RGBA(250, 250, 250, 1);
}

-(void)setPandianshouModel:(IOSPadianShowModel *)pandianshouModel{
    _pandianshouModel = pandianshouModel;
    self.pandianName.text = pandianshouModel.checkName;
    self.pandianTimerLabel.text = kStringFormat(@"盘点日期:%@",pandianshouModel.createTime);
    
    [self.userHeaderImV sd_setImageWithURL:[NSURL URLWithString:kStringFormat(@"%@%@",AppServerURL,pandianshouModel.checkUserPhoto)] placeholderImage:ImageNamed(@"placeholder")];
    self.usrNameLabel.text = pandianshouModel.checkUserName;
    
    NSString *titleStr = kStringFormat(@"盘点%li件商品",pandianshouModel.num);
    NSString *pandianStr = kStringFormat(@"%li",pandianshouModel.num);
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(0, titleStr.length)];
    [attriStr addAttributes: @{NSFontAttributeName :kFONT(14),NSForegroundColorAttributeName:[UIColor blackColor],} range:NSMakeRange(3, pandianStr.length)];
    self.detailLabel.attributedText = attriStr;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
