//
//  Dish.h
//  mealReel
//
//  Created by Yating Zhan on 12/12/15.
//  Copyright © 2015 Yating Zhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Dish : NSObject

@property UIImage* dishImage;
@property NSString* writing;
@property NSString* dishName;
@property NSString* restaurant;
@property NSString* address;


-(id) initWithPicture: (UIImage*) image;



@end
