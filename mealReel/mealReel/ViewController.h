//
//  ViewController.h
//  mealReel
//
//  Created by Yating Zhan on 11/30/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Dish.h"
#import "AppDelegate.h"

/*
 * This is the view where the pictures are taking using Iphone's camera.
 */
@interface ViewController : UIViewController {
    IBOutlet UIView *frameForCapture;
    IBOutlet UIImageView *imageView;
    AppDelegate *appDelegate;
}



@property (strong, nonatomic) UIImage* currentImage;


- (IBAction)takephoto:(id)sender;


@end

