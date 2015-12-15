//
//  AppDelegate.h
//  mealReel
//
//  Created by Yating Zhan on 11/30/15.
//  Copyright © 2015 Yating Zhan, Alexandra Serralta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@class WritingViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, retain) IBOutlet WritingViewController *writingViewController;
@property (strong, nonatomic) User* currentUser;


@end

