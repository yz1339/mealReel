//
//  RecipeViewController.h
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"
#import "AppDelegate.h"

@interface RecipeViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource> {
    AppDelegate *appDelegate;
}
@property (assign, nonatomic) NSInteger index;

@property (strong, nonatomic) Dish* currentDish;


@end
