//
//  AlbumViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/15/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


/*
 *The Album View basically works as the user profile, here the array of pictures a user has taken 
 *is displayed through a UICollectionView.
 */

@interface AlbumViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    UICollectionView *albumCollectionView;
    NSMutableArray* dishArray;
    AppDelegate* appDelegate;

}

@property (strong, nonatomic) IBOutlet UICollectionView *albumCollectionView;
@property (strong, nonatomic) NSMutableArray* dishArray;


@end
