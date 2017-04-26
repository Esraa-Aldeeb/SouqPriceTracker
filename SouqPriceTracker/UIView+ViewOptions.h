//
//  UIView+ViewOptions.h
//  SouqPriceTracker
//
//  Created by Esraa Mac on 19/4/17.
//  Copyright © 2017 Souq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewOptions)
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable NSInteger cornerRadius;
@property (nonatomic) IBInspectable UIRectCorner rectCorners;
@end
