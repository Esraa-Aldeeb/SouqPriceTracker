    //
    //  Validation.m
    //  Created by Esraa Aldeeb on 3/24/15.
    //  Copyright (c) 2016 Esraa Aldeeb. All rights reserved.
    //

#import "ValidationHelper.h"
#import "LoginViewController.h"
#import "AFNetworkReachabilityManager.h"

@implementation ValidationHelper

-(BOOL)checkInternetConnection {
    __block BOOL reachable;
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"No Internet Connection");
                reachable = NO;
               
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                
                reachable = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G");
                               reachable = YES;
                break;
            default:
                NSLog(@"Unkown network status");
                                reachable = NO;
                
                break;
        }
    }];
    
    if ([[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi]) {
    } else if ([[AFNetworkReachabilityManager sharedManager] isReachableViaWWAN]) {
    } else { // unknown
    }
    
    BOOL isConnected = [AFNetworkReachabilityManager sharedManager].reachable;
    
    return isConnected;
}

#pragma mark -
#pragma mark TextFieldValidation


-(BOOL)validateIsAllFiledIsFullWithArrayOfStrings:(NSArray*)StringsArray
{
    if (!StringsArray) {
        return YES;
    }
    
    for (NSString *currentString in StringsArray) {
        if ([currentString isEqualToString:@""]) {
           
            return NO;
        }
    }
    
    return YES;
}

-(BOOL)validateIsAllFiledIsFullWithArrayOfTextFields:(NSArray*)textFieldsArray {
    if (!textFieldsArray) {
        return YES;
    }
    
    NSMutableArray *c = [[NSMutableArray alloc] init];
    
    for (UITextField *tf in textFieldsArray) {
        [c addObject:tf.text];
    }
    
//    return [self validateIsAllFiledIsFullWithArray:c];
     return [self validateIsAllFiledIsFullWithArrayOfStrings:c];
}

#pragma mark -
#pragma mark Email Validation

-(BOOL) checkEmailValidationWithString:(NSString *) emailStr
{
    if (!emailStr) {
        return YES;
    }
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailTest evaluateWithObject:emailStr]) {
        
        
        return NO;
    }
    
    return YES;
}

-(BOOL) emailValidationWithTextField :(UITextField *) textfield {
    if (!textfield) {
        return YES;
    }
    
    return [self checkEmailValidationWithString:textfield.text];
}


-(BOOL) validateWithTextFieldsArray:(NSArray *)textFields email:(NSString *)email password:(NSString *)password newPassword:(NSString *)newPassword confirmPassword:(NSString *)confirmPassword {
    if ([self checkInternetConnection]) {
        if ([self validateIsAllFiledIsFullWithArrayOfTextFields:textFields]) {
            if ([self checkEmailValidationWithString:email]) {
                if ([self checkPasswordValidationWithString:password]) {
                    if ([self validatePasswordNotMatchWithNewPassword:newPassword confirmPassword:confirmPassword]) {
                        return YES;
                    } else {
                        return NO;
                    }
                } else {
                    return NO;
                }
            } else {
                return NO;
            }
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

-(BOOL)validateOldPasswordWith:(NSString *)oldPassword newPassword:(NSString *) newPassword confirmPassword:(NSString *)confirmPassword textFieldsArray:(NSArray *)textFields  {
    if ([self validateWithTextFieldsArray:textFields email:nil password:nil newPassword:newPassword confirmPassword:confirmPassword] && [self checkOldPasswordValidation:oldPassword]) {
        return YES;
    }
    
    return NO;
}

@end
