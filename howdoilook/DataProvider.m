//
//  DataProvider.m
//  howdoilook
//
//  Created by Charles Fisher on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataProvider.h"

#import "FacebookProvider.h"

@implementation DataProvider(Private)

// Restore User's Session
-(void) restore:(NSString*)fbuid {
    self.fbuid = fbuid;
}

- (void) save {
    
}

// Initialize
- (void) initialize {
    FacebookProvider *fbProvider = [[FacebookProvider alloc] initWithFacebook:self.facebook];
    [fbProvider getFBUID:^(NSString *fbuid) {
        [self restore:fbuid];
    } onFailure:^(NSError *error) {
        // TODO not sure what to do... logout? try again?
        [self.facebook logout];
    }];
    [fbProvider release];
}

@end

@implementation DataProvider
@synthesize facebook = _facebook;
@synthesize images = _images;
@synthesize fbuid = _fbuid;

- (id) initWithFacebook:(Facebook *)facebook {
    self = [super init];
    
    if (self) {
        self.facebook = facebook;
        
        self.fbuid = nil;
        self.images = [NSArray array];
        
        [self initialize];
    }
    
    return self;
}

@end
