//
//  AppDelegate.h
//  howdoilook
//
//  Created by Charles Fisher on 1/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MasterViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    MasterViewController *_masterController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) MasterViewController *masterController;

@end
