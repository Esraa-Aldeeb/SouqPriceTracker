//
//  UIDrawer.m
//
//  Created by Esraa Aldeeb on 3/22/14.
//  Copyright (c) 2014 Esraa Aldeeb. All rights reserved.
//

#import "UIDrawer.h"

@implementation UIDrawer

-(void)showProgreesInView:(UIView *)view
{
    UIActivityIndicatorView *wait = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    wait.color = [UIColor blackColor];
    wait.center= view.center;
    wait.tag = 100;
    
    [wait startAnimating];
    [view addSubview:wait];
    
    
    
}
-(void)hideProgreesInView:(UIView *)view
{
    UIView *removeView;
    while((removeView = [view viewWithTag:100]) != nil) {
        [removeView removeFromSuperview];
    }
}

-(void)showDialogWithTitle:(NSString *)title withMessage:(NSString *)message withButton:(NSString *)button
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:button
                                              otherButtonTitles:nil];
    [alertView show];
    
    
    
    

}
- (BOOL) isKeyboardOnScreen
{
    BOOL isKeyboardShown = NO;
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if (windows.count > 1) {
        NSArray *wSubviews =  [windows[1]  subviews];
        if (wSubviews.count) {
            CGRect keyboardFrame = [wSubviews[0] frame];
            CGRect screenFrame = [windows[1] frame];
            if (keyboardFrame.origin.y+keyboardFrame.size.height == screenFrame.size.height) {
                isKeyboardShown = YES;
            }
        }
    }
    
    return isKeyboardShown;
}


-(void)showActionSheetInView:(UIView *)view withTitle:(NSString *)Title withButtons:(NSArray *)Buttons withDelegate:(id<UIActionSheetDelegate>)controller
{
    
    
    NSString *cancel = @"";
    
        cancel = @"Cancel";
   
    
    UIActionSheet *PoPUp = [[UIActionSheet alloc] initWithTitle: Title
                                                       delegate: controller
                                              cancelButtonTitle: cancel
                                         destructiveButtonTitle: nil
                                              otherButtonTitles: nil];
    
    PoPUp.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    
    
    for (int i = 0 ; i<Buttons.count ; i++)
    {
        [PoPUp addButtonWithTitle:[Buttons objectAtIndex:i]];
    }
   
  

 
    
 

    
    
    [PoPUp showInView:view];
}
-(void)hideActionSheetInView:(UIView *)view
{
    UIView *removeView;
    while((removeView = [view viewWithTag:99]) != nil) {
        [removeView removeFromSuperview];
    }
}
-(void)showMultiDialogTitle:(NSString *)title withMessage:(NSString *)message withYesButton:(NSString *)YesTitle withNoButton:(NSString *)NoTitle
               withDelegate:(id<UIAlertViewDelegate>)controller withTag:(int)alertTag
{
    UIAlertView *alert = [[UIAlertView alloc]
                            initWithTitle: title
                            message: message
                            delegate: controller
                            cancelButtonTitle: NoTitle
                            otherButtonTitles: YesTitle, nil];
    
    alert.tag = alertTag;
    [alert show];

}




-(void)setTableViewBackgroundImage:(UIViewController *)controller TableView:(UITableView *)tableView
{
    UIImageView *backgroundView =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    backgroundView.frame = CGRectMake(0,
                                      0,
                                      controller.navigationController.view.frame.size.width,
                                      controller.navigationController.view.frame.size.height);
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    [controller.navigationController.view insertSubview:backgroundView atIndex:0];
    tableView.backgroundColor = [UIColor clearColor];
}

-(BOOL)validateTextFieldsInView:(UIView *)view{
    
    
    NSArray *AllViews = view.subviews;
    
    for (UIView *v in AllViews){
        
        
        if ([v isMemberOfClass:[TextFieldValidator class]]){
            
            TextFieldValidator *text = (TextFieldValidator *)v;
            if (! [text validate])
                return NO;
            
        }
        else if ([v isMemberOfClass:[UIView class]]){
            [self validateTextFieldsInView:v];
        }
        else if ([v isMemberOfClass:[UIScrollView class]]){
            [self validateTextFieldsInView:v];
        }
        
        
    }
    
    return YES;
}
-(void)setAllTextFieldsPresentsView:(UIView *)view{
    
    
    NSArray *AllViews = view.subviews;
    
    for (UIView *v in AllViews){
        
        
        if ([v isMemberOfClass:[TextFieldValidator class]]){
            
            TextFieldValidator *text = (TextFieldValidator *)v;
            text.presentInView = view;
            
        }
        else if ([v isKindOfClass:[UIView class]]){
            [self setAllTextFieldsPresentsView:v];
        }
        else if ([v isKindOfClass:[UIScrollView class]]){
            [self setAllTextFieldsPresentsView:v];
        }
        
        
    }
    
}






-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message YesButton:(NSString *)YesButton NoButton:(NSString *)NoButton completionConfirm:(void(^)(void))completion{
    
    
    self.onConfirmAlert = completion;
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: title
                          message: message
                          delegate: self
                          cancelButtonTitle: NoButton
                          otherButtonTitles: YesButton, nil];
    
    
    [alert show];
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1){
        
        self.onConfirmAlert();
        
    }
    
}


-(BOOL)isLoadMore:(UIScrollView *)scrollView{
    
    
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    float reload_distance = 10;
    if(y > h + reload_distance) {
        NSLog(@"load more rows");
        
        return YES;
    }else{
        return NO;
    }
}
@end
