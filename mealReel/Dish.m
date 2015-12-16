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
@synthesize textStorage;
@synthesize dishName;
@synthesize restaurant;
@synthesize address;

/*
 * inWithPicture:
 * Here we initialize the picture and dish that is taken and created in the primary view, so it may be sent late
 * to the pictureView.
 */
-(id) initWithPicture:(UIImage *)image dishname:(NSString*) dName restaurantName: (NSString*) rest address: (NSString*) addr andWriting: (NSTextStorage*) textStore {
    if (self = [super init]) {
        self.dishImage = image;
        self.dishName = dName;
        self.restaurant = rest;
        self.address = addr;
        self.textStorage = textStore;
    }
    return self;
}

@end
