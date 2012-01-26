//
//  FacebookProvider.m
//  howdoilook
//
//  Created by Charles Fisher on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FacebookProvider.h"
#import "FacebookRequest.h"

static NSString *fashionistasFriendsListID = nil;

@implementation FacebookProvider
@synthesize facebook = _facebook;

- (id) initWithFacebook:(Facebook *)facebook {
    self = [super init];

    if (self) {
        self.facebook = facebook;
    }
    
    return self;
}

#pragma mark - API Methods

#pragma mark - Post Image Methods

- (void) postImage:(HDILImage *)hdilImage onCompletion:(FBRequestVoidResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock {

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   kFBAppId, @"app_id",
                                   hdilImage.description, @"message",
                                   hdilImage.image, @"picture",
                                   nil];
    
    FacebookRequest *request = [[FacebookRequest alloc] initWithAPI:@"me/photos" params:params method:@"POST"  facebook:self.facebook onCompletion:^(id result) {
        // TODO store HDILImage
        
        // VOID
        completionBlock();
    } onFailure:failureBlock];
    
    [request start];
    
    [request release];
}

#pragma mark - Get Friends Lists

// TODO common parsing of friends

- (void) getAllFriends:(FBRequestArrayResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock {
    
    FacebookRequest *request = [[FacebookRequest alloc] initWithAPI:@"friends" params:nil method:@"GET" facebook:self.facebook onCompletion:^(id result) {
        // Convert to array
        completionBlock([NSArray array]);
    }onFailure:failureBlock];
    
    [request start];
    
    [request release];
}

// TODO store fashionistas ID

- (void) getFashionistas:(FBRequestArrayResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock {
    FacebookRequest *request = [[FacebookRequest alloc] initWithAPI:[NSString stringWithFormat:@"%@/members", fashionistasFriendsListID] params:nil method:@"GET" facebook:self.facebook onCompletion:^(id result) {
        // Convert to array
        completionBlock([NSArray array]);
    }onFailure:failureBlock];
    
    // Do we know the fashionistas friends list id?
    if (!fashionistasFriendsListID) {
        // get fashionistas friends list id
        FacebookRequest *fashionistasIDRequest = [[FacebookRequest alloc] initWithAPI:[NSString stringWithFormat:@"704747/friendlists", nil] params:nil method:@"GET" facebook:self.facebook onCompletion:^(id result) {
            NSDictionary *friendListsData = (NSDictionary*) result;
            NSArray *friendLists = (NSArray*) [friendListsData objectForKey:@"data"];
            for (NSDictionary *friendList in friendLists) {
                NSString *friendListName = (NSString*) [friendList objectForKey:@"name"];
                
                if ([friendListName isEqualToString:kAppFriendList]) {
                    // Store ID
                    fashionistasFriendsListID = (NSString*) [friendList objectForKey:@"id"];
                    // Update Original API
                    request.api = [NSString stringWithFormat:@"%@/members", fashionistasFriendsListID];
                    [request start];
                    return;
                }
            }
            completionBlock([NSArray array]);
        }onFailure:failureBlock];
        
        [fashionistasIDRequest start];
        [fashionistasIDRequest release];
    }
    
    [request start];
    [request release];    
}

- (void) getFBUID:(FBRequestStringResponse)completionBlock onFailure:(FBRequestErrorResponse)failureBlock {
    // TODO
    completionBlock(@"704747");
}

@end
