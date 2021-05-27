//
//  IOSPandianListVC.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPandianListVC.h"
#import "IOSPanDianHisVC.h"
@interface IOSPandianListVC ()

@end

@implementation IOSPandianListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavbutton];
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    backButton.titleLabel.font = FONT(18);
    backButton.frame = CGRectMake(0, 0, 60,35);
    [backButton setTitle:@"盘点单" forState:0];
    [backButton setTitleColor:[UIColor blackColor] forState:0];

    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [rightBtn setImage:[UIImage imageNamed:@"IOSDengDai"] forState:UIControlStateNormal];


    rightBtn.frame = CGRectMake(0, 0, 35,35);

    [rightBtn addTarget:self action:@selector(pandianHistory) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];

    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pandianHistory{
    IOSPanDianHisVC *pushVC = [[IOSPanDianHisVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}
@end
