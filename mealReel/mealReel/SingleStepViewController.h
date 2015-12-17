//
//  SingleStepViewController.h
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SingleStepViewController : UIViewController {
    AppDelegate* appDelegate;
}


@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;
@property (nonatomic) NSUInteger itemIndex;
@property (nonatomic, strong) NSString *dishName;
@property (weak, nonatomic) IBOutlet UILabel *stepNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepContentLabel;
@property (strong, nonatomic) NSString* stepContent;

@end
