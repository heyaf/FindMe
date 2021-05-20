//
//  IOSGodsDetailHeaderView.m
//  FindMe
//
//  Created by mac on 2021/5/20.
//

#import "IOSGodsDetailHeaderView.h"

@implementation IOSGodsDetailHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"IOSGodsDetailHeaderView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    return self;
}
-(void)resetSubView{
    self.userHeaderImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.userHeaderImageView.layer.masksToBounds = YES;
    self.userHeaderImageView.layer.cornerRadius = 10;
}

@end
