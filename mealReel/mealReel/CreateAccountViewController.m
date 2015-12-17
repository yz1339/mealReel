//
//  CreateAccountViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface CreateAccountViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation CreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUp:(id)sender {
   // PFObject *newUser = [PFObject objectWithClassName:@"User"];
   // newUser[_usernameTextField.text] = _passwordTextField.text;
   // [newUser saveInBackground];
   
    PFUser *newUser = [PFUser user];
    newUser.username = _usernameTextField.text;
    newUser.password = _passwordTextField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error){
            NSLog(@"Registration Sucesss!");
        }
        else{
            NSLog(@"Registration Error!");
        }
    }];
    
    LoginViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginView"];
    [self presentViewController:next animated:YES completion:NULL];
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