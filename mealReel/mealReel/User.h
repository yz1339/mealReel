//
//  User.h
//  mealReel
//
//  Created by Alexandra Serralta on 12/14/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dish.h"

@interface User : NSObject

@property NSMutableArray* album;

-(void) addToAlbum: (Dish*) currentDish;

@end
