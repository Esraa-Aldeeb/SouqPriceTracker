//
//  AppUrls.m
//  SouqPriceTracker
//
//  Created by Esraa Mac on 18/4/17.
//  Copyright © 2017 Souq. All rights reserved.
//

#import "AppUrls.h"
#import "MyDataController.h"

@implementation AppUrls

+(NSString *)getProductTypesUrlWithPageNumber:(int)pageNumber{

    
    NSLog(@"%@%@",APP_ID,APP_SECRET);
    return [NSString stringWithFormat:@"products/types?page=%d&show=%@&language=en&format=json&app_id=%@&app_secret=%@",pageNumber,API_PARAM_PAGE_SIZE,APP_ID,APP_SECRET];
    
}


+(NSString *)getProductsUrlWithPageNumber:(int)pageNumber productTypes:(NSMutableArray *)selectedProductTypes searchText:(NSString *)searchText{
    
    
    MyDataController *dataController = [MyDataController sharedDataController];
    NSLog(@"%lu",dataController.selectTypesArray.count);
    
 
    return [NSString stringWithFormat:@"products?q=%@&product_types=%@&page=%d&show=%@&show_attributes=1&country=ae&language=en&format=json&app_id=%@&app_secret=%@",searchText,[AppUtility getProductTypesIds:dataController.selectTypesArray],pageNumber,API_PARAM_PAGE_SIZE,APP_ID,APP_SECRET];

    
}
@end
