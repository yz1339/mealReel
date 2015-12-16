//
//  AlbumViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/15/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "AlbumViewController.h"
#import "AppDelegate.h"

@interface AlbumViewController ()
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //appDelegate = [[UIApplication sharedApplication] delegate];
    

    // Do any additional setup after loading the view.
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [_avatarImageView setImage: appDelegate.currentUser.avatar];
    CGRect newFrame = _avatarImageView.bounds;
    newFrame.size.height = 10;
    newFrame.size.width = 10;
    [_avatarImageView setFrame: newFrame];
    _usernameLabel.text = appDelegate.currentUser.username;
    
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

@end
