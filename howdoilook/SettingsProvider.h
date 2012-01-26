//
//  SettingsProvider.h
//  howdoilook
//
//  Holds User's Settings
//
//  Created by Charles Fisher on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsProvider : NSObject

/**
 *  Front View vs. Rear View Setting
 */
@property (nonatomic, assign) UIImagePickerControllerSourceType defaultCamera;

@end
