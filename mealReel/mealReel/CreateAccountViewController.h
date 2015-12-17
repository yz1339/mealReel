//
//  CreateAccountViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreateAccountViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) UIImagePickerController* picker;
@property (strong, nonatomic) UIImage* image;

- (IBAction)uploadPicture:(id)sender;
- (IBAction)returnPressed:(id)sender;


@end
