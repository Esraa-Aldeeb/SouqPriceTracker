//
//  LoginViewController.h
//  SouqPriceTracker
//
//  Created by MAC on 4/13/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
//Outlets
@property (strong, nonatomic) IBOutlet TextFieldValidator *tfUserName;
@property (strong, nonatomic) IBOutlet TextFieldValidator *tfPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIImageView *imgloginLogo;

//Action
- (IBAction)loginTapped:(id)sender;


@end
