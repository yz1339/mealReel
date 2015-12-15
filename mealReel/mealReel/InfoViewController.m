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

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize currentImage;
@synthesize currentDish;
@synthesize album;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)returnPressed:(id)sender {
   WritingViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WritingView"];
    [self performSegueWithIdentifier:@"infoCanceled" sender:self];
    [self presentViewController:next animated:YES completion:NULL];
}
- (IBAction)acceptPressed:(id)sender {
    ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
    [self performSegueWithIdentifier:@"infoAccepted" sender:self];
    [self presentViewController:next animated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Sending this image to the writingView
    if ([[segue identifier] isEqualToString:@"infoAccepted"]) {
        //Once infomation is accepted, the image and info should be stored
        [[segue destinationViewController] setCurrentDish: currentDish];
        [[segue destinationViewController] setCurrentImage: currentImage];
        [[segue destinationViewController] setAlbum: album];
    }
    if ([[segue identifier] isEqualToString:@"infoCanceled"]) {
        //[[segue destinationViewController] setCurrentDish: currentDish];
        //[[segue destinationViewController] setCurrentImage: currentImage];
        [[segue destinationViewController] setAlbum: album];
    }
}



@end
