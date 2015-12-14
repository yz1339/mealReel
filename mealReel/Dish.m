//
//  Dish.m
//  mealReel
//
//  Created by Yating Zhan on 12/12/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import "Dish.h"

@implementation Dish

@synthesize dishImage;
@synthesize writing;
@synthesize dishName;
@synthesize restaurant;
@synthesize address;

-(id) initWithPicture:(UIImage *)image {
    if (self = [super init]) {
        self.dishImage = image;
    }
    return self;
}

@end
