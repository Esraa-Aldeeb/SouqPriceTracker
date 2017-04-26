//
//  UIImageView+ImageViewOptions.m
//  SouqPriceTracker
//
//  Created by Esraa Mac on 19/4/17.
//  Copyright © 2017 Souq. All rights reserved.
//

#import "UIImageView+ImageViewOptions.h"

@implementation UIImageView (ImageViewOptions)

-(void)imageWithUrl:(NSString *)imageUrl{
    
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicatorView.center = self.center;
    [self.superview addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    [self setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]]
                     placeholderImage:self.image
                              success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                  
                                  [activityIndicatorView removeFromSuperview];
                                  
                                  // do image resize here
                                  
                                  // then set image view
                                  
                                  self.image = image;
                              }
                              failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                  [activityIndicatorView removeFromSuperview];
                                  
                                  // do any other error handling you want here
                              }];
    
}
@end
