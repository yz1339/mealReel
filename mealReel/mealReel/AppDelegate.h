//
//  AppDelegate.h
//  mealReel
//
//  Created by Yating Zhan on 11/30/15.
//  Copyright © 2015 Yating Zhan, Alexandra Serralta. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WritingViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet WritingViewController *writingViewController;

@end

