//
//  FMTagSelelctView.h
//  FindMe
//
//  Created by mac on 2021/6/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMTagSelelctView : UIView
-(id)initWithFrame:(CGRect)frame withData:(NSArray *)arr selelctArr:(NSArray *)selectArr;
@property (nonatomic,strong) NSMutableArray *selelctedArr;

@end

NS_ASSUME_NONNULL_END
