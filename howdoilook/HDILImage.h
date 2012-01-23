//
//  HDILImage.h
//  howdoilook
//
//  How Do I Look? Image
//
//  Created by Charles Fisher on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface HDILImage : NSObject {
    UIImage *_image;
    NSString *_description;
    NSArray *_fashionistas;

    NSString *_fbPostID;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSArray *fashionistas;
@property (nonatomic, retain) NSString *fbPostID;

- (id) initWithFBPostID:(NSString*)fbPostID image:(UIImage*)image description:(NSString*)description fashionistas:(NSArray*)fashionistas;

@end
