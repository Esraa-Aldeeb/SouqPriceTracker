//
//  AppUtility.m
//
//  Created by Esraa Mac on 1/2/16.
//  Copyright © 2016 Esraa Mac. All rights reserved.
//

#import "AppUtility.h"

@implementation AppUtility
+(NSString *)getProductTypesIds:(NSMutableArray *)selectedProductTypes{
    
    NSMutableArray *strings = [NSMutableArray new];
    
    for(ProductTypeObject *productType in selectedProductTypes) {
        
        
        [strings addObject:productType.Id];
    }
    
    
    return [strings componentsJoinedByString:@","];
    
}
@end
