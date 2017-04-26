//
//  AppDrawer.h
//  SouqPriceTracker
//
//  Created by Esraa Mac on 18/4/17.
//  Copyright © 2017 Souq. All rights reserved.//

#import <Foundation/Foundation.h>

@interface AppDrawer : NSObject<UIAlertViewDelegate>
+(BOOL)isLoadMore:(UIScrollView *)scrollView;
+(void)showAlertWithTitle:(NSString *)title withMessage:(NSString *)message withButton:(NSString *)button;
@end
