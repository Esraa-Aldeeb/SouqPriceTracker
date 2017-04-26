//
//  Validation.h

//  Created by Esraa Aldeeb on 3/24/15.
//  Copyright (c) 2015 Esraa Aldeeb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidationHelper : NSObject

#pragma mark -
#pragma mark InternetConnection
-(BOOL)checkInternetConnection;

#pragma mark -
#pragma mark TextFieldValidations
-(BOOL)validateIsAllFiledIsFullWithArrayOfStrings:(NSArray*)StringsArray;
-(BOOL)validateIsAllFiledIsFullWithArrayOfTextFields:(NSArray*)textFieldsArray;
#pragma mark -
#pragma mark Email Validation

-(BOOL) checkEmailValidationWithString:(NSString *) emailStr
;
#pragma mark -
#pragma mark Password Validations
-(BOOL)checkOldPasswordValidation:(NSString *)oldPassword
;
-(BOOL)validateOldPasswordWith:(NSString *)oldPassword newPassword:(NSString *) newPassword confirmPassword:(NSString *)confirmPassword textFieldsArray:(NSArray *)textFields;
-(BOOL) checkPasswordValidationWithString:(NSString *) passwordStr;
-(BOOL)validatePasswordNotMatchWithNewPassword:(NSString *)newPassword confirmPassword:(NSString *)confirmPassword;


-(BOOL) validateWithTextFieldsArray:(NSArray *)textFields email:(NSString *)email password:(NSString *)password newPassword:(NSString *)newPassword confirmPassword:(NSString *)confirmPassword;

@end
