//
//  CommentViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/15/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "CommentViewController.h"
#import "PictureViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController
@synthesize commentsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnPressed:(id)sender {
}


#pragma mark - UITableView DataSource

-(NSInteger) numberOfSectionsInTableView: (UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  commentsArray.count;
}

/*
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"here we enter");
    static NSString *CellIdentifier = @"SearchCell";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    PFObject *tempObject = [usernamesArray objectAtIndex:indexPath.row];
    
    cell.usernameText.text = [tempObject objectForKey:@"username"];
    
    return cell;
}
 */


/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AlbumViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AlbumView"];
    next.thisUser = [usernamesArray objectAtIndex:indexPath.row];
    [self presentViewController:next animated:YES completion:NULL];
    
}
 */




#pragma mark - Navigation


@end
