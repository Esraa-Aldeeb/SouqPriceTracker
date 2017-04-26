//
//  AppDrawer.m
//  SouqPriceTracker
//
//  Created by Esraa Mac on 18/4/17.
//  Copyright © 2017 Souq. All rights reserved.

//

#import "AppDrawer.h"

@implementation AppDrawer
+(BOOL)isLoadMore:(UIScrollView *)scrollView{
    
    
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


+(void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)message withButton:(NSString *)button
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:button
                                              otherButtonTitles:nil];
    [alertView show];
    
    
    
    
    
}



@end
