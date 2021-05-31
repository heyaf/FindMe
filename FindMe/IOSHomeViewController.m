//
//  IOSHomeViewController.m
//  FindMe
//
//  Created by mac on 2021/5/19.
//

#import "IOSHomeViewController.h"
#import "IOSEnterHomeVC.h"
#import "IOSMessageAlertView.h"
#import "FMZWWishListVC.h"
@interface IOSHomeViewController ()

@end

@implementation IOSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = RGBA(235, 177, 42, 1);
    
    UIButton *IOSBtn = [UIButton buttonWithType:0];
    IOSBtn.frame = CGRectMake(100, 150, 100, 50);
    IOSBtn.backgroundColor = [UIColor yellowColor];
    [IOSBtn setTitle:@"进销存" forState:0];
    [IOSBtn setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn addTarget:self action:@selector(InOutSave) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn];
    
    UIButton *IOSBtn1 = [UIButton buttonWithType:0];
    IOSBtn1.frame = CGRectMake(100, 250, 100, 50);
    IOSBtn1.backgroundColor = [UIColor yellowColor];
    [IOSBtn1 setTitle:@"心愿单" forState:0];
    [IOSBtn1 setTitleColor:[UIColor blackColor] forState:0];
    [IOSBtn1 addTarget:self action:@selector(wishList) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:IOSBtn1];
    
    UIImageView *imageVIew  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400, KDeviceWith, 100)];
    UIImage * image =  ImageNamed(@"EMWLImageView3");
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height/3, image.size.width/3, image.size.height/3, image.size.width/3) resizingMode:UIImageResizingModeTile];
//    [self.view addSubview:imageVIew];
    imageVIew.image = [[UIImage imageNamed:@"EMWLImageView3"] resizableImageWithCapInsets:UIEdgeInsetsMake(50, 30, 20, 20) resizingMode:UIImageResizingModeStretch];
    
}

-(void)InOutSave{
    
        IOSEnterHomeVC *pushVC = [[IOSEnterHomeVC alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    
//    //有范围
//        NSString * helloStr = @"hello word";
//        NSMutableAttributedString * mString = [[NSMutableAttributedString alloc] initWithString: helloStr];
//        
//        //方式1
//        NSDictionary * dic = @{NSFontAttributeName :[UIFont fontWithName:@"Helvetica-Bold" size:20],NSForegroundColorAttributeName:[UIColor redColor],};
//        [mString addAttributes:dic range:NSMakeRange(0, 3)];
//      
//
//    IOSMessageAlertView *alertView = [[IOSMessageAlertView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight) type:IOSMesAlertTypeTV titleStr:mString cancleBtnName:@"取消" sureBtnName:@"确定" DetailBtnName:@"好的，知道了"];
//    [alertView show];

}
-(void)wishList{
    FMZWWishListVC *pushVC = [[FMZWWishListVC alloc] init];
    [self.navigationController pushViewController:pushVC animated:YES];
}

@end
