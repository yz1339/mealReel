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

@property (strong, nonatomic) UIImage* dishImage;
@property (strong, nonatomic) NSString* writing;
@property (strong, nonatomic) NSString* dishName;
@property (strong, nonatomic) NSString* restaurant;
@property (strong, nonatomic) NSString* address;


-(id) initWithPicture: (UIImage*) image;



@end
