//
//  DataProvider.h
//  howdoilook
//
//  Created by Charles Fisher on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Facebook.h"

// Initialization Delegate?

@interface DataProvider : NSObject {
    Facebook *_facebook;
    
    // Data
    NSString *_fbuid;
    NSArray *_images; // HDIL Images
}

@property (nonatomic, retain) Facebook *facebook;

// Data
@property (nonatomic, retain) NSString *fbuid;
@property (nonatomic, retain) NSArray *images;


- (id) initWithFacebook:(Facebook*)facebook;

@end
