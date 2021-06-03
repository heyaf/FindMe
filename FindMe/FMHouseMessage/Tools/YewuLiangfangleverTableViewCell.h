//
//  CunHomeNongRenTableViewCell.h
//  CunCunBao
//
//  Created by 郑州聚义 on 2018/1/18.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TittleDetailModel;
@class FMHouseMessM;
@interface YewuLiangfangleverTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *namelabel;

@property (weak, nonatomic) IBOutlet UILabel *detaillabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, copy) void(^lookMoreBlock)(void);
@property(nonatomic,strong) NSMutableArray *imagarr;
@property (nonatomic,assign) NSInteger picMax;

@property (nonatomic, copy) void(^loadchooseImg)(YewuLiangfangleverTableViewCell *,NSArray *imgstr);

@property (nonatomic, copy) void(^deletImgblock)(YewuLiangfangleverTableViewCell *, NSString *str);

-(void)showImagData:(FMHouseMessM *)model;

@end
