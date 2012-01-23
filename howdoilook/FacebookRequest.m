//
//  FacebookRequest.m
//  howdoilook
//
//  Created by Charles Fisher on 1/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FacebookRequest.h"

#import "Facebook.h"

@interface FacebookRequest() <FBRequestDelegate>
@end

@implementation FacebookRequest
@synthesize facebook = _facebook;
@synthesize api = _api;
@synthesize params = _params;
@synthesize method = _method;

@synthesize completionBlock = _completionBlock;
@synthesize failureBlock = _failureBlock;

- (id) initWithAPI:(NSString *)api params:(NSDictionary *)params method:(NSString *)method facebook:(Facebook *)facebook onCompletion:(FBRequestIDResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock {
    self = [super init];
    
    if (self) {
        self.api = api;
        self.params = params;
        self.method = method;
        self.facebook = facebook;
        
        self.completionBlock = completionBlock;
        self.failureBlock = failureBlock;
    }
    
    return self;
}

#pragma mark - Start

- (void) start {
    [self.facebook requestWithGraphPath:self.api andParams:[NSMutableDictionary dictionaryWithDictionary:self.params] andHttpMethod:self.method andDelegate:self];
}


#pragma mark - Request

- (void) request:(FBRequest *)request didLoadRawResponse:(NSData *)data {
    NSString *rawResponseStr = [NSString stringWithUTF8String:[data bytes]];
    NSLog(@"Response: %@", rawResponseStr);
}

- (void)request:(FBRequest *)request didLoad:(id)result {
    self.completionBlock(result);
}

- (void)request:(FBRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"%@", [error localizedDescription]);
    NSLog(@"Err details: %@", [error description]);
    self.failureBlock(error);
}

#pragma mark - Dealloc

- (void) dealloc {
    [_api release];
    [_params release];
    [_method release];
    [_facebook release];
    
    [super dealloc];
}


@end
