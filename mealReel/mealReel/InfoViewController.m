//
//  InfoViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/3/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "InfoViewController.h"
#import "WritingViewController.h"
#import "ViewController.h"
#import "AddRecipeViewController.h"



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
    //reset the writing to nil so that the next time the user open writing view he/she won't see previous writings
    appDelegate.writing = nil;
    NSLog(@"recipe length is !!!!!!!!! %i", (int) dishToAdd.recipe.count);
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
