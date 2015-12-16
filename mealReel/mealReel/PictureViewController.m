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

@interface PictureViewController ()

@property bool isFlipped;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pictureTap;
@property (weak, nonatomic) IBOutlet UIImageView *pictureFrame;
@property (weak, nonatomic) IBOutlet UIImageView *pictureBack;

@property (retain,nonatomic) UIView *containerView;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) IBOutlet UIButton *usernameButton;

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
   
    
    UIImage* currentImage = currentDish.dishImage;
    
    CGRect picBound = _pictureBack.bounds;
    picBound.size.height = 256;
    picBound.size.width = 248.5;
    
    _currentImageView = [[UIImageView alloc] initWithImage:currentImage];
    [_currentImageView setFrame:picBound];
    
    CGRect newFrame = _pictureBack.bounds;
    newFrame.size.height = 100;
    newFrame.size.width = 150;
    
  
    
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
                                         (_pictureBack.frame.size.height / 2)-90);
    
    
    restaurant.center = CGPointMake((_pictureBack.frame.size.width  / 2)+15,
                                        (_pictureBack.frame.size.height / 2)-20);

    restaurantName.center = CGPointMake((_pictureBack.frame.size.width  / 2)+15,
                                         (_pictureBack.frame.size.height / 2));
    addressText.center = CGPointMake((_pictureBack.frame.size.width  / 2)+15,
                                     (_pictureBack.frame.size.height / 2)+40);
    address.center = CGPointMake((_pictureBack.frame.size.width  / 2)+15,
                                        (_pictureBack.frame.size.height / 2)+60);
    _dishName.center = CGPointMake((_pictureBack.frame.size.width  / 2)+25,
                                      (  _pictureBack.frame.size.height / 2)+120);
    _currentImageView.center = CGPointMake((_pictureFrame.frame.size.width  / 2 ) + 1.5,
                                           (_pictureFrame.frame.size.height / 2) - 24);
    
    
    restaurant.text = @"Restaurant:";
    addressText.text = @"Address:";
    _dishName.text = currentDish.dishName;
    _dishName.textAlignment = NSTextAlignmentCenter;
    captionTextView.text = currentDish.textStorage.string;
    restaurantName.text = currentDish.restaurant;
    address.text = currentDish.address;
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
    [self presentViewController:next animated:YES completion:NULL];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
