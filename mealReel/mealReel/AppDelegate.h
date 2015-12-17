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

/*
 *AppDelegate contains global variables, such as users, and dishes.
 */

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) User* currentUser;
@property (strong, nonatomic) User* otherUser;
@property (strong, nonatomic) Dish* addingDish;
@property (strong, nonatomic) UIImage* currentImage;
@property (strong, readwrite, nonatomic) NSTextStorage* textStorage;
@property (strong, nonatomic) NSString* writing;
@property (strong, nonatomic) NSMutableArray* recipe;
@property (strong, nonatomic) NSString* restaurant;
@property (strong, nonatomic) NSString* dishName;
@property (strong, nonatomic) NSString* location;


@end

