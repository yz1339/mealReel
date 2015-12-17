//
//  InfoViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/3/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import "InfoViewController.h"
#import "WritingViewController.h"
#import "ViewController.h"
#import "AddRecipeViewController.h"
#import <Parse/Parse.h>



@interface InfoViewController ()<CLLocationManagerDelegate>

@end

@implementation InfoViewController
@synthesize recipeTextView;
@synthesize locationManager;
@synthesize geocoder;
@synthesize placemark;
@synthesize restaurantTextField;
@synthesize addressTextField;
@synthesize dishNameTextField;
@synthesize dishToAdd;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    recipeTextView.delegate = self;
    restaurantTextField.delegate = self;
    addressTextField.delegate = self;
    dishNameTextField.delegate = self;
    locationManager.delegate = self;

    appDelegate = [[UIApplication sharedApplication] delegate];
    
    
    }
- (IBAction)returnPressed:(id)sender {
   WritingViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WritingView"];
    [self presentViewController:next animated:YES completion:NULL];
}

- (IBAction)acceptPressed:(id)sender {
    //Finally have all the information we need for the dish object, init a dish here
    dishToAdd = [[Dish alloc] initWithPicture:appDelegate.currentImage dishname:dishNameTextField.text restaurantName:restaurantTextField.text address:addressTextField.text textStore:appDelegate.textStorage andWriting:appDelegate.writing];
    //Add the dish to currentUser's album
    dishToAdd.recipe = appDelegate.recipe;
    [appDelegate.currentUser addToAlbum:dishToAdd];
    //reset the writing and recipes to nil so that the next time the user open writing view he/she won't see previous writings
    appDelegate.writing = nil;
    appDelegate.recipe = nil;

    
    //[PFUser currentUser][@"dishAlbum"] = appDelegate.recipe;
    //PFQuery *albumQuery = [PFUser query];
    //[albumQuery whereKey:@"username" equalTo:dishToAdd];
    //[albumQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error)
    //{
        /* This is how you add 'dishToAdd' to the Array called dishAlbum that
         * belongs to the special parse class called User (PFUser type): */
        
        // This is your current user
    
        PFObject *parseDish = [PFObject objectWithClassName:@"Dish"];
        parseDish[@"dishName"] = dishToAdd.dishName;
        parseDish[@"restaurant"] = dishToAdd.restaurant;
        parseDish[@"address"] = dishToAdd.address;
        parseDish[@"caption"] = dishToAdd.writing;
    
    
        NSData* data = UIImageJPEGRepresentation(dishToAdd.dishImage, 0.5f);
        //PFFile *imageFile = [PFFile fileWithName:dishToAdd.dishImage data:data];
        PFFile *imageFile = [PFFile fileWithData:data];
    
    
        [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                // The image has now been uploaded to Parse. Associate it with a new object
                //PFObject* newPhotoObject = [parseDish objectWithClassName:@"PhotoObject"];
                [parseDish setObject:imageFile forKey:@"dishImage2"];
            
                [parseDish saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
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

       // parseDish[@"dishImage"] = dishToAdd.dishImage;
        [parseDish saveInBackground];

        PFUser *currentUser = [PFUser currentUser];
        NSLog(@"%@", currentUser.username);
        
        // Adds object to dishAlbum array
        [currentUser addObject:parseDish forKey:@"dishAlbum"];
        NSMutableArray* testAlbum = [currentUser objectForKey:@"dishAlbum"];
        NSLog(@"%lu", (unsigned long)[testAlbum count]);
        
        // Saves the changes on the Parse server. This is necessary to update the actual Parse server. If you don't "save" then the changes will be lost
        [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (succeeded)
            {
                //success
                NSLog(@"Success!");
            }
            else{
                NSLog(@"Failure!");
            }
        }];
       
        //[[[PFUser currentUser] objectForKey:@"dishAlbum"] saveInBackground];
    //}];
    
     NSLog(@"Death");
    ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
    [self presentViewController:next animated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testPressed:(id)sender {
  
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];

}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (IBAction)addingReceipe:(id)sender {
    
    //Connect to the recipeView
    NSLog(@"Testing appdelegate: %@", appDelegate.writing);
    AddRecipeViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddRecipeView"];
    [self presentViewController:next animated:YES completion:NULL];
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
      // find the address in here?
    }
    
    [locationManager stopUpdatingLocation];

    
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            addressTextField.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
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
