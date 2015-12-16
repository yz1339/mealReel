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


-(id) initWithPicture:(UIImage *)image dishname:(NSString*) dName restaurantName: (NSString*) rest address: (NSString*) addr andWriting: (NSTextStorage*) textStore;



@end
