//
//  InfoViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/3/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//



/*
 *This is the view here we gather the dish name, restaurant name, and address. Optionally 
 *we also gather the recipe.
 */
#import <UIKit/UIKit.h>
#import "Dish.h"
#import "WritingViewController.h"
#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
@interface InfoViewController : UIViewController <CLLocationManagerDelegate>{
    UITextView* recipeTextView;
    UITextField* restaurantTextField;
    UITextField* addressTextField;
    UITextField* dishNameTextField;
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    AppDelegate* appDelegate;
    
}

@property (retain, nonatomic) IBOutlet UITextView *recipeTextView;
@property CLLocationManager *locationManager;
@property CLGeocoder *geocoder;
@property CLPlacemark *placemark;
@property (strong, nonatomic) IBOutlet UITextField *restaurantTextField;
@property (strong, nonatomic) IBOutlet UITextField *addressTextField;
@property (strong, nonatomic) IBOutlet UITextField *dishNameTextField;
@property (strong, nonatomic) Dish* dishToAdd;


@end
