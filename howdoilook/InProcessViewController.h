//
//  InProcessViewController.h
//  howdoilook
//
//  Created by Charles Fisher on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HowDoILookViewController.h"
#import "FBConnect.h"

@interface InProcessViewController : HowDoILookViewController {
    Facebook *_facebook;
}

@property (nonatomic, retain) Facebook *facebook;

@end
