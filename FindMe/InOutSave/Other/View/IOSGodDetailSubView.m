//
//  IOSGodDetailSubView.m
//  FindMe
//
//  Created by mac on 2021/5/26.
//

#import "IOSGodDetailSubView.h"

@implementation IOSGodDetailSubView
- (instancetype)initWithFrame:(CGRect)frame withStr:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *markV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, 0.1)];
        [self addSubview:markV];
        NSArray *dataArr = [string componentsSeparatedByString:@",,"];
        for (int i = 0; i < dataArr.count; i++) {
           NSString *subString = dataArr[i];
            if (subString.length>0) {
                if ([subString containsString:@".png"]) {
                    
                    NSString *url = kStringFormat(@"%@%@",AppServerURL,subString);

                    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(15, markV.maxY+20, self.width-30, (self.width-30)/4*3)];
                    img.contentMode = UIViewContentModeScaleAspectFill;
                    img.clipsToBounds = YES;
                    
                    //img.image = kIMAGE_Name(@"placeSceImage");
     //               img.frame = CGRectMake(15, markV.maxY+20, self.width-30, (self.width-30)/9*16);

                    [img sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:ImageNamed(@"placeholder") completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                        if (image.size.height>image.size.width) {
                            img.frame = CGRectMake(15, markV.maxY+10, self.width-30, (self.width-30)/9*16);

                        }else{
                            img.frame = CGRectMake(15, markV.maxY+10, self.width-30, (self.width-30)/4*3);

                        }
                        
                    }];
                    
                   
                    [self addSubview:img];
                    markV = img;
                }
                
                else {
                    UILabel *detail = [self createLabelFrame:CGRectMake(10, markV.maxY+10, self.width-40, 100) textColor:[UIColor grayColor] font:FONT(14)];
                    detail.numberOfLines = 0;
                    detail.text = subString;
//
//                    //NSString *str = @"      ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????";
//
//                    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:subString];
//                    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//                    paragraphStyle.lineSpacing = 8.0; // ???????????????
//                    paragraphStyle.firstLineHeadIndent = 30;
//                    paragraphStyle.alignment = NSTextAlignmentJustified; //????????????????????????
//                    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedStr.length)];
//                    detail.attributedText = attributedStr;;
//                    detail.lineBreakMode = NSLineBreakByTruncatingTail;
//
//                    //[detail.text getSpaceLabelHeight:@"" withFont:nil withWidth:12 lineSpace:1];
                    [self addSubview:detail];
                    [detail sizeToFit];
                    markV = detail;
                }
            }
            }
           
        self.height = markV.maxY;
    }
    return self;

}

@end
