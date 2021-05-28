//
//  IOSCaiGouHeaderTBCell.h
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOSCaiGouHeaderTBCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

//采购单详情头部
-(void)setcaigoudanHeadView:(NSDictionary *)dateDic;

//入库单详情头部
-(void)setinstoredanHeadView:(NSDictionary *)dateDic;
//盘点历史详情头部
-(void)setpandianHisHeadView:(NSDictionary *)dateDic;

//物资领用
-(void)setlingyongdanHeadView:(NSDictionary *)dateDic;

//新增回收
-(void)setaddhuishoudanHeadView:(NSDictionary *)dateDic;

@end

NS_ASSUME_NONNULL_END
