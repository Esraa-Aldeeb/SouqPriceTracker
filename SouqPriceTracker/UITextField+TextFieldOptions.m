//
//  UITextField+TextFieldOptions.m
//  SouqPriceTracker
//
//  Created by Esraa Mac on 19/4/17.
//  Copyright © 2017 Souq. All rights reserved.
//

#import "UITextField+TextFieldOptions.h"

@implementation UITextField (TextFieldOptions)
@dynamic leftViewImage,placeholderColor;
-(void)setLeftViewImage:(UIImage *)leftViewImage{
    
    //    self.leftView = [[UIImageView alloc]initWithImage:leftViewImage];
    //    self.leftViewMode = UITextFieldViewModeAlways;
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:leftViewImage];
    
    CGRect frame =imgView.frame;
    frame.origin.x = 17-frame.size.width/2;
    frame.origin.y = 17-frame.size.height/2;
    imgView.frame = frame;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)];
    [paddingView addSubview:imgView];
    [self setLeftViewMode:UITextFieldViewModeAlways];
    [self setLeftView:paddingView];
    
}


-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    
}
@end
