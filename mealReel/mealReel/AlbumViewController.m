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

@interface AlbumViewController ()
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;


@end

@implementation AlbumViewController

@synthesize dishArray;
@synthesize albumCollectionView;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [_avatarImageView setImage: appDelegate.currentUser.avatar];
    _usernameLabel.text = appDelegate.currentUser.username;
    dishArray = appDelegate.currentUser.album;
   
    
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

    Dish * currentDish = [dishArray objectAtIndex:indexPath.row];
    [cell.cellPicture setImage:currentDish.dishImage];
      
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PictureViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PictureView"];
    
    next.currentDish = [dishArray objectAtIndex:indexPath.row];
    //[self.view addSubview: next.view];
    [self presentViewController:next animated:YES completion:NULL];

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
