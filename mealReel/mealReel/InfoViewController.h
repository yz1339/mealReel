//
//  InfoViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/3/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface InfoViewController : UIViewController <CLLocationManagerDelegate>{
    UITextView* recipeTextView;
    UITextField* restaurantTextField;
    UITextField* addressTextField;
    UITextField* dishNameTextField;
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    
}

@property (retain, nonatomic) IBOutlet UITextView *recipeTextView;
@property CLLocationManager *locationManager;
@property CLGeocoder *geocoder;
@property CLPlacemark *placemark;
@property (strong, nonatomic) IBOutlet UITextField *restaurantTextField;
@property (strong, nonatomic) IBOutlet UITextField *addressTextField;

@property (strong, nonatomic) IBOutlet UITextField *dishNameTextField;


@end
