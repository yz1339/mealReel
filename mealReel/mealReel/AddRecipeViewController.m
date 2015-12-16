//
//  AddRecipeViewController.m
//  mealReel
//
//  Created by Yating Zhan on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "AddRecipeViewController.h"
#import "InfoViewController.h"


#define MAX_STEP_LENGTH 50

@implementation AddRecipeViewController

@synthesize stepNumberLabel;
@synthesize prevStepLabel;
@synthesize addStepButton;
@synthesize stepTextView;
@synthesize returnToInfo;
@synthesize steps;

-(void) addToRecipe:(NSString *)currentStep {
    if([steps count]>0){
        [steps addObject: currentStep];
        NSLog(@"Adding");
    }
    else{
        steps = [[NSMutableArray alloc]init];
        [steps addObject: currentStep];
        NSLog(@"Initiating");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *stepNumber = [[NSString alloc]initWithFormat:@"Step %i", (int)(steps.count)+1];
    stepNumberLabel.text = stepNumber;
    NSLog(@"How many steps now?? %i", (int)(steps.count));
    if (steps.count > 1) {
        prevStepLabel.text = [steps objectAtIndex:steps.count-1];
    }
    [stepTextView setEditable: YES];
    stepTextView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([stepTextView.text isEqualToString:@"Add your step here..."]) {
        stepTextView.text = @"";
    }
    [stepTextView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([stepTextView.text isEqualToString:@""]) {
        stepTextView.text = @"Add your step here...";
    }
    
    [stepTextView resignFirstResponder];
}

- (IBAction)addCurrentStep:(id)sender {
    NSString* thisStep = stepTextView.text;
    [self addToRecipe:thisStep];
    if (steps.count > 0) {
        prevStepLabel.text = [steps objectAtIndex:steps.count-1];
    }
    //NSLog(@"addingDish writes: %@", steps.writing);
    NSLog(@"How many steps now?? %i", (int)(steps.count));
    NSString *stepNumber = [[NSString alloc]initWithFormat:@"Step %i", (int)(steps.count) + 1];
    stepNumberLabel.text = stepNumber;
    stepTextView.text = @"Add your step here...";
}
- (IBAction)finishRecipe:(id)sender {

    appDelegate.recipe = steps;
    InfoViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"InfoView"];
    [self presentViewController:next animated:YES completion:NULL];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"]){
        [stepTextView resignFirstResponder];
    }
    else{
        NSUInteger newLength = (textView.text.length - range.length) + text.length;
        if(newLength <= MAX_STEP_LENGTH)
        {
            
        } else {
            NSUInteger emptySpace = MAX_STEP_LENGTH - (stepTextView.text.length - range.length);
            stepTextView.text = [[[stepTextView.text substringToIndex:range.location]
                                     stringByAppendingString:[text substringToIndex:emptySpace]]
                                    stringByAppendingString:[stepTextView.text substringFromIndex:(range.location + range.length)]];
            return NO;
        }
    }
    return YES;
}



@end
