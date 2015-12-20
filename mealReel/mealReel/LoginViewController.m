//
//  LoginViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "LoginViewController.h"
#import "CreateAccountViewController.h"
#import "ViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"


@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _usernameTextField.delegate = self;
    _passwordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUpPressed:(id)sender {
    CreateAccountViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CreateAccount"];
    [self presentViewController:next animated:YES completion:NULL];
}
- (IBAction)enterPressed:(id)sender {
    
    [PFUser logInWithUsernameInBackground:_usernameTextField.text password:_passwordTextField.text block:^(PFUser * user, NSError * error) {
        if(!error){
            
            AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
            appDelegate.currentUser.username = _usernameTextField.text;
            ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
            [self presentViewController:next animated:YES completion:NULL];

        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!!" message:@" No account with this username and password combination could be found!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
  
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


@end
