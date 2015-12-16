//
//  PictureViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/2/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"
#import "WritingViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface PictureViewController : UIViewController {
    AppDelegate *appDelegate;

}

@property (strong, nonatomic) Dish* currentDish;

@end
