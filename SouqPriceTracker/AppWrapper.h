//
//  AppWrapper.h
//
//  Created by Esraa iMac on 2/10/16.
//  Copyright © 2016 Itc-international. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConnections.h"
#import "ProductTypeObject.h"
#import "ProductObject.h"
@interface AppWrapper : NSObject 

+(void)getProductTypesWithPageNumber:(int)pageNumber withProgress:(BOOL)withProgress completion:(void(^)(NSMutableArray *,int total))completion;

+(void)getProductsWithPageNumber:(int)pageNumber  selectedProductTypes:(NSMutableArray *)selectedProdutTypes searchText:(NSString *)searchText withProgress:(BOOL)withProgress completion:(void(^)(NSMutableArray *,int total))completion;
@end
