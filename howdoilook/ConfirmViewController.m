//
//  ConfirmViewController.m
//  howdoilook
//
//  Created by Charles Fisher on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfirmViewController.h"

#import "FacebookProvider.h"
#import "MBProgressHUD.h"

@interface ConfirmViewController() <FBDialogDelegate, FBRequestDelegate>
@end

@implementation ConfirmViewController

@synthesize image = _image;
@synthesize imageView = _imageView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imageView.image = self.image;
}

#pragma mark - HowDoILook Logic

- (IBAction)confirm:(id)sender {
    // Loading Screen
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:hud];
    [hud show:YES];
    [hud release];
    
    // Post
    NSLog(@"Post to FB");
    
    HDILImage *hdilImage = [[HDILImage alloc] initWithFBPostID:nil image:self.image description:kDefaultImgDescription fashionistas:[NSArray array]];
    
    FacebookProvider *fbProvider = [[FacebookProvider alloc] initWithFacebook:self.facebook];
    [fbProvider postImage:hdilImage onCompletion:^() {
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }onFailure:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        NSString *message = [error localizedDescription];
        
        UIAlertView *failureMsg = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [failureMsg show];
        [failureMsg release];
    }];

    [hdilImage release];
//    NSMutableDictionary *params_ = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                    kFBAppId, @"app_id",
//                                    @"", @"link",
//                                    @"", @"picture",
//                                    kAppTitle, @"name",
//                                    @"Get feedback on how you're looking", @"caption",
//                                    @"So how DO you look?", @"description",
//                                    @"How Do I Look?", @"message",
//                                    nil];

//    [self.facebook dialog:@"feed" andParams:params andDelegate:self];
}


#pragma mark - Dealloc

- (void) dealloc {
    [_image release];
    
    [_imageView release];
    
    [super dealloc];
}

 @end
