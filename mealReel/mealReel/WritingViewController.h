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

@interface WritingViewController : UIViewController

@property (strong, nonatomic) UIImage* currentImage;
@property (strong, nonatomic) Dish* currentDish;
@property (strong, nonatomic) NSMutableArray* album;

@end
