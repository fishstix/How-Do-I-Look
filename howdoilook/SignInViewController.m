//
//  SignInViewController.m
//  howdoilook
//
//  Created by Charles Fisher on 1/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignInViewController.h"

@implementation SignInViewController

@synthesize facebook = _facebook;

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - HowDoILook Logic

- (IBAction)signin:(id)sender {
    NSArray *permissions = [[NSArray alloc] initWithObjects:@"user_likes", @"read_stream", @"publish_stream", nil];
    [self.facebook authorize:permissions];
}

@end
