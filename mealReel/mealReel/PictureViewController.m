//
//  PictureViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/2/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import "PictureViewController.h"
#import "CommentViewController.h"
#import "AlbumViewController.h"
#import "Dish.h"
#import "RecipeLaunchView.h"
@interface PictureViewController () <UIPageViewControllerDataSource>

@property bool isFlipped;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pictureTap;
@property (weak, nonatomic) IBOutlet UIImageView *pictureFrame;
@property (weak, nonatomic) IBOutlet UIImageView *pictureBack;

@property (retain,nonatomic) UIView *containerView;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) IBOutlet UIButton *usernameButton;
@property (weak, nonatomic) IBOutlet UIButton *viewRecipeButton;
@property (strong, nonatomic) UIPageViewController* recipeViewController;
@property (retain, nonatomic) UIImageView *currentImageView;

@property (retain, nonatomic) UILabel *dishName;


@end

@implementation PictureViewController


@synthesize currentDish;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Do any additional setup after loading the view.
    
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    [_avatarImageView setImage: appDelegate.currentUser.avatar];
    [_usernameButton setTitle:appDelegate.currentUser.username forState:UIControlStateNormal];
   
    appDelegate.addingDish = currentDish;
    
    UIImage *currentImage;
    PFFile *currentFile = [currentDish objectForKey:@"dishImage2"];
    currentImage = [UIImage imageWithData: [currentFile getData]];
    //UIImage* currentImage = currentDish.dishImage;

    
    CGRect picBound = _pictureBack.bounds;
    picBound.size.height = 256;
    picBound.size.width = 248.5;
    
   _currentImageView = [[UIImageView alloc] initWithImage:currentImage];
    [_currentImageView setFrame:picBound];
    
    CGRect newFrame = _pictureBack.bounds;
    newFrame.size.height = 100;
    newFrame.size.width = 200;
    
  
    
    _containerView = [[UIView alloc] initWithFrame:_pictureFrame.bounds];
    _containerView.center = CGPointMake(160,300);
    UITextView *captionTextView = [[UITextView alloc] initWithFrame:newFrame];
    UILabel *restaurant = [[UILabel alloc]initWithFrame:newFrame];
    UILabel *addressText = [[UILabel alloc]initWithFrame:newFrame];
    UILabel *restaurantName = [[UILabel alloc]initWithFrame:newFrame];
    UILabel *address = [[UILabel alloc]initWithFrame:newFrame];
    _dishName = [[UILabel alloc]initWithFrame:newFrame];
    
    
    [self.view addSubview:_containerView];
    
    //this centers the two objects
    _pictureFrame.center = CGPointMake(_containerView.frame.size.width  / 2,
                                       (_containerView.frame.size.height / 2)+10);
    _pictureBack.center = CGPointMake(_containerView.frame.size.width  / 2,
                                      _containerView.frame.size.height / 2);
    captionTextView.center = CGPointMake(_pictureBack.frame.size.width  / 2,
                                         (_pictureBack.frame.size.height / 2)-60);
    
    
    restaurant.center = CGPointMake((_pictureBack.frame.size.width  / 2),
                                        (_pictureBack.frame.size.height / 2)+30);

    restaurantName.center = CGPointMake((_pictureBack.frame.size.width  / 2),
                                         (_pictureBack.frame.size.height / 2)+50);
    addressText.center = CGPointMake((_pictureBack.frame.size.width  / 2),
                                     (_pictureBack.frame.size.height / 2)+90);
    address.center = CGPointMake((_pictureBack.frame.size.width  / 2),
                                        (_pictureBack.frame.size.height / 2)+110);
    _dishName.center = CGPointMake((_pictureBack.frame.size.width  / 2)+10,
                                      (  _pictureBack.frame.size.height / 2)+120);
    _currentImageView.center = CGPointMake((_pictureFrame.frame.size.width  / 2 ) + 1.5,
                                           (_pictureFrame.frame.size.height / 2) - 24);
    
    
    
    restaurant.text = @"Restaurant:";
    [restaurant setFont:[UIFont fontWithName:@"Menlo-Bold" size:12]];
    restaurant.textAlignment = NSTextAlignmentCenter;
    
    addressText.text = @"Address:";
    addressText.textAlignment = NSTextAlignmentCenter;
     [addressText setFont:[UIFont fontWithName:@"Menlo-Bold" size:12]];
    
    //_dishName.text = currentDish.dishName;
    _dishName.text = [currentDish objectForKey:@"dishName"];
    [_dishName setFont:[UIFont fontWithName:@"Menlo" size:12]];
    _dishName.textAlignment = NSTextAlignmentCenter;
    
    
    //captionTextView.text = currentDish.textStorage.string;
     captionTextView.text = [currentDish objectForKey:@"caption"];
    [captionTextView setFont:[UIFont fontWithName:@"Menlo" size:15]];
    
    //restaurantName.text = currentDish.restaurant;
     restaurantName.text = [currentDish objectForKey:@"restaurant"];
    [restaurantName setFont:[UIFont fontWithName:@"Menlo" size:12]];
    restaurantName.textAlignment = NSTextAlignmentCenter;
    
    //address.text = currentDish.address;
    address.text = [currentDish objectForKey:@"address"];
    [address setFont:[UIFont fontWithName:@"Menlo" size:12]];
    address.textAlignment = NSTextAlignmentCenter;
    
    //this adds them to our containerView
    [_containerView addSubview:_pictureBack];
    [_pictureBack addSubview: captionTextView];
    [_containerView addSubview:_pictureFrame];
    [_pictureBack addSubview:restaurantName];
    [_pictureBack addSubview:address];
    [_pictureBack addSubview:restaurant];
    [_pictureBack addSubview:addressText];
    [_containerView addSubview:_currentImageView];
    [_containerView addSubview:_dishName];
    _isFlipped = NO;
    _pictureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [_containerView addGestureRecognizer:_pictureTap];
  
    
    //[_pictureTap release];

}

-(void) viewDidAppear {
    [self.viewRecipeButton setEnabled:YES];
}


- (void)handleTap:(UITapGestureRecognizer *)sender {
    
    //_pictureBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pictureBack.png"]];
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView transitionWithView:_containerView
                          duration:1
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            
                            if (!_isFlipped) {
                                /*
                                 [_pictureBack setHidden:YES];
                                 [_containerView addSubview:_pictureFrame];
                                 */
                                [_dishName setHidden: YES];
                                [_currentImageView setHidden:YES];
                                [_pictureFrame setHidden:YES];
                                [_pictureBack setHidden: NO];
                                //[_containerView addSubview:_pictureBack];
                                
                                _isFlipped = YES;
                            } else {
                                [_dishName setHidden: NO];
                                [_currentImageView setHidden:NO];
                                [_pictureFrame setHidden:NO];
                                [_pictureBack setHidden:YES];
                                // [_pictureBack removeFromSuperview]; //or hide it.
                                _isFlipped = NO;
                            }
                            
                        } completion:nil];
        
        
        
        
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)commentsPressed:(id)sender {
    CommentViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CommentView"];
    [self presentViewController:next animated:YES completion:NULL];
}

- (IBAction)returnPressed:(id)sender {
    AlbumViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AlbumView"];
    //[self.view removeFromSuperview];
    [self presentViewController:next animated:YES completion:NULL];
}


- (IBAction)seeRecipe:(id)sender {
    //[self.view setHidden:YES];
//    [self createPageViewController];
//    [self setupPageControl];
    
    
    //RecipeLaunchView *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RecipeLaunch"];
    //[self.view addSubview:next.view];
    //[self presentViewController:next animated:YES completion:NULL];
//    UIStoryboardSegue *segue = [[UIStoryboardSegue alloc]initWithIdentifier:@"test" source:self destination:next];
//    [self performSegueWithIdentifier:@"test" sender:segue];
}
//-(void) presentRecipeLaunchView {
//    RecipeLaunchView *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RecipeLaunch"];
//    appDelegate.addingDish = currentDish;
//    
//    [self presentViewController:next animated:YES completion:NULL];
//
//}

//- (void) createPageViewController
//{
//    UIPageViewController *recipeViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"RecipeView"];
//    recipeViewController.dataSource = self;
//    
//    if([currentDish.recipe count])
//    {
//        NSArray *startingViewControllers = @[[self viewControllerAtIndex:0]];
//        [recipeViewController setViewControllers: startingViewControllers
//                                       direction: UIPageViewControllerNavigationDirectionForward
//                                        animated: NO
//                                      completion: nil];
//    }
//    
//    self.recipeViewController = recipeViewController;
//    [self addChildViewController: self.recipeViewController];
//    [self.view addSubview: self.recipeViewController.view];
//    [self.recipeViewController  didMoveToParentViewController: self];
//}
//
//- (void) setupPageControl
//{
//    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
//    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
//    [[UIPageControl appearance] setBackgroundColor: [UIColor darkGrayColor]];
//}
//
//#pragma mark -
//#pragma mark UIPageViewControllerDataSource
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
//{
//    NSUInteger index = ((SingleStepViewController*) viewController).itemIndex;
//    
//    if ((index == 0) || (index == NSNotFound)) {
//        return nil;
//    }
//    index--;
//    return [self viewControllerAtIndex:index];
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
//{
//    NSUInteger index = ((SingleStepViewController*) viewController).itemIndex;
//    
//    if (index == NSNotFound) {
//        return nil;
//    }
//    index++;
//    if (index == [currentDish.recipe count]) {
//        return nil;
//    }
//    return [self viewControllerAtIndex:index];
//}
//- (SingleStepViewController *) viewControllerAtIndex: (NSUInteger) itemIndex
//{
//    if (itemIndex < [currentDish.recipe count])
//    {
//        SingleStepViewController *stepController = [self.storyboard instantiateViewControllerWithIdentifier: @"SingleStepView"];
//        stepController.itemIndex = itemIndex;
//        stepController.dishName = currentDish.dishName;
//        stepController.stepContent = [currentDish.recipe objectAtIndex:itemIndex];
//        return stepController;
//    }
//    
//    return nil;
//}
//
//- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
//{
//    return [currentDish.recipe count];
//}
//
//- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
//{
//    return 0;
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
