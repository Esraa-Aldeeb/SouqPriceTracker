//
//  AppWrapper.m
//
//  Created by Esraa iMac on 2/10/16.
//  Copyright © 2016 Itc-international. All rights reserved.
//

#import "AppWrapper.h"



@implementation AppWrapper



+(void)getProductTypesWithPageNumber:(int)pageNumber withProgress:(BOOL)withProgress completion:(void(^)(NSMutableArray *,int total))completion{
    
    
    [[AppConnections sharedInstance]requestWithAPI:[AppUrls getProductTypesUrlWithPageNumber:pageNumber] parameters:nil  showProgress:withProgress headerField:@{API_HEADER_NAME:API_HEADER_VALUE} completion:^(id response){
        
        
        
        
        NSDictionary *result = (NSDictionary *)response;
        
        
        NSMutableArray *AllData = [NSMutableArray new];
        
        for (NSDictionary *dic in result[API_RESPONSE_DATA_ARRAY]){
            
            
            ProductTypeObject *model = [[ProductTypeObject alloc]initWithDictionary:dic];
            [AllData addObject:model];
            
            
        }
        
        
        
        completion(AllData,[result[API_RESPONSE_META][API_RESPONSE_DATA_TOTAL]intValue]);
        
        
        
        
        
        
        
        
        
    }];
    
}



+(void)getProductsWithPageNumber:(int)pageNumber  selectedProductTypes:(NSMutableArray *)selectedProdutTypes searchText:(NSString *)searchText withProgress:(BOOL)withProgress completion:(void(^)(NSMutableArray *,int total))completion{
    NSLog(@"%lu",(unsigned long)selectedProdutTypes.count);
    
    [[AppConnections sharedInstance]requestWithAPI:[AppUrls getProductsUrlWithPageNumber:pageNumber productTypes:selectedProdutTypes searchText:searchText] parameters:nil  showProgress:withProgress headerField:@{API_HEADER_NAME:API_HEADER_VALUE} completion:^(id response){
        
        
        
        
        NSDictionary *result = (NSDictionary *)response;
        
        
        NSMutableArray *AllData = [NSMutableArray new];
        
        for (NSDictionary *dic in result[API_RESPONSE_DATA_ARRAY][API_RESPONSE_PRODUCTS_ARRAY]){
            
            
            ProductObject *model = [[ProductObject alloc]initWithDictionary:dic];
            [AllData addObject:model];
            
            
        }
        
       completion(AllData,[result[API_RESPONSE_META][API_RESPONSE_DATA_TOTAL]intValue]);
        
    }];
    
}




@end
