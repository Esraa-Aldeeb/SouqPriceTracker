 //
//  LoginViewController.m
//  SouqPriceTracker
//
//  Created by MAC on 4/13/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "LoginViewController.h"
#import "ValidationHelper.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
ValidationHelper *validation;

- (void)viewDidLoad {
    [super viewDidLoad];
    validation =[[ValidationHelper alloc]init];

    //Set TextFieldDelegate
//    self.tfUserName.delegate=self;
//    self.tfPassword.delegate=self;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Action

- (IBAction)loginTapped:(id)sender {
  
    
    if (![self isValidToLogin]){
        [AppDrawer showAlertWithTitle:nil  withMessage:@"Please fill all required fields" withButton:@"Ok"];
        return;
    }
    else{
    [self performSegueWithIdentifier:@"loginToProductTypes" sender:self];
    }

}



-(BOOL)isValidToLogin{
    
    
    if (![self.tfUserName validate]){
        
        return NO;
    }else if (![self.tfPassword validate]){
        return NO;
        
    }
    
    return YES;
}


#pragma mark - TextField Delegates
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
@end
