//
//  SingleStepViewController.h
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <Parse/Parse.h>


@interface SingleStepViewController : UIViewController {
    AppDelegate* appDelegate;
}


@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;
@property (nonatomic) NSUInteger itemIndex;
@property (nonatomic, strong) NSString *dishName;
@property (weak, nonatomic) IBOutlet UILabel *stepNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepContentLabel;
@property (strong, nonatomic) NSString* stepContent;
@property (strong, nonatomic) PFUser* thisUser;
@property (strong, nonatomic) PFObject* currentDish;


- (IBAction)returnToPictureView:(id)sender;

@end
