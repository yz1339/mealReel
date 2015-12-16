//
//  AlbumViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/15/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface AlbumViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    UICollectionView *albumCollectionView;
    NSMutableArray* dishArray;
    AppDelegate* appDelegate;

}

@property (strong, nonatomic) IBOutlet UICollectionView *albumCollectionView;
@property (strong, nonatomic) NSMutableArray* dishArray;


@end
