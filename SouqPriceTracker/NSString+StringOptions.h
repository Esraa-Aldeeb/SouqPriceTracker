//
//  NSString+StringOptions.h
//  MyUJ
//
//  Created by Esraa Mac on 7/24/15.
//  Copyright (c) 2015 Esraa Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringOptions)
- (BOOL)containsString:(NSString *)string;
-(NSString *)trimString;
-(BOOL)isEmptyString;
-(CGFloat)heightWithFont:(UIFont *)font minimumHieght:(CGFloat)minHieght;
@end
