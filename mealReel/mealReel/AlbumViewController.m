//
//  AlbumViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/15/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import "AlbumViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "AlbumCollectionViewCell.h"
#import "PictureViewController.h"
#import "Dish.h"
#import "RecipeLaunchView.h"
#import <Parse/Parse.h>



@interface AlbumViewController ()
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;


@end

@implementation AlbumViewController

@synthesize dishArray;
@synthesize albumCollectionView;
@synthesize thisUser;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    _usernameLabel.text = thisUser.username;
    dishArray = [thisUser objectForKey:@"dishAlbum"];
    
    PFFile *imageFile = [thisUser objectForKey:@"avatar"];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        
        
        NSData *imageData = data;
        UIImage *profileImage = [UIImage imageWithData:imageData];

        [_avatarImageView setImage:profileImage];
    }];
    

    albumCollectionView.delegate = self;
    albumCollectionView.dataSource = self;

    
}
- (IBAction)cameraPressed:(id)sender {
    ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
    [self presentViewController:next animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UICollectionView DataSource 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return dishArray.count;
  
}

/*
 *This function deals with setting the images to the cells.
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    AlbumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AlbumCell"forIndexPath:indexPath];

   
    PFObject *currentDish = [dishArray objectAtIndex:indexPath.row];
     [currentDish fetchIfNeeded];
    
    
    UIImage *currentImage;
    PFFile *currentFile = [currentDish objectForKey:@"dishImage2"];
    currentImage = [UIImage imageWithData: [currentFile getData]];

    [cell.cellPicture setImage:currentImage];
      
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PictureViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PictureView"];
    next.currentDish = [dishArray objectAtIndex:indexPath.row];
    next.thisUser = thisUser;

    [self presentViewController:next animated:YES completion:NULL];

}


@end
