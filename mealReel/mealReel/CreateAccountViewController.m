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
@synthesize image;
@synthesize profileImageView;
@synthesize picker;

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    NSData* avatarData = UIImageJPEGRepresentation(image, 0.5f);
    PFFile *imageFile = [PFFile fileWithData:avatarData];
    
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // The image has now been uploaded to Parse. Associate it with a new object
            //PFObject* newPhotoObject = [parseDish objectWithClassName:@"PhotoObject"];
            [newUser setObject:imageFile forKey:@"avatar"];
            
        }else{
            NSLog(@"Fail");
        }
    }];

    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error){
            NSLog(@"Registration Sucesss!");
        }
        else{
            NSLog(@"Registration Error!");
        }
    }];
    
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // The image has now been uploaded to Parse. Associate it with a new object
            //PFObject* newPhotoObject = [parseDish objectWithClassName:@"PhotoObject"];
            [newUser setObject:imageFile forKey:@"avatar"];
            
        
            [newUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    NSLog(@"Saved");
                }
                else{
                    // Error
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
    }];
    [newUser saveInBackground];

    
    
    
    LoginViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginView"];
    [self presentViewController:next animated:YES completion:NULL];
}
- (IBAction)returnPressed:(id)sender {
    LoginViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginView"];
    [self presentViewController:next animated:YES completion:NULL];
}


// ====================== Methods to choose profile picture from photo library ====================


- (IBAction)uploadPicture:(id)sender {
    picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker animated:YES completion:NULL];
}


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [profileImageView setImage: image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
