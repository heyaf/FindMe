//
//  AppDelegate.h
//  FindMe
//
//  Created by mac on 2021/5/18.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIView *statusBar;
//@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

//从app关闭时进入
@property (nonatomic, copy) NSString *toHomeTaskID;
@property (nonatomic, copy) NSString *toTasknodeId;
//type分类
@property (nonatomic, copy) NSString *toTaskType;



+(NSString *)CUSTOM_NOTIFICATION_DID_ENTER_BACKGROUND;
+(NSString *)CUSTOM_NOTIFICATION_DID_BECOME_ACTIVE;
+(NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_IN_ACTIVE;
+(NSString *)CUSTOM_NOTIFICATION_DID_RECEIVE_LOCAL_NOTIFICATION_STATE_ACTIVE;
+(NSString *)CUSTOM_NOTIFICATION_DID_FINISH_LAUNCHING_WITH_OPTIONS;

@end

