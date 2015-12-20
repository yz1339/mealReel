//
//  User.m
//  mealReel
//
//  Created by Alexandra Serralta on 12/14/15.
//  Copyright © 2015 Alexandra Serralta. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize album;
@synthesize username;
@synthesize avatar;


-(void) addToAlbum:(Dish *)currentDish{
    if([album count]>0){
         [album addObject: currentDish];
    }
    else{
        album = [[NSMutableArray alloc]init];
        [album addObject: currentDish];
    }
   
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        album = [coder decodeObjectForKey:@"FirstUserAlbum"];
        username = [coder decodeObjectForKey:@"FirstUserName"];
        avatar = [coder decodeObjectForKey:@"FirstUserImage"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.album forKey:@"FirstUserAlbum"];
    [coder encodeObject:self.username forKey:@"FirstUserName"];
    [coder encodeObject:self.avatar forKey:@"FirstUserImage"];

}

@end
