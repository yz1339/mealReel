//
//  AddRecipeViewController.h
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dish.h"
#import "AppDelegate.h"



@interface AddRecipeViewController : UIViewController <UITextViewDelegate>{
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UILabel *stepNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *prevStepLabel;
@property (weak, nonatomic) IBOutlet UIButton *addStepButton;
@property (weak, nonatomic) IBOutlet UITextView *stepTextView;

@property (weak, nonatomic) IBOutlet UIButton *returnToInfo;
@property (strong, nonatomic) NSMutableArray* steps;

-(void) addToRecipe:(NSString *)currentStep;


@end
