//
//  AlbumViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/15/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "AlbumViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "AlbumCollectionViewCell.h"

@interface AlbumViewController ()
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;


@end

@implementation AlbumViewController

@synthesize dishArray;
@synthesize albumCollectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //appDelegate = [[UIApplication sharedApplication] delegate];
    

    // Do any additional setup after loading the view.
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [_avatarImageView setImage: appDelegate.currentUser.avatar];
    _usernameLabel.text = appDelegate.currentUser.username;
    //dishArray = appDelegate.currentUser.album;
    dishArray = [[NSMutableArray alloc]init];
    UIImage *test = [UIImage imageNamed:@"Tom-Hiddleston.jpg"];UIImage *test2 = [UIImage imageNamed:@"Tom-Hiddleston.jpg"];
    [dishArray addObject:test];
    [dishArray addObject:test2];
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


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AlbumCell"forIndexPath:indexPath];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    NSLog(@"LOL!");
    recipeImageView.image = [dishArray objectAtIndex:indexPath.row]; //[UIImage imageNamed:[dishArray objectAtIndex:indexPath.row]];
    
    return cell;
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
