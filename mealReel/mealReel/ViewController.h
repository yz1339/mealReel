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

@interface ViewController : UIViewController {
    IBOutlet UIView *frameForCapture;
    IBOutlet UIImageView *imageView;
    AppDelegate *appDelegate;
}

@property (strong, nonatomic) NSMutableArray* album;
@property (strong, nonatomic) Dish* dish;
@property (strong, nonatomic) UIImage* currentImage;
@property BOOL imageTaken;

- (IBAction)takephoto:(id)sender;


@end

