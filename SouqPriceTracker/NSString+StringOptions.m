//
//  NSString+StringOptions.m
//  MyUJ
//
//  Created by Esraa Mac on 7/24/15.
//  Copyright (c) 2015 Esraa Mac. All rights reserved.
//

#import "NSString+StringOptions.h"

@implementation NSString (StringOptions)
- (BOOL)containsString:(NSString *)string
               options:(NSStringCompareOptions)options {
    NSRange rng = [self rangeOfString:string options:options];
    return rng.location != NSNotFound;
}

- (BOOL)containsString:(NSString *)string {
    return [self containsString:string options:0];
}
-(NSString *)trimString{
    return  [self stringByTrimmingCharactersInSet:
             [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


-(BOOL)isEmptyString{
    
    if ( [[self stringByTrimmingCharactersInSet:
          [NSCharacterSet whitespaceAndNewlineCharacterSet]]isEqualToString:@""])
        return YES;
    else
        return NO;
    
}

-(CGFloat)heightWithFont:(UIFont *)font minimumHieght:(CGFloat)minHieght{
 
    
    
    
    CGSize textSize = { [[UIScreen mainScreen] bounds].size.width, CGFLOAT_MAX };
    CGSize size;
    
    CGRect frame = [self boundingRectWithSize:textSize
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{ NSFontAttributeName:font }
                                                       context:nil];
    size = CGSizeMake(frame.size.width, frame.size.height+1);
    
    if (size.height<minHieght)
        return minHieght;
    
    
    return size.height;

}
@end
