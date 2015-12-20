//
//  SearchViewController.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/16/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "SearchViewController.h"
#import "ViewController.h"
#import "AlbumViewController.h"


@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize usernamesArray;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(retrieveFromParse)];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.searchResults = [[NSArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) retrieveFromParse {
    
    PFQuery *retrieveUsernames = [PFUser query];
    [retrieveUsernames findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error) {
        if(!error){
            NSLog(@"Success!");
            usernamesArray = [[NSArray alloc]initWithArray:objects];
            
        }
        else{
            NSLog(@"Failure");
        }
        [tableView reloadData];
    }];
    
}


- (IBAction)returnPressed:(id)sender {
    ViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CameraView"];
    [self presentViewController:next animated:YES completion:NULL];
}


#pragma mark - UITableView DataSource 

-(NSInteger) numberOfSectionsInTableView: (UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //if(tableView == self.searchDisplayController.searchResultsTableView){
   //     return [self.searchResults count];
        
   // }
   // else{
    //    return 1;
   // }
    return usernamesArray.count;
}


-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"SearchCell";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if(tableView == self.searchDisplayController.searchResultsTableView){
    PFObject *tempObject = [usernamesArray objectAtIndex:indexPath.row];
        
        //PFObject *tempObject = [self.searchResults objectAtIndex:indexPath.row];

    
    cell.usernameText.text = [tempObject objectForKey:@"username"];
    
    
    UIImage *currentImage;
    PFFile *currentFile = [tempObject objectForKey:@"avatar"];
    currentImage = [UIImage imageWithData: [currentFile getData]];
    

     [cell.cellImage setImage:currentImage];
       // }
    //else{

    //}
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AlbumViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AlbumView"];
        next.thisUser = [usernamesArray objectAtIndex:indexPath.row];
    [self presentViewController:next animated:YES completion:NULL];
    
}


#pragma Search Methods

/*
-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString*)scope{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", searchText];
    self.searchResults = [usernamesArray filteredArrayUsingPredicate: predicate];
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
