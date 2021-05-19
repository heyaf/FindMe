//
//  IOSHomeHeadCollectionReusableV.m
//  BatDog
//
//  Created by mac on 2021/5/18.
//  Copyright © 2021 郑州聚义. All rights reserved.
//

#import "IOSHomeHeadCollectionReusableV.h"
#import "TittleDetailModel.h"
@implementation IOSHomeHeadCollectionReusableV

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)showData:(TittleDetailModel *)model {
    self.name.text = [NSString stringWithFormat:@"%@", model.tittle];
}
@end
