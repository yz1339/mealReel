//
//  AppDelegate.m
//  mealReel
//
//  Created by Yating Zhan on 11/30/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize addingDish;
@synthesize currentImage;
@synthesize currentUser;
@synthesize textStorage;
@synthesize writing;
@synthesize recipe;
@synthesize restaurant;
@synthesize dishName;
@synthesize location;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    if (currentUser == NULL) {
        currentUser = [User alloc];
        currentUser.username = @"loki102";
        currentUser.avatar = [UIImage imageNamed:@"Tom-Hiddleston.jpg"];
        recipe = [NSMutableArray alloc];
//    } else {
//        NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
//        NSData* defaultData = [defaultUser objectForKey:@"loki102"];
//        currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:defaultData];
//    }
//
//    currentUser = [User alloc];
//    NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
//    NSData* defaultData = [defaultUser objectForKey:@"loki102"];
//    currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:defaultData];
//    
//    if (currentUser == NULL) {
//        currentUser.username = @"loki102";
//        currentUser.avatar = [UIImage imageNamed:@"Tom-Hiddleston.jpg"];
//    }
    
    //Or.....
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasUser"]) {
//        currentUser = [User alloc];
//        currentUser.username = @"loki102";
//        currentUser.avatar = [UIImage imageNamed:@"Tom-Hiddleston.jpg"];
//    } else {
//        NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
//        NSData* defaultData = [defaultUser objectForKey:@"loki102"];
//        currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:defaultData];
//    }
//
    return YES;
}

- (BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
//if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasUser"]) {
//    currentUser = [User alloc];
//    currentUser.username = @"loki102";
//    currentUser.avatar = [UIImage imageNamed:@"Tom-Hiddleston.jpg"];
//} else {
//    NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
//    NSData* defaultData = [defaultUser objectForKey:@"loki102"];
//    currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:defaultData];
//}

return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (BOOL)application:(UIApplication *)application
shouldSaveApplicationState:(NSCoder *)coder{
    //[coder encodeObject:currentUser forKey:@"loki102"];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    NSData* defaultData = [NSKeyedArchiver archivedDataWithRootObject:currentUser];
//    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject: defaultData forKey:@"loki102"];
//    [defaults setBool:YES forKey:@"hasUser"];
//    NSLog(@"has user? %d", [defaults boolForKey:@"hasUser"]);
//    [defaults synchronize];
}


@end
