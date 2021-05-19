//
//  CunHomeNongRenTableViewCell.h
//  CunCunBao
//
//  Created by 郑州聚义 on 2018/1/18.
//  Copyright © 2018年 郑州聚义. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChoosePhotoPlaceTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, copy) void(^lookMoreBlock)(void);
@property(nonatomic,strong) NSDictionary *modeldic;
@property (nonatomic,assign) NSInteger picMax;

@property (nonatomic, copy) void(^loadchooseImg)(ChoosePhotoPlaceTableViewCell *,NSArray *imgstr);

@property (nonatomic, copy) void(^deletImgblock)(ChoosePhotoPlaceTableViewCell *);

-(void)showImagData:(NSDictionary *)dic;

@end
