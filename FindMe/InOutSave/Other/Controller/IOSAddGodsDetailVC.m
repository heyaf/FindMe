//
//  IOSAddGodsDetailVC.m
//  FindMe
//
//  Created by mac on 2021/5/25.
//
#import "NSTextAttachment+LMText.h"
#import "IOSAddGodsDetailVC.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface IOSAddGodsDetailVC ()<UITextViewDelegate,TZImagePickerControllerDelegate>
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic, strong)UILabel *placeHolderLabel;
@end

@implementation IOSAddGodsDetailVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:YES];
      [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[IQKeyboardManager sharedManager] setEnable:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商品详情";
    [self creatBottomView];
    [self setNavbutton];
    [self.view addSubview:self.textView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //监听键盘frame改变
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
//设置导航栏
-(void)setNavbutton{
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];

    [backButton setImage:[UIImage imageNamed:@"IOSBackChaHao"] forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem* leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}
-(UITextView *)textView{
    if (!_textView) {
        _textView=[[UITextView alloc]initWithFrame:CGRectMake(10, KEVNScreenTopStatusNaviHeight+10, KDeviceWith-20, KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-100-20)];
        [_textView setTextColor:[UIColor blackColor]];
        [_textView setFont:FONT(15)];
        _textView.scrollEnabled = YES;    // 不允许滚动
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.showsVerticalScrollIndicator = NO;
        _textView.tag = 555;
        _textView.returnKeyType = UIReturnKeyDone;
//        [_textView becomeFirstResponder];

        [_textView setDelegate:self];
        
        self.placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 150, 14)];
        self.placeHolderLabel.text = @"介绍一下此款商品吧~";
        self.placeHolderLabel.textColor = RGBA(152, 153, 153, 1);
        self.placeHolderLabel.font = FONT(15);
        self.placeHolderLabel.enabled = NO;
        [_textView addSubview:self.placeHolderLabel];

    }
    return _textView;
}
-(void)textViewDidChange:(UITextView *)textView{
    self.placeHolderLabel.alpha = 0;//开始编辑时
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)creatBottomView{
    UIView *bottomView = [[UIView alloc]  initWithFrame:CGRectMake(0, KDeviceHeight-100-KEVNScreenTabBarSafeBottomMargin, KDeviceWith, 100+KEVNScreenTabBarSafeBottomMargin)];
    bottomView.backgroundColor = RGBA(250, 250, 250, 1);

    [self.view addSubview:bottomView];

    CYCustomArcImageView *bgView = [[CYCustomArcImageView alloc] initWithFrame:CGRectMake(100, 10, KDeviceWith-120, 60)];
    bgView.borderTopLeftRadius = 10;
    bgView.borderTopRightRadius = 30;
    bgView.borderBottomLeftRadius = 10;
    bgView.borderBottomRightRadius = 10;
    [bottomView addSubview:bgView];
    UIButton *makeSureBtn = [UIButton buttonWithType:0];
    makeSureBtn.frame = CGRectMake(0, 0, KDeviceWith-120, 60);
    [makeSureBtn setTitle:@"保存" forState:0];
    makeSureBtn.backgroundColor =RGBA(46, 153, 164, 1);
    [bgView addSubview:makeSureBtn];
    [makeSureBtn addTarget:self action:@selector(makeSureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addImagebtn= [bottomView createButtonFrame:CGRectMake(20, 15, 70, 50) title:@"添加图片" textColor:[UIColor grayColor] font:FONT(12) image:ImageNamed(@"iOSChooseImage") target:self method:@selector(addImage)];
    [addImagebtn setImagePositionWithType:SSImagePositionTypeTop spacing:2];
    
    
}
-(void)makeSureBtnClicked{
    NSAttributedString *attributedString = _textView.attributedText;
    if (attributedString.length==0||[[self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return;
    }
    
    NSRange effectiveRange = NSMakeRange(0, 0);
    NSString *resultStr = [NSString string];
    
    while (effectiveRange.location + effectiveRange.length < attributedString.length) {
        NSDictionary *attributes = [attributedString attributesAtIndex:effectiveRange.location effectiveRange:&effectiveRange];
        NSTextAttachment *attachment = attributes[@"NSAttachment"];
        if (attachment) {
            if (attachment.attachmentType ==LMTextAttachmentTypeImage) {
                resultStr = [resultStr stringByAppendingString:[NSString stringWithFormat:@",,%@",attachment.userInfo]];
            }else{
            }
        }else{
            NSString *text = [[attributedString string] substringWithRange:effectiveRange];
            if (text.length>0) {
                resultStr = [resultStr stringByAppendingString:[NSString stringWithFormat:@",,%@",text]];

               
            }
        }
        effectiveRange = NSMakeRange(effectiveRange.location + effectiveRange.length, 0);
    }
    if (resultStr.length>0&&self.ResultBlock) {
        self.ResultBlock(resultStr);
    }
    
}
-(void)addImage{
    //图片
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
     imagePickerVc.barItemTextColor = [UIColor blackColor];
     [imagePickerVc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
     imagePickerVc.navigationBar.tintColor = [UIColor blackColor];
     imagePickerVc.naviBgColor = KAppColor;
     imagePickerVc.navigationBar.translucent = NO;
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = NO;   // 在内部显示拍视频按
    imagePickerVc.allowCameraLocation = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        self.placeHolderLabel.alpha = 0;//开始编辑时
        [self setTextImageArr:photos];
    }];
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
-(void)setTextImageArr:(NSArray *)imageArr{
    [self showHudInView:self.view hint:@"加载中"];

    kWeakSelf(self);
//    NSString *url = [NSString stringWithFormat:@"%@/s/api/companyCooperation/upload",AppServerURL];
    NSString *url = @"http://192.168.2.150:8083/d/api/template/uploadOthers";
    [[AFNetHelp shareAFNetworking] UpImageArrPOST:url parameters:nil constructingBodyWithDataArr:imageArr dataType:@"2" success:^(id responseObject) {
        [self hideHud];
        if ([AowString(responseObject[@"code"])  isEqualToString:@"1"] ){
            NSString *imageString = AowString(responseObject[@"data"]);
            NSArray *dateArr = [imageString componentsSeparatedByString:@","];
            for (int i =0;i<imageArr.count;i++) {
                UIImage *chooseImage = imageArr[i];
                NSTextAttachment* textAttachment = [[NSTextAttachment alloc] init];
                CGSize size = CGSizeZero;
                
                if (chooseImage.size.height>chooseImage.size.width) {
                    size = CGSizeMake(KDeviceWith-30, (KDeviceWith-30)/9*16+20);
                }else{
                    size = CGSizeMake(KDeviceWith-30, (KDeviceWith-30)/4*3+20);

                }

                UIImage *sizeImage = [self Resize:chooseImage toSize:size];
                textAttachment.image = [self getCornerRadius:sizeImage];
                textAttachment.userInfo = dateArr[i];
                textAttachment.bounds = CGRectMake(0, 0, size.width, size.height);
                NSAttributedString* imageAttachment = [NSAttributedString attributedStringWithAttachment:textAttachment];
                NSMutableAttributedString *attriStr = [weakself.textView.attributedText mutableCopy];
                textAttachment.attachmentType = LMTextAttachmentTypeImage;
                [attriStr insertAttributedString:imageAttachment atIndex:weakself.textView.selectedRange.location];
                NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:@"\n"];
                [attriStr appendAttributedString:attStr];
                
                [attriStr addAttributes:@{NSFontAttributeName: kFONT(15)} range:NSMakeRange(0, attriStr.length)];
                weakself.textView.attributedText = attriStr;
                [weakself.textView becomeFirstResponder];
            }
            
            
        }else {
            [self showHint:responseObject[@"msg"]];

        }
    } failure:^(NSError *error) {
        [self hideHud];
        [self showHint:@"稍后重试"];
    }];
}
//键盘将要弹出
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取键盘高度 keyboardHeight
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakself.textView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-20-keyboardHeight;
    }];
}

//键盘将要隐藏
- (void)keyboardWillHide:(NSNotification *)notification{
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakself.textView.yz_height = KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-100-20;

    } completion:^(BOOL finished) {
        
    }];
    


}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}
-(UIImage*)Resize:(UIImage*)sourceImage toSize:(CGSize)targetSize{
//  UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor){
            scaleFactor = widthFactor; // scale to fit height
        }else{
            scaleFactor = heightFactor; // scale to fit width
        }
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if (widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else{
            if (widthFactor < heightFactor){
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
        }
        }
        UIGraphicsBeginImageContext(targetSize); // this will crop
        CGRect thumbnailRect = CGRectZero;
        thumbnailRect.origin = thumbnailPoint;
        thumbnailRect.size.width  = scaledWidth;
        thumbnailRect.size.height = scaledHeight;
        [sourceImage drawInRect:thumbnailRect];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        if(newImage == nil){
            NSLog(@"could not scale image");
        }
        //pop the context to get back to the default
        UIGraphicsEndImageContext();
        
        return newImage;
}
- (UIImage *)getCornerRadius:(UIImage *)image
{
    //开启图片的上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGRect imageRect = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    //绘制圆角矩形
    [[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:5.0] addClip];
    //绘制图片
    [image drawInRect:imageRect];
    //从上下文中获取图片
    UIImage *finalimage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片的上下文
    UIGraphicsEndImageContext();
    return finalimage;
}
@end
