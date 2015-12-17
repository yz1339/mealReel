//
//  ViewController.m
//  mealReel
//
//  Created by Yating Zhan on 11/30/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "ViewController.h"
#import "WritingViewController.h"
#import "Dish.h"
#import "AlbumViewController.h"
#import "LoginViewController.h"
#import "SearchViewController.h"
#import <Parse/Parse.h>



@interface ViewController () 
@end

AVCaptureSession *session;
AVCaptureStillImageOutput *StillImageOutput;

@implementation ViewController


@synthesize currentImage;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
     testObject[@"foo"] = @"bar";
     [testObject saveInBackground];
     */
    NSLog(@"test");


    
    appDelegate = [[UIApplication sharedApplication] delegate];
    currentImage = [[UIImage alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasUser"]) {
//                appDelegate.currentUser = [User alloc];
//                appDelegate.currentUser.username = @"loki102";
//                appDelegate.currentUser.avatar = [UIImage imageNamed:@"Tom-Hiddleston.jpg"];
//            } else {
//                NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
//                NSData* defaultData = [defaultUser objectForKey:@"loki102"];
//                appDelegate.currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:defaultData];
//            }

    
    
    session = [[AVCaptureSession alloc] init];
    
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;
    
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    
    if ([session canAddInput:deviceInput]) {
        
        [session addInput:deviceInput];
        
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    CALayer *rootLayer = [[self view] layer];
    
    [rootLayer setMasksToBounds:YES];
    
    CGRect frame = frameForCapture.frame;
    
    [previewLayer setFrame:frame];
    
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    StillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    
    [StillImageOutput setOutputSettings:outputSettings];
    
    [session addOutput:StillImageOutput];
    
    [session startRunning];
    
}

//- (void) viewWillDisappear:(BOOL)animated {
//    NSData* defaultData = [NSKeyedArchiver archivedDataWithRootObject:appDelegate.currentUser];
//    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject: defaultData forKey:@"loki102"];
//    [defaults setBool:YES forKey:@"hasUser"];
//    NSLog(@"has user? %d", [defaults boolForKey:@"hasUser"]);
//    [defaults synchronize];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takephoto:(id)sender {
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in StillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
    }
    [StillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer != NULL) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage* image = [UIImage imageWithData:imageData];
            //UIImage* image = [[UIImage alloc] initWithData:imageData scale:0.8];
            imageView.image = image;
            appDelegate.currentImage = image;
            WritingViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WritingView"];
            [self presentViewController:next animated:YES completion:NULL];
        }
        
    }];
}

- (IBAction)signOutPressed:(id)sender {
    [PFUser logOut];
    LoginViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginView"];
    [self presentViewController:next animated:YES completion:NULL];
}


- (IBAction)albumPressed:(id)sender {
    AlbumViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AlbumView"];
    next.thisUser = [PFUser currentUser];
    [self presentViewController:next animated:YES completion:NULL];

}
- (IBAction)searchPressed:(id)sender {
    SearchViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SearchView"];
    [self presentViewController:next animated:YES completion:NULL];
}

@end
