//
//  ConfirmViewController.m
//  howdoilook
//
//  Created by Charles Fisher on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfirmViewController.h"

@interface ConfirmViewController() <FBDialogDelegate, FBRequestDelegate>
@end

@implementation ConfirmViewController

@synthesize image = _image;
@synthesize imageView = _imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imageView.image = self.image;
}

#pragma mark - HowDoILook Logic

- (IBAction)confirm:(id)sender {
    // Post
    NSLog(@"Post to FB");
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   kFBAppId, @"app_id",
                                   @"Hey Buddy!", @"message",
                                   self.image, @"picture",
                                   nil];
    [self.facebook requestWithGraphPath:@"me/photos"
                                    andParams:params
                                andHttpMethod:@"POST"
                                  andDelegate:self];
    
    
    NSMutableDictionary *params_ = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    kFBAppId, @"app_id",
                                    @"", @"link",
                                    @"", @"picture",
                                    kAppTitle, @"name",
                                    @"Get feedback on how you're looking", @"caption",
                                    @"So how DO you look?", @"description",
                                    @"How Do I Look?", @"message",
                                    nil];

//    [self.facebook dialog:@"feed" andParams:params andDelegate:self];
}

#pragma mark - Facebook

#pragma mark - Dialog

- (void) dialogDidComplete:(FBDialog *)dialog {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) dialogDidNotComplete:(FBDialog *)dialog {
    [[[UIAlertView alloc] initWithTitle:nil message:@"Uh Oh!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}

#pragma mark - Request

- (void)request:(FBRequest *)request didLoad:(id)result {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
