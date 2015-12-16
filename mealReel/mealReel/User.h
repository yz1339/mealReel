//
//  User.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/14/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dish.h"

/*
 *This is the User Object, whoich contains an avatar pic, a username, and an array of captured photos
 *in the form of Dish objects.
 */
@interface User : NSObject

@property (retain,nonatomic) UIImage* avatar;
@property (retain, nonatomic) NSString* username;
@property (retain, nonatomic) NSMutableArray* album;

-(void) addToAlbum: (Dish*) currentDish;

@end
