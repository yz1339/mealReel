//
//  PictureViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/2/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"
#import "WritingViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>

/*
 *This is where all the dish information is displayed, along with the picture. This 
 *view is reachable through a user's albumView.
 */

@interface PictureViewController : UIViewController {
    AppDelegate *appDelegate;

}

@property (strong, nonatomic) PFObject* currentDish;

@end
