//
//  HDILImageCache.h
//  howdoilook
//
//  Created by Charles Fisher on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HDILImage.h"

@interface HDILImageCache : NSObject

// Singleton
+ (id) sharedHDILImageCache;

- (id) saveHDILImage:(HDILImage*) forUser:(NSString*)fbuid;
- (NSArray*) getHDILImagesForUser:(NSString*)fbuid;

@end
