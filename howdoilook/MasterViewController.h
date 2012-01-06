//
//  MasterViewController.h
//  howdoilook
//
//  Created by Charles Fisher on 1/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FBConnect.h"

@interface MasterViewController : NSObject {
    Facebook *_facebook;
    
    UINavigationController *_rootNavigationController;
}

@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, retain) UINavigationController *rootNavigationController;

- (id) initWithRootNavigationController:(UINavigationController*)navController;

@end
