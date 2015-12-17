//
//  SingleStepViewController.m
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "SingleStepViewController.h"

@implementation SingleStepViewController

@synthesize itemIndex;
@synthesize dishName;
@synthesize stepContentLabel;
@synthesize stepNumberLabel;
@synthesize dishNameLabel;
@synthesize stepContent;

-(void) viewDidLoad {
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    dishNameLabel.text = dishName;
    NSString *stepNum = [[NSString alloc] initWithFormat:@"Step %i", (int)itemIndex];
    stepNumberLabel.text = stepNum;
    stepContentLabel.text = stepContent;
    
}

@end
