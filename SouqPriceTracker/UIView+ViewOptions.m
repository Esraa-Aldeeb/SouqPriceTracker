//
//  UIView+ViewOptions.m
//  SouqPriceTracker
//
//  Created by Esraa Mac on 19/4/17.
//  Copyright © 2017 Souq. All rights reserved.
//

#import "UIView+ViewOptions.h"

@implementation UIView (ViewOptions)
@dynamic borderColor,borderWidth,cornerRadius,rectCorners;

-(void)setBorderColor:(UIColor *)borderColor{
    [self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(NSInteger)borderWidth{
    [self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(NSInteger)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
}
-(void)setAppGradientBackground{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    //    gradient.colors = [NSArray arrayWithObjects:(id)[APP_COLOR CGColor], (id)[APP_COLOR CGColor],(id)[[UIColor blackColor] CGColor], nil];
    [self.layer insertSublayer:gradient atIndex:0];
}
-(void)setRectCorners:(UIRectCorner)rectCorners{
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorners cornerRadii:CGSizeMake(5.0, 5.0)];
    
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
    
}
@end
