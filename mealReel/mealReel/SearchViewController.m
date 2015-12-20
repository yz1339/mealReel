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
    return usernamesArray.count;
}


-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"SearchCell";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    PFObject *tempObject = [usernamesArray objectAtIndex:indexPath.row];
    
    cell.usernameText.text = [tempObject objectForKey:@"username"];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AlbumViewController *next = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AlbumView"];
        next.thisUser = [usernamesArray objectAtIndex:indexPath.row];
    [self presentViewController:next animated:YES completion:NULL];
    
}

@end
