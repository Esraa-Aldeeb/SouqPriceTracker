//
//  ProductImagesObject.m
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ProductImageObject.h"

@implementation ProductImageObject
-(instancetype)initImageUrl:(NSString *)imageUrl  imageType:(ImageTypes)imageType{
    
    self = [super init];
    
    if (self){
        
        self.imageUrl             = imageUrl;
        self.imageType      = imageType;
        
    }
        return self;
    }

@end
