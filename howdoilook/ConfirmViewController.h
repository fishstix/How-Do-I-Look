//
//  ConfirmViewController.h
//  howdoilook
//
//  Created by Charles Fisher on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InProcessViewController.h"

@interface ConfirmViewController : InProcessViewController {
    UIImage *_image;
    
    UIImageView *_imageView;
}

@property (nonatomic, retain) UIImage *image;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (IBAction)confirm:(id)sender;

@end
