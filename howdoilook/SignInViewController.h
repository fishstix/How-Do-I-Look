//
//  SignInViewController.h
//  howdoilook
//
//  Created by Charles Fisher on 1/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FBConnect.h"

@interface SignInViewController : UIViewController {
    Facebook *_facebook;
}

@property (nonatomic, retain) Facebook *facebook;

- (IBAction)signin:(id)sender;

@end
