//
//  AppDelegate.h
//  mealReel
//
//  Created by Yating Zhan on 11/30/15.
//  Copyright © 2015 Yating Zhan, Alexandra Serralta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Dish.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) User* currentUser;
@property (strong, nonatomic) Dish* addingDish;
@property (strong, nonatomic) UIImage* currentImage;
@property (strong, readwrite, nonatomic) NSTextStorage* textStorage;


@end

