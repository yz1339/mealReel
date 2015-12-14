//
//  WritingViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 11/30/15.
//  Copyright © 2015 Alexandra Serralta, Yating Zhan. All rights reserved.
//

#import "WritingViewController.h"
#import "InfoViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface WritingViewController ()
@property bool isFlipped;
@property int count;
@property (retain, nonatomic) IBOutlet UIImageView *pictureFrame;

@property (weak, nonatomic) IBOutlet UIImageView *pictureBack;

@property (retain,nonatomic) UIView *containerView;
@property (retain,nonatomic) UIView *subContainerView;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pictureTap;
@property (retain, nonatomic) UITextView *captionTextView;


@end

@implementation WritingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    _count = 0;
     //  _pictureBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pictureBack.png"]];
    CGRect newFrame = _pictureBack.bounds;
    newFrame.size.height = 200;
    newFrame.size.width = 200;
    
    _containerView = [[UIView alloc] initWithFrame:_pictureFrame.bounds];
     _containerView.center = CGPointMake(160,300);
    
    //_subContainerView = [[UIView alloc] initWithFrame:_pictureFrame.bounds];
    // _subContainerView.center = CGPointMake(160,300);

    _captionTextView = [[UITextView alloc] initWithFrame:newFrame];
     _captionTextView.center = CGPointMake(160,300);
    [_captionTextView setEditable: YES];
   
    
    
    [self.view addSubview:_containerView];
    [self.view addSubview:_captionTextView];
    
    //this centers the two objects
    _pictureFrame.center = CGPointMake(_containerView.frame.size.width  / 2,
                                    _containerView.frame.size.height / 2);
    _pictureBack.center = CGPointMake(_containerView.frame.size.width  / 2,
                                      _containerView.frame.size.height / 2);
   //_captionTextView.center = CGPointMake(_pictureBack.frame.size.width  / 2,
    //                                     _pictureBack.frame.size.height / 2);
    //_subContainerView.center = CGPointMake(_pictureBack.frame.size.width  / 2,
                                        //  _pictureBack.frame.size.height / 2);
  
    
    _captionTextView.text = @"Enter Text Here";
    //this adds them to our containerView
    [_containerView addSubview:_pictureBack];
   // [_pictureBack addSubview: _captionTextView];
 //  [_subContainerView addSubview: _subContainerView];
   // [_subContainerView addSubview:captionTextView];
    [_containerView addSubview:_pictureFrame];
    
    
    //[_containerView addSubview:_pictureBack];
    
    //[_subContainerView setHidden: YES];
    [_captionTextView setHidden: YES];
    _isFlipped = NO;
    
    
   
    _pictureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [_containerView addGestureRecognizer:_pictureTap];
    
   
    //[_pictureTap release];
    
    
}


- (IBAction)flipPressed:(id)sender {
    /*
    _pictureBack = [[UIImageView alloc] initWithImage:[UIImage
                                                       imageNamed:@"pictureBack.png"]];
    
    [UIView transitionWithView:_containerView
                      duration:3
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        
                        if (!_isFlipped) {
                            [_pictureBack setHidden:YES];
                            [_containerView addSubview:_pictureFrame];
                            _isFlipped = YES;
                        } else {
                            [_pictureBack setHidden:NO];
                            [_pictureFrame removeFromSuperview]; //or hide it.
                        }
                        
                    } completion:nil];
     */
    

    _pictureBack.center = _pictureFrame.center;
    [UIView beginAnimations:@"WritingView" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:_containerView
                             cache:YES];
    [_pictureFrame removeFromSuperview];
    [_containerView addSubview:_pictureBack];
    [UIView commitAnimations];

}


- (IBAction)arrowPressed:(id)sender {
    
    InfoViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"InfoView"];
    [self presentViewController:next animated:YES completion:NULL];

    
}

- (IBAction)returnPressed:(id)sender {
    ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
    [self presentViewController:next animated:YES completion:NULL];
}




- (void)handleTap:(UITapGestureRecognizer *)sender {
    
    //_pictureBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pictureBack.png"]];
    NSLog(@"weenis");
    if (sender.state == UIGestureRecognizerStateEnded && _count ==0) {
        [UIView transitionWithView:_containerView
                          duration:1
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            
                            if (!_isFlipped) {
                                /*
                                [_pictureBack setHidden:YES];
                                [_containerView addSubview:_pictureFrame];
                                 */
                                [_pictureFrame setHidden:YES];
                                [_pictureBack setHidden: NO];
                                //[_containerView addSubview:_pictureBack];

                                _isFlipped = YES;
                            } else {
                                [_pictureFrame setHidden:NO];
                                [_pictureBack setHidden:YES];
                               // [_pictureBack removeFromSuperview]; //or hide it.
                                _isFlipped = NO;
                            }
                            
                        } completion:nil];
        

        _count++;
        [_containerView removeGestureRecognizer:_pictureTap];
        [_pictureTap setEnabled: NO];
        
    }
    [_captionTextView performSelector:@selector(setHidden:) withObject:_captionTextView afterDelay:1.2];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
