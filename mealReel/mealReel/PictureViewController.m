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
@interface PictureViewController ()

@property bool isFlipped;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pictureTap;
@property (weak, nonatomic) IBOutlet UIImageView *pictureFrame;
@property (weak, nonatomic) IBOutlet UIImageView *pictureBack;

@property (retain,nonatomic) UIView *containerView;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) IBOutlet UIButton *usernameButton;
@property (weak, nonatomic) IBOutlet UIButton *viewRecipeButton;
@property (retain, nonatomic) UIImageView *currentImageView;

@property (retain, nonatomic) UILabel *dishName;
@property (strong, nonatomic) IBOutlet UIButton *commentsButton;



@end

@implementation PictureViewController


@synthesize currentDish;
@synthesize thisUser;

- (void)viewDidLoad {
    [super viewDidLoad];
    [_commentsButton setEnabled:NO];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    //AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //currentDish = (PFObject*) appDelegate.addingDish;
    //set the profile image at the topleft corner
    UIImage *profileImage;
    PFFile *imageFile = [thisUser objectForKey:@"avatar"];
    profileImage = [UIImage imageWithData: [imageFile getData]];
    
    [_avatarImageView setImage:profileImage];
    
    [_usernameButton setTitle:thisUser.username forState:UIControlStateNormal];
   
    
    //set the front of the picture
    UIImage *currentImage;
    PFFile *currentFile = [currentDish objectForKey:@"dishImage2"];
    currentImage = [UIImage imageWithData: [currentFile getData]];
    CGRect picBound = _pictureBack.bounds;
    picBound.size.height = 256;
    picBound.size.width = 248.5;
    _currentImageView = [[UIImageView alloc] initWithImage:currentImage];
    [_currentImageView setFrame:picBound];
    CGRect newFrame = _pictureBack.bounds;
    newFrame.size.height = 100;
    newFrame.size.width = 200;
    
  
    //set the back of the picture
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
    
    _dishName.text = [currentDish objectForKey:@"dishName"];
    [_dishName setFont:[UIFont fontWithName:@"Menlo" size:12]];
    _dishName.textAlignment = NSTextAlignmentCenter;
    
     captionTextView.text = [currentDish objectForKey:@"caption"];
    [captionTextView setFont:[UIFont fontWithName:@"Menlo" size:15]];

     restaurantName.text = [currentDish objectForKey:@"restaurant"];
    [restaurantName setFont:[UIFont fontWithName:@"Menlo" size:12]];
    restaurantName.textAlignment = NSTextAlignmentCenter;
    
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
  
    //Now when there is no recipe, the user won't able to click on the button, but later maybe we should sent an alert telling the user there is no recipe and ask if they want to add a recipe.
    if ((int)[[currentDish objectForKey:@"recipe"] count] == 0) {
        [self.viewRecipeButton setEnabled:NO];
    }else{
        [self.viewRecipeButton setEnabled:YES];
    }

    
    //[_pictureTap release];

}

-(void) viewDidAppear {
    if ([[currentDish objectForKey:@"recipe"] count] == 0) {
        [self.viewRecipeButton setEnabled:NO];
    }else{
        [self.viewRecipeButton setEnabled:YES];
    }
}


- (void)handleTap:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView transitionWithView:_containerView
                          duration:1
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            
                            if (!_isFlipped) {
                            
                                [_dishName setHidden: YES];
                                [_currentImageView setHidden:YES];
                                [_pictureFrame setHidden:YES];
                                [_pictureBack setHidden: NO];
                                
                                _isFlipped = YES;
                            } else {
                                [_dishName setHidden: NO];
                                [_currentImageView setHidden:NO];
                                [_pictureFrame setHidden:NO];
                                [_pictureBack setHidden:YES];
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
    next.thisUser = thisUser;

    [self presentViewController:next animated:YES completion:NULL];
}


- (IBAction)seeRecipe:(id)sender {
    RecipeLaunchView *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RecipeLaunch"];
    next.thisUser = thisUser;
    next.currentDish = currentDish;
    [self presentViewController:next animated:YES completion:NULL];
}

@end
