//
//  SearchViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SearchTableViewCell.h"

@interface SearchViewController : UIViewController <UITableViewDelegate>{
    NSArray *usernamesArray;
}

 @property (strong, nonatomic)NSArray *usernamesArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
