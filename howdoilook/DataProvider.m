//
//  DataProvider.m
//  howdoilook
//
//  Created by Charles Fisher on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataProvider.h"

@implementation DataProvider(Private)

// Restore User's Session
-(void) restore {
    
}

- (void) save {
    
}

@end

@implementation DataProvider
@synthesize facebook = _facebook;
@synthesize images = _images;

- (id) initWithFacebook:(Facebook *)facebook {
    self = [super init];
    
    if (self) {
        self.facebook = facebook;
        
        [self restore];
    }
    
    return self;
}

@end
