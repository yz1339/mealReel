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

@synthesize currentImage;
@synthesize currentDish;
@synthesize album;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    recipeTextView.delegate = self;
    restaurantTextField.delegate = self;
    addressTextField.delegate = self;
    dishNameTextField.delegate = self;
    locationManager.delegate = self;

    
    }
- (IBAction)returnPressed:(id)sender {
   WritingViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WritingView"];
    //[self performSegueWithIdentifier:@"infoCanceled" sender:self];
    [self presentViewController:next animated:YES completion:NULL];
}

- (IBAction)acceptPressed:(id)sender {
    ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
    //[self performSegueWithIdentifier:@"infoAccepted" sender:self];
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
//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    //Sending this image to the writingView
//    if ([[segue identifier] isEqualToString:@"infoAccepted"]) {
//        //Once infomation is accepted, the image and info should be stored
//        [[segue destinationViewController] setCurrentDish: currentDish];
//        [[segue destinationViewController] setCurrentImage: currentImage];
//        [[segue destinationViewController] setAlbum: album];
//    }
//    if ([[segue identifier] isEqualToString:@"infoCanceled"]) {
//        //[[segue destinationViewController] setCurrentDish: currentDish];
//        //[[segue destinationViewController] setCurrentImage: currentImage];
//        [[segue destinationViewController] setAlbum: album];
//    }
//}



@end
