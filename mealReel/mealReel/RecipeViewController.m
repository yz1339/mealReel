//
//  RecipeViewController.m
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "RecipeViewController.h"

@implementation RecipeViewController {
    NSMutableArray *stepViewControllers;
}

@synthesize currentDish;
@synthesize index;


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    appDelegate = [[UIApplication sharedApplication] delegate];
//    self.delegate = self;
//    self.dataSource = self;
//    NSLog(@"current dish writes::: %@", currentDish.writing);
//    [self didMoveToParentViewController:self];
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    for (int i = 0; i < currentDish.recipe.count; i++) {
//        NSString* identifier = [[NSString alloc] initWithFormat:@"step_%i", i];
//        UIViewController *currentStepView = [mainStoryboard instantiateViewControllerWithIdentifier:identifier];
//        [stepViewControllers addObject:currentStepView];
//    }
//    self.index = 0;
//
//    [self setViewControllers:@[[stepViewControllers objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
//}
//
//- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
//    return stepViewControllers[index];
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
//    
//    NSUInteger index = self.index;
//    
//    if (index == 0) { return nil; }
//    
//    // Decrease the index by 1 to return
//    index--;
//    return [self viewControllerAtIndex:index];
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    
//    NSUInteger index = self.index;
//    index++;
//    if (index > [stepViewControllers count]) { return nil; }
//    
//    return [self viewControllerAtIndex:index];
//}
//
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
//    // The number of items reflected in the page indicator.
//    return [stepViewControllers count];
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    // The selected item reflected in the page indicator.
//    return 0;
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


@end
