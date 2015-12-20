//
//  CommentViewController.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/15/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewController : UIViewController<UITableViewDelegate>{
    NSArray *commentsArray;
}

@property (strong, nonatomic)NSArray *commentsArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
