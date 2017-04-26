//
//  AppUrls.h
//  SouqPriceTracker
//
//  Created by Esraa Mac on 18/4/17.
//  Copyright © 2017 Souq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUrls : NSObject
+(NSString *)getProductTypesUrlWithPageNumber:(int)pageNumber;
+(NSString *)getProductsUrlWithPageNumber:(int)pageNumber productTypes:(NSMutableArray *)selectedProductTypes searchText:(NSString *)searchText;
@end
