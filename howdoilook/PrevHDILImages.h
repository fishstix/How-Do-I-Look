//
//  PrevHDILImages.h
//  howdoilook
//
//  Created by Charles Fisher on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrevHDILImages : UIScrollView

/**
 *  Tell's the View which user is currently logged in to grab that user's HDILImage History
 *
 *  This will update the view
 */
- (void) setFBUID:(NSString*)fbuid;

@end
