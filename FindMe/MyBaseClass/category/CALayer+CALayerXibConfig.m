//
//  CALayer+CALayerXibConfig.m
//  GeneralShop
//
//  Created by 郑州聚义 on 17/2/20.
//  Copyright © 2017年 郑州聚义. All rights reserved.
//

#import "CALayer+CALayerXibConfig.h"

@implementation CALayer (CALayerXibConfig)

- (void)setBorderUIColor:(UIColor *)borderUIColor {
    self.borderColor = borderUIColor.CGColor;
}

-(UIColor *)borderUIColor {
    return  [UIColor colorWithCGColor:self.borderColor];
}


@end
