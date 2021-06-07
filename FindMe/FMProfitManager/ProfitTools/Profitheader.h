





#import <YYModel/YYModel.h>


//RGB格式
#define kRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kFONT(f)            [UIFont systemFontOfSize:(f)]
#define kBOLDFONT(f)        [UIFont boldSystemFontOfSize:(f)]

//color
#define FMTextColor RGBA(46, 153, 146, 1)
#define kWhiteColor [UIColor whiteColor]
#define knorBlackColor [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1]
#define kBlackColor [UIColor blackColor]

//View 圆角和加边框
#define kViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define kViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//字符串拼接
#define kStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
