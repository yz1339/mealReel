//
//  PictureViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/2/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@property bool isFlipped;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pictureTap;
@property (weak, nonatomic) IBOutlet UIImageView *pictureFrame;
@property (weak, nonatomic) IBOutlet UIImageView *pictureBack;

@property (retain,nonatomic) UIView *containerView;

@end

@implementation PictureViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Do any additional setup after loading the view.
    CGRect newFrame = _pictureBack.bounds;
    newFrame.size.height = 100;
    newFrame.size.width = 100;
    
    _containerView = [[UIView alloc] initWithFrame:_pictureFrame.bounds];
    _containerView.center = CGPointMake(160,300);
    UITextView *captionTextView = [[UITextView alloc] initWithFrame:newFrame];
    
    UILabel *restaurantName = [[UILabel alloc]initWithFrame:newFrame];
    UILabel *address = [[UILabel alloc]initWithFrame:newFrame];
    UILabel *dishName = [[UILabel alloc]initWithFrame:newFrame];
    
    [self.view addSubview:_containerView];
    
    //this centers the two objects
    _pictureFrame.center = CGPointMake(_containerView.frame.size.width  / 2,
                                       _containerView.frame.size.height / 2);
    _pictureBack.center = CGPointMake(_containerView.frame.size.width  / 2,
                                      _containerView.frame.size.height / 2);
    captionTextView.center = CGPointMake(_pictureBack.frame.size.width  / 2,
                                         (_pictureBack.frame.size.height / 2)-90);
    
    restaurantName.center = CGPointMake(_pictureBack.frame.size.width  / 2,
                                         (_pictureBack.frame.size.height / 2)-30);
    address.center = CGPointMake(_pictureBack.frame.size.width  / 2,
                                        _pictureBack.frame.size.height / 2);
    dishName.center = CGPointMake(_pictureBack.frame.size.width  / 2,
                                        _pictureBack.frame.size.height / 2);

    
    
    captionTextView.text = @"sdfasdfadsfasdgsdgsdafsdafasdgdsfgdfgdfgdfsgasfsadgadsfsdafasdgdsfgsfdfasfdsfasdgdsfgsdaf";
    restaurantName.text = @"Macaroni Grill";
    address.text = @"183 Notre Dame Way SW";
    //this adds them to our containerView
    [_containerView addSubview:_pictureBack];
    [_pictureBack addSubview: captionTextView];
    [_containerView addSubview:_pictureFrame];
    [_pictureBack addSubview:restaurantName];
    [_pictureBack addSubview:address];
    

    
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
        
        
        
        
    }
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
