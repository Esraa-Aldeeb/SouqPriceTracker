//
//  ProductTypesObject.m
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ProductTypeObject.h"

@implementation ProductTypeObject
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    
    if (self){
        
        self.Id             = dic[API_PARAM_PRODUCT_TYPE_ID];
        self.namePluar      = dic[API_PARAM_PRODUCT_TYPE_PLURAL];
        self.nameSingluar   = dic[API_PARAM_PRODUCT_TYPE_SINGULAR];
        self.link           = dic[API_PARAM_PRODUCT_TYPE_LINK];
        
        self.isSelected     = NO;
        
    }
    return self;
    
}


@end
