//
//  FBPerson.h
//  howdoilook
//
//  Created by Charles Fisher on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBPerson : NSObject {
    NSString *_imageUrl;
    NSString *_name;
    NSString *_fbuid;
}

@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *fbuid;

- (id) initWithFBUID:(NSString*)fbuid name:(NSString*)name imageUrl:(NSString*)imageUrl;

@end
