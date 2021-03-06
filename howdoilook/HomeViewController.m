//
//  HomeViewController.m
//  howdoilook
//
//  Created by Charles Fisher on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

#import "ConfirmViewController.h"

@interface HomeViewController() <UIImagePickerControllerDelegate>
@end

@implementation HomeViewController

@synthesize facebook = _facebook;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Logout
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = logoutButton;
    [logoutButton release];
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

- (IBAction)takePicture:(id)sender {
    // No Camera?
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [[[UIAlertView alloc] initWithTitle:nil message:@"Camera Required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
        
    // Take the picture
    NSLog(@"Take the Picture");

    // Create image picker controller
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
    // Set source to the camera
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
    // Front
    imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    // Delegate is self
    imagePicker.delegate = self;
        
    // Allow editing of image ?
    //imagePicker.allowsImageEditing = NO;
        
    // Show image picker
    [self presentModalViewController:imagePicker animated:YES];	
}
    
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Access the uncropped image from info dictionary
    UIImage *image = [UIImage imageWithData:UIImageJPEGRepresentation([info objectForKey:@"UIImagePickerControllerOriginalImage"], 0.0f)];
        
    // Pass the image from camera to method that will email the same
    // A delay is needed so camera view can be dismissed
    //    [self performSelector:@selector(emailImage:) withObject:image afterDelay:1.0];
    
    // Release picker
    [picker release];
    
    // Move on to Confirm
    ConfirmViewController *confirmController = [[ConfirmViewController alloc] initWithNibName:@"ConfirmViewController" bundle:nil];
    confirmController.facebook = self.facebook;
    confirmController.image = image;
    [self.navigationController pushViewController:confirmController animated:NO];
    [confirmController release];
        
    // Dismiss the camera
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)logout:(id)sender {
    [self.facebook logout];
}

#pragma mark - Dealloc

- (void) dealloc {
    [_facebook release];
    
    [super dealloc];
}

@end
