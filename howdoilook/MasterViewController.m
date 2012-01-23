//
//  MasterViewController.m
//  howdoilook
//
//  Created by Charles Fisher on 1/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

#import "SignInViewController.h"
#import "HomeViewController.h"

@interface MasterViewController() <FBSessionDelegate>
/**
 *  Initial set up of app, if FB signed in, display Home, otherwise show Splash
 */
- (void) initialize;

//
- (void) openSignIn;
- (void) openHome;
@end

@implementation MasterViewController(Private)

- (void) defaultFadeOut {
//    splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
//    splashView.image = [UIImage imageNamed:@"Default.png"];
//    [window addSubview:splashView];
//    [window bringSubviewToFront:splashView];
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
//    [UIView setAnimationDelegate:self]; 
//    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
//    splashView.alpha = 0.0;
//    [UIView commitAnimations];
}

@end

@implementation MasterViewController

@synthesize facebook = _facebook;
@synthesize rootNavigationController = _rootNavigationController;

- (id) initWithRootNavigationController:(UINavigationController *)navController {
    self = [super init];
    
    if (self) {
        // Set Pointer to App's RootNavController that this object will control
        self.rootNavigationController = navController;
        
        // Set Up FB
        self.facebook = [[[Facebook alloc] initWithAppId:kFBAppId andDelegate:self] autorelease];
        [self initialize];
    }
    
    return self;
}

- (void) initialize {
    // Restore
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] 
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        self.facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        self.facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    // Check
    if (![self.facebook isSessionValid]) {
        // Auto Login?
        //[self.facebook authorize:nil];
        // Show Splash
        [self openSignIn];
    } else {
        [self openHome];
    }
    
    // Fade from Default
    [self defaultFadeOut];
}

#pragma mark - HowDoILook Logic

- (void) openSignIn {
    // Update Views
    SignInViewController *signInController = [[SignInViewController alloc] initWithNibName:@"SignInViewController" bundle:nil];
    signInController.facebook = self.facebook;
    UIViewController *prevController = [self.rootNavigationController.viewControllers lastObject];
    
    [self.rootNavigationController setViewControllers:[NSArray arrayWithObjects:signInController, prevController, nil ] animated:NO];
    [self.rootNavigationController popToRootViewControllerAnimated:YES];
    [signInController release];
}

- (void) openHome {
    // Update Views
    HomeViewController *homeController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    homeController.facebook = self.facebook;
    [self.rootNavigationController setViewControllers:[NSArray arrayWithObject:homeController] animated:YES];
    [homeController release];
}

#pragma mark - Facebook

- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self.facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[self.facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    [self openHome];
}

- (void) fbDidLogout {
    // Remove saved authorization information if it exists
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]) {
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        [defaults synchronize];
    }
    
    [self openSignIn];
}

@end
