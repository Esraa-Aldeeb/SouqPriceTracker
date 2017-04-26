//
//  DatabaseHelper.h
//
//  Created by Esraa Aldeeb on 6/12/14.
//  Copyright (c) 2014 Esraa Aldeeb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseHelper : FMDatabase
-(void)execQuery:(NSString*)query;
+(id)sharedInstance;


-(void)insertOrDeleteProductFromFavorites:(ProductObject *)product;
-(NSMutableArray *)getFavoritesProducts;
-(BOOL)isProductInFavorites:(NSString *)productId;
@end
