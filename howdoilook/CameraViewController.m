//
//  CameraViewController.m
//  howdoilook
//
//  Created by Charles Fisher on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

#import "ConfirmViewController.h"

@interface CameraViewController() <UIImagePickerControllerDelegate>
@end

@implementation CameraViewController

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

- (IBAction)takePicture:(id)sender {
    // Take the picture
    NSLog(@"Take the Picture");
    
    // Create image picker controller
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // Set source to the camera
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
    // Delegate is self
    imagePicker.delegate = self;
    
    // Allow editing of image ?
    //imagePicker.allowsImageEditing = NO;
    
    // Show image picker
    [self presentModalViewController:imagePicker animated:YES];	
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
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
    
    // Dismiss the camera
    [self dismissModalViewControllerAnimated:YES];
}

@end
