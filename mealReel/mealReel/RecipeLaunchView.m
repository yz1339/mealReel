//
//  RecipeLaunchView.m
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "RecipeLaunchView.h"
#import "PictureViewController.h"


@interface RecipeLaunchView () <UIPageViewControllerDataSource>

@end

@implementation RecipeLaunchView

@synthesize dishName;
//@synthesize itemIndex;
@synthesize stepContent;
@synthesize recipeView;
@synthesize recipe;

-(void) viewDidLoad {
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    //self.recipe = appDelegate.addingDish.recipe;
    //self.dishName = appDelegate.addingDish.dishName;
    dishName = @"haha";
    recipe = [[NSMutableArray alloc]initWithObjects:@"skdjf",@"dsfjahk", nil];
    [self createPageViewController];
    [self setupPageControl];
    
}

- (void) createPageViewController
{
    UIPageViewController *recipeViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"RecipeView"];
    recipeViewController.dataSource = self;
    
    if([self.recipe count])
    {
        NSArray *startingViewControllers = @[[self viewControllerAtIndex:0]];
        [recipeViewController setViewControllers: startingViewControllers
                                       direction: UIPageViewControllerNavigationDirectionForward
                                        animated: NO
                                      completion: nil];
    }
    
    self.recipeView = recipeViewController;
    [self addChildViewController: self.recipeView];
    [self.view addSubview: self.recipeView.view];
    [self.recipeView didMoveToParentViewController: self];
}

- (void) setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
    [[UIPageControl appearance] setBackgroundColor: [UIColor darkGrayColor]];
}

#pragma mark -
#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((SingleStepViewController*) viewController).itemIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((SingleStepViewController*) viewController).itemIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [recipe count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
- (SingleStepViewController *) viewControllerAtIndex: (NSUInteger) itemIndex
{
    if (itemIndex < [recipe count])
    {
        SingleStepViewController *stepController = [self.storyboard instantiateViewControllerWithIdentifier: @"SingleStepView"];
        stepController.itemIndex = itemIndex;
        stepController.dishName = dishName;
        stepController.stepContent = [recipe objectAtIndex:itemIndex];
        return stepController;
    }
    
    return nil;
}

- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
{
    return [recipe count];
}

- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
{
    return 0;
}


@end
