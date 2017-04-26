//
//  AppDelegate.m
//  SouqPriceTracker
//
//  Created by MAC on 4/12/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    [self setupNotification];
    //SouqDataBase
  CREATE_AND_CHECK_DATABASE_TO_DOCUMENTS;
    //Monitoring Network
[[AFNetworkReachabilityManager sharedManager] startMonitoring];
//Navigation Bar
    [self setAppearnce];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - setUpNotification Method
-(void) setupNotification {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }}


#pragma mark-push Notification
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"Did Register for Remote Notifications with Device Token (%@)", deviceToken);
    
    NSString *deviceTokenString = [[[[deviceToken description]
                                     stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                    stringByReplacingOccurrencesOfString: @">" withString: @""]
                                   stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    
}

/*!
 @version 1.0
 @author Esraa Aldeeb
 @brief this method is responsible for return error when the registration is failed.
 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Did Fail to Register for Remote Notifications");
    NSLog(@"%@, %@", error, error.localizedDescription);
}
/*!
 @version 1.0
 @author Esraa Aldeeb
 @brief this method is responsible to do Action after the notification  was recevied  device.
 */

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    UIApplicationState state = [application applicationState];
    switch (state) {
        case UIApplicationStateActive:
            //app is in foreground
            //the push is in your control
            NSLog(@"App in Active State");
            break;
        case UIApplicationStateInactive:
            //app is in background:
            //iOS is responsible for displaying push alerts, banner etc..
            NSLog(@"App in InActive State");
            break;
        case UIApplicationStateBackground:
            NSLog(@"App in Background State");
            break;

            
        default:
            NSLog(@"application state: Other!!");

            break;
    }
    
       }

- (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePathString {
    NSURL *fileURL = [NSURL fileURLWithPath:filePathString];
    
    assert([[NSFileManager defaultManager]
            fileExistsAtPath: [fileURL path]]);
    
    NSError *error = nil;
    
    BOOL success = [fileURL setResourceValue:[NSNumber numberWithBool:YES]
                                      forKey:NSURLIsExcludedFromBackupKey
                                       error:&error];
    return success;
}


-(void)setAppearnce{
    
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    [[UIBarButtonItem appearance]setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
    //                                                         forBarMetrics:UIBarMetricsDefault];
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}
@end
