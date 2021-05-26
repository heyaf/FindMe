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
//                    //NSString *str = @"      清明上河园是按照北宋著名画家张择端的《清明上河图》建造而成的，里面好看的民俗表演有很多，但我觉得最精彩的是在马场表演的岳飞剑挑小梁王，喷火表演，还有宋代的杂技表演等。还有大门口的乞丐和被押送的囚犯，以及王小姐的抛绣球，都会让你仿佛置身于宋朝。";
//
//                    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:subString];
//                    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//                    paragraphStyle.lineSpacing = 8.0; // 设置行间距
//                    paragraphStyle.firstLineHeadIndent = 30;
//                    paragraphStyle.alignment = NSTextAlignmentJustified; //设置两端对齐显示
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
