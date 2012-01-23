//
//  HDILImage.m
//  howdoilook
//
//
//  Created by Charles Fisher on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HDILImage.h"

@implementation HDILImage
@synthesize image = _image;
@synthesize description = _description;
@synthesize fashionistas = _fashionistas;
@synthesize fbPostID = _fbPostID;

- (id) initWithFBPostID:(NSString *)fbPostID image:(UIImage *)image description:(NSString *)description fashionistas:(NSArray *)fashionistas {
    self = [super init];
    
    if (self) {
        self.fbPostID = fbPostID;
        
        self.image = image;
        self.fashionistas = fashionistas;
        self.description = description;
    }
    
    return self;
}

@end
