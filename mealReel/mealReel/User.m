//
//  User.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/14/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize album;


-(void) addToAlbum:(Dish *)currentDish{
    if([album count]>0){
         [album addObject: currentDish];
    }
    else{
        album = [[NSMutableArray alloc]init];
        [album addObject: currentDish];
    }
   
}


@end
