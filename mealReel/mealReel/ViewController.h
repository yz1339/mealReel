//
//  ViewController.h
//  mealReel
//
//  Created by Yating Zhan on 11/30/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController {
    IBOutlet UIView *frameForCapture;
    IBOutlet UIImageView *imageView;
}

- (IBAction)takephoto:(id)sender;


@end

