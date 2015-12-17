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
#import "Dish.h"

#define MAX_WRITING_LENGTH 100


@interface WritingViewController () <UITextViewDelegate>

@property bool isFlipped;
@property int count;

@property (weak, nonatomic) IBOutlet UIImageView *pictureBack;
@property (weak, nonatomic) IBOutlet UIImageView *pictureFrame;

@property (retain,nonatomic) UIView *containerView;
@property (retain,nonatomic) UIView *subContainerView;
@property (retain, nonatomic) UIImageView *currentImageView;
@property(nonatomic, readonly, strong) NSTextStorage *textStorage;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *pictureTap;


@end

@implementation WritingViewController


@synthesize currentImage;
@synthesize captionTextView;
@synthesize textStorage;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    currentImage = appDelegate.currentImage;

      textStorage = [[NSTextStorage alloc] init];

    _count = 0;
    
    //set the sizes of the images to be displayed within the view
    CGRect newFrame = _pictureBack.bounds;
    newFrame.size.height = 200;
    newFrame.size.width = 200;
    
    CGRect picBound = _pictureBack.bounds;
    picBound.size.height = 256;
    picBound.size.width = 248.5;
    
    _currentImageView = [[UIImageView alloc] initWithImage:currentImage];
    [_currentImageView setFrame:picBound];
   
    //create a container on which the pictures will placed for animation
    _containerView = [[UIView alloc] initWithFrame:_pictureFrame.bounds];
     _containerView.center = CGPointMake(160,300);
    
    


    //have a captionTextView so that users may write on the back of the picture once the flip animation is called
    captionTextView = [[UITextView alloc] initWithFrame:newFrame];
     captionTextView.center = CGPointMake(160,300);
    [captionTextView setEditable: YES];
    captionTextView.delegate = self;
    
    
   
    
  
    [self.view addSubview:_containerView];
    [self.view addSubview:captionTextView];
    
    //This is where we center all the objects
    _pictureFrame.center = CGPointMake(_containerView.frame.size.width  / 2,
                                    _containerView.frame.size.height / 2);
    _pictureBack.center = CGPointMake(_containerView.frame.size.width  / 2,
                                      _containerView.frame.size.height / 2);
    _currentImageView.center = CGPointMake((_pictureFrame.frame.size.width  / 2 ) + 1.5,
                                          (_pictureFrame.frame.size.height / 2) - 21.5);
    

    //check to see if the user previously typed something
    if (appDelegate.writing != nil) {
        NSLog(@"User previously wrote sth!!!");
        captionTextView.text = appDelegate.writing;
    } else {
        captionTextView.text = @"Enter Text Here";
    }
    
    //this adds them to our containerView
    [_containerView addSubview:_pictureBack];
    [_containerView addSubview:_pictureFrame];
 
    [_containerView addSubview:_currentImageView];
    
    //captionView does not show up until image is flipped
    [captionTextView setHidden: YES];
    _isFlipped = NO;
    
    
   
    _pictureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [_containerView addGestureRecognizer:_pictureTap];
    
  
    
    
}




- (IBAction)arrowPressed:(id)sender {
    
    InfoViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"InfoView"];
    [self presentViewController:next animated:YES completion:NULL];

    
}


- (IBAction)returnPressed:(id)sender {
    ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
    [self presentViewController:next animated:YES completion:NULL];
}



/*
 * Here we handle the animation and flipping of image using a UITapGestureRecognizer. So when the user taps the 
 * image it flips and reveals a textview.
 */


- (void)handleTap:(UITapGestureRecognizer *)sender {
    
   
    if (sender.state == UIGestureRecognizerStateEnded && _count ==0) {
        [UIView transitionWithView:_containerView
                          duration:1
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            
                            if (!_isFlipped) {
                                [_pictureFrame setHidden:YES];
                                [_currentImageView setHidden:YES];
                                [_pictureBack setHidden: NO];
                            

                                _isFlipped = YES;
                            } else {
                                [_pictureFrame setHidden:NO];
                                [_currentImageView setHidden:NO];
                                [_pictureBack setHidden:YES];
                                _isFlipped = NO;
                            }
                            
                        } completion:nil];
        

        _count++;
        [_containerView removeGestureRecognizer:_pictureTap];
        [_pictureTap setEnabled: NO];
        
    }
    [captionTextView performSelector:@selector(setHidden:) withObject:captionTextView afterDelay:1.2];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([captionTextView.text isEqualToString:@"Enter Text Here"]) {
        captionTextView.text = @"";
    }
    [captionTextView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([captionTextView.text isEqualToString:@""]) {
        captionTextView.text = @"Enter Text Here";
    }
    [captionTextView resignFirstResponder];
}


/*
 * This checks the input into the textView.
 */

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    

    if([text isEqualToString:@"\n"]){
        [captionTextView resignFirstResponder];
        
    }
    else{
        NSUInteger newLength = (textView.text.length - range.length) + text.length;
        if(newLength <= MAX_WRITING_LENGTH)
        {
            
        } else {
            NSUInteger emptySpace = MAX_WRITING_LENGTH - (captionTextView.text.length - range.length);
            captionTextView.text = [[[captionTextView.text substringToIndex:range.location]
                              stringByAppendingString:[text substringToIndex:emptySpace]]
                             stringByAppendingString:[captionTextView.text substringFromIndex:(range.location + range.length)]];
           return NO;
            
        }
        NSString* writing = captionTextView.text;
            appDelegate.writing = writing;
            textStorage = captionTextView.textStorage;
            appDelegate.textStorage = [[NSTextStorage alloc]init];
            appDelegate.textStorage = textStorage;

        
    }
    return YES;
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
