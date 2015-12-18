//
//  SingleStepViewController.m
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "SingleStepViewController.h"
#import "PictureViewController.h"

@implementation SingleStepViewController

@synthesize itemIndex;
@synthesize dishName;
@synthesize stepContentLabel;
@synthesize stepNumberLabel;
@synthesize dishNameLabel;
@synthesize stepContent;
@synthesize thisUser;
@synthesize currentDish;

-(void) viewDidLoad {
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    dishNameLabel.text = dishName;
    NSString *stepNum = [[NSString alloc] initWithFormat:@"Step %i", (int)itemIndex+1];
    stepNumberLabel.text = stepNum;
    stepContentLabel.text = stepContent;
    
}

- (IBAction)returnToPictureView:(id)sender {
    PictureViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PictureView"];
    next.thisUser = thisUser;
    next.currentDish = currentDish;
    [self presentViewController:next animated:YES completion:NULL];
}
@end
