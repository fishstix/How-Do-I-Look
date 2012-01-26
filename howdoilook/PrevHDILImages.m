//
//  PrevHDILImages.m
//  howdoilook
//
//  Created by Charles Fisher on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PrevHDILImages.h"

#import "HDILImageCache.h"
#import "HDILImage.h"

@implementation PrevHDILImages (Private)

- (void) addHDILImage:(HDILImage*)image {
    //
}

- (void) initialize:(NSString*) fbuid {
    // Remove all current subviews
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    NSArray *hdilImages = [[HDILImageCache sharedHDILImageCache] getHDILImagesForUser:fbuid];
    for (HDILImage *image in hdilImages) {
        // Add Image to Scroll View
        [self addHDILImage:image];
    }
}

@end

@implementation PrevHDILImages

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}

- (void) setFBUID:(NSString *)fbuid {
    [self initialize:fbuid];
}

@end
