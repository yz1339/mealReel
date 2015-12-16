//
//  Dish.h
//  mealReel
//
//  Created by Yating Zhan on 12/12/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

/*
 *This object contains the dish information which is gathered from the writing and info views, and is
 *stored for later use in the pictureViewController.
 */
@interface Dish : NSObject

@property (strong, nonatomic) UIImage* dishImage;
@property(nonatomic, readwrite, strong) NSTextStorage *textStorage;
@property (strong, nonatomic) NSString* dishName;
@property (strong, nonatomic) NSString* restaurant;
@property (strong, nonatomic) NSString* address;
@property (strong, nonatomic) NSString* writing;
@property (strong, nonatomic) NSMutableArray* recipe;

-(void) addToRecipe:(NSString *)currentStep;

-(id) initWithPicture:(UIImage *)image dishname:(NSString*) dName restaurantName: (NSString*) rest address: (NSString*) addr textStore: (NSTextStorage*) textStore andWriting: (NSString*) write;

- (void)encodeWithCoder:(NSCoder *)coder;

- (id)initWithCoder:(NSCoder *)coder;

@end
