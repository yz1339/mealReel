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

@property (retain,nonatomic) UIImage* avatar;
@property (retain, nonatomic) NSString* username;
@property (retain, nonatomic) NSMutableArray* album;

-(void) addToAlbum: (Dish*) currentDish;

- (id)initWithCoder:(NSCoder *)coder;

- (void)encodeWithCoder:(NSCoder *)coder;

@end
