//
//  FMHouseMesChooseTBCell.m
//  FindMe
//
//  Created by mac on 2021/6/4.
//


#import "FMHouseMesChooseTBCell.h"
@interface FMHouseMesChooseTBCell()
@property (nonatomic,strong) NSMutableArray *btnArr;
@end

@implementation FMHouseMesChooseTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.btnArr = [NSMutableArray arrayWithCapacity:0];
    self.backgroundColor = RGBA(245, 245, 245, 1);
}
-(void)creatChooseBtnArr:(NSArray *)btnArr isSingleChoose:(BOOL)singleChoose{
    CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 15;//用来控制button距离父视图的高
    for (int i = 0; i < btnArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 201 + i;
//        button.backgroundColor = RGBA(250, 250, 250,1);
        [button addTarget:self action:@selector(starthandleClick:) forControlEvents:UIControlEventTouchUpInside];
        //根据计算文字的大小
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        CGFloat length = [btnArr[i] boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        //为button赋值
        [button setTitle:btnArr[i] forState:UIControlStateNormal];
        //设置button的frame
        button.frame = CGRectMake(15 + w, h, length + 40 , 25);
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if(15+ w + length +40> KDeviceWith-30){
            w = 0; //换行时将w置为0
            h = h + button.frame.size.height + 15;//距离父视图也变化
            button.frame = CGRectMake(15 + w, h, length + 40, 25);//重设button的frame
        }
        [button setImage:ImageNamed(@"UISDuihao") forState:0];
        [button setImage:ImageNamed(@"IOSDUihao") forState:UIControlStateSelected];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, length+15)];
        w = button.frame.size.width + button.frame.origin.x;
        [self.bottomView addSubview:button];
//        ViewRadius(button, 8);
        [button setTitleColor:RGBA(53, 53, 53,1) forState:0];
        button.titleLabel.font= kFONT(14);
        [self.btnArr addObject:button];

        
    }
    self.bottomBgvIew.constant = h+25;
}
-(void)starthandleClick:(UIButton *)buton{
    buton.selected = !buton.isSelected;
}
-(void)addStartSubViews{
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
