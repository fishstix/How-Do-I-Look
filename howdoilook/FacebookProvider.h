//
//  FacebookProvider.h
//  howdoilook
//
//  Object for handling FB API Calls
//
//  Created by Charles Fisher on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Facebook.h"

#import "HDILImage.h"

typedef void (^FBRequestErrorResponse)(NSError *error);
typedef void (^FBRequestVoidResponse)();
typedef void (^FBRequestArrayResponse)(NSArray *items);
typedef void (^FBRequestStringResponse)(NSString *str);

@interface FacebookProvider : NSObject {
    @private
    Facebook *_facebook;
}

@property (nonatomic, retain) Facebook *facebook;

- (id) initWithFacebook:(Facebook*)facebook;

// API Methods
// Post
- (void) postImage:(HDILImage*)image onCompletion:(FBRequestVoidResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock;

// Access Friends
- (void) getAllFriends:(FBRequestArrayResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock;
- (void) getFashionistas:(FBRequestArrayResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock;

// Access User
- (void) getFBUID:(FBRequestStringResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock;

@end
