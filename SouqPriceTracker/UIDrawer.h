//
//  UIDrawer.h
//
//  Created by Esraa Aldeeb on 3/22/14.
//  Copyright (c) 2014 Esraa Aldeeb. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "TextFieldValidator.h"
#import "AppRefrances.h"

@interface UIDrawer : NSObject{
    
    
    TextFieldValidator *RefTextField;

    
}


-(void)showProgreesInView:(UIView *)view;
-(void)hideProgreesInView:(UIView *)view;
-(void)showDialogWithTitle:(NSString *)title withMessage:(NSString *)message withButton:(NSString *)button;

-(void)showActionSheetInView:(UIView *)view withTitle:(NSString *)Title withButtons:(NSArray *)Buttons withDelegate:(id<UIActionSheetDelegate>)controller;

-(void)hideActionSheetInView:(UIView *)view;
-(void)showMultiDialogTitle:(NSString *)title withMessage:(NSString *)message withYesButton:(NSString *)YesTitle withNoButton:(NSString *)NoTitle
               withDelegate:(id<UIAlertViewDelegate>)controller withTag:(int)alertTag;

-(void)setTableViewBackgroundImage:(UIViewController *)controller TableView:(UITableView *)tableView;

-(BOOL)validateTextFieldsInView:(UIView *)view;
-(void)setAllTextFieldsPresentsView:(UIView *)view;







-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message YesButton:(NSString *)YesButton NoButton:(NSString *)NoButton completionConfirm:(void(^)(void))completion;



@property (nonatomic,strong) void (^onDismissImagePicker)(UIImage *lockUpObject);


@property (nonatomic,strong) void (^onConfirmAlert)();



-(BOOL)isLoadMore:(UIScrollView *)scrollView;
@end
