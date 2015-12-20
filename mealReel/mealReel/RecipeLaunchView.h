//
//  RecipeLaunchView.h
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeViewController.h"
#import "SingleStepViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>


@interface RecipeLaunchView : UIViewController {
    AppDelegate* appDelegate;
}
@property (strong, nonatomic) UIPageViewController* recipeView;
@property (strong, nonatomic) NSString* stepContent;
@property (nonatomic, strong) NSString *dishName;
@property (nonatomic, strong) NSMutableArray* recipe;
@property (strong, nonatomic) PFUser* thisUser;
@property (strong, nonatomic) PFObject* currentDish;


@end
