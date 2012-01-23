//
//  FBPerson.m
//  howdoilook
//
//  Created by Charles Fisher on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FBPerson.h"

@implementation FBPerson
@synthesize imageUrl = _imageUrl;
@synthesize name = _name;
@synthesize fbuid = _fbuid;

- (id) initWithFBUID:(NSString *)fbuid name:(NSString *)name imageUrl:(NSString *)imageUrl {
    self = [super init];
    
    if (self) {
        self.fbuid = fbuid;
        self.name = name;
        self.imageUrl = imageUrl;
    }
    
    return self;
}

@end
