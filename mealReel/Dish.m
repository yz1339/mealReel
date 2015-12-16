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
@synthesize writing;
@synthesize recipe;


-(void) addToRecipe:(NSString *)currentStep {
    if([recipe count]>0){
        [recipe addObject: currentStep];
        NSLog(@"Adding");
    }
    else{
        recipe = [[NSMutableArray alloc]init];
        [recipe addObject: currentStep];
        NSLog(@"Initiating");
    }
    
}
-(id) initWithPicture:(UIImage *)image dishname:(NSString*) dName restaurantName: (NSString*) rest address: (NSString*) addr textStore: (NSTextStorage*) textStore andWriting: (NSString*) write {
    if (self = [super init]) {
        self.dishImage = image;
        self.dishName = dName;
        self.restaurant = rest;
        self.address = addr;
        self.textStorage = textStore;
        self.writing = write;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.dishImage];
    [coder encodeObject:self.dishName];
    [coder encodeObject:self.restaurant];
    [coder encodeObject:self.address];
    [coder encodeObject:self.textStorage];
    [coder encodeObject:self.writing];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        dishName = [coder decodeObject];
        dishImage = [coder decodeObject];
        restaurant = [coder decodeObject];
        address = [coder decodeObject];
        textStorage = [coder decodeObject];
        writing = [coder decodeObject];
    }
    return self;
}

@end
