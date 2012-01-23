//
//  FacebookRequest.h
//  howdoilook
//
//  Created by Charles Fisher on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FacebookProvider.h"

typedef void (^FBRequestIDResponse)(id result);

@interface FacebookRequest : NSObject {
    Facebook *_facebook;
    NSString *_api;
    NSDictionary *_params;
    NSString *_method;
    FBRequestIDResponse _completionBlock;
    FBRequestErrorResponse _failureBlock;
}

@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, retain) NSString *api;
@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) NSString *method;

@property (nonatomic, copy) FBRequestIDResponse completionBlock;
@property (nonatomic, copy) FBRequestErrorResponse failureBlock;

- (id) initWithAPI:(NSString*)api params:(NSDictionary*)params method:(NSString*)method  facebook:(Facebook*)facebook onCompletion:(FBRequestIDResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock;

- (void) start;

@end
