//
//  WritingViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 11/30/15.
//  Copyright © 2015 Alexandra Serralta, Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"
#import "ViewController.h"
#import "AppDelegate.h"

/*
 *Here is where the captured image is sent so that the user may write a caption, which is 
 *affixed to a dish object.
 */
@interface WritingViewController : UIViewController {
    AppDelegate *appDelegate;
    UITextView *captionTextView;
}



@property (retain,nonatomic) UITextView *captionTextView;

@property (strong, nonatomic) UIImage* currentImage;


@end
