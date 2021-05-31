//
//  EntersHomeCollectionViewCell.m
//  BatDog
//
//  Created by 郑州聚义 on 2019/3/21.
//  Copyright © 2019 郑州聚义. All rights reserved.
//

#import "EntersHomeCollectionViewCell.h"
#import "TittleDetailModel.h"

@implementation EntersHomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.backgroundColor = RGBA(250, 250, 250, 1);
    
}


-(void)showData:(TittleDetailModel *)model {
    self.name.text = [NSString stringWithFormat:@"%@", model.tittle];
    
    self.photoview.image = [UIImage imageNamed:model.detail];

}


@end
