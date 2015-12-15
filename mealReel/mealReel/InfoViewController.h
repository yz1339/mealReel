//
//  InfoViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/3/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"
#import "WritingViewController.h"
#import "ViewController.h"

@interface InfoViewController : UIViewController

@property (strong, nonatomic) UIImage* currentImage;
@property (strong, nonatomic) Dish* currentDish;
@property (strong, nonatomic) NSMutableArray* album;



@end
