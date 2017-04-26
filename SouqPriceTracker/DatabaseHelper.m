//
//  DatabaseHelper.m
//
//  Created by Esraa Aldeeb on 6/12/14.
//  Copyright (c) 2014 Esraa Aldeeb. All rights reserved.
//
//

#import "DatabaseHelper.h"
@implementation DatabaseHelper
static NSArray *paths;
static NSString *path;
-(void)execQuery:(NSString*)query
{

    
    [sharedInstance open];
    
    
    [sharedInstance executeUpdate:query];
    
    [sharedInstance close];

}




static dispatch_once_t pred;
static DatabaseHelper *sharedInstance = nil;

+(id)sharedInstance
{
    
    dispatch_once(&pred, ^{
        
        
        paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Souq.sqlite"];
        
        sharedInstance = [DatabaseHelper databaseWithPath:path];
        
        
        
    });
    return sharedInstance;
}
-(BOOL)isProductInFavorites:(NSString *)productId{
    
    NSString *query = [NSString stringWithFormat:@"select *  from Product where ID=%@",productId];
    
    
    [sharedInstance open];
    
    
    FMResultSet *results = [sharedInstance executeQuery:query];
    
    BOOL isExist = NO;
    if([results next]) {
        
        
        isExist = YES;
        
        
    }
    [sharedInstance close];
    return isExist;
    

    
}


-(NSMutableArray *)getFavoritesProducts{
    
    NSString *query = @"select *  from Product";
    
    
    [sharedInstance open];
    
    
    FMResultSet *results = [sharedInstance executeQuery:query];
    
    NSMutableArray *All = [NSMutableArray new];
    while([results next]) {
        
        

        ProductObject *product = [ProductObject new];
        product.Id = [results stringForColumn:@"ID"];
        product.productTypeId = [results stringForColumn:@"PRODUCT_TYPE_ID"];
        product.productTypePluralName = [results stringForColumn:@"PRODUCT_TYPE_LABEL_PLURAL"];
        product.name = [results stringForColumn:@"LABEL"];
        product.currency = [results stringForColumn:@"CURRENCY"];
        product.msrp = [results stringForColumn:@"MSRP"];
        product.offerId = [results stringForColumn:@"OFFER_ID"];
        product.offerPrice = [results stringForColumn:@"OFFER_PRICE"];
        product.link = [results stringForColumn:@"LINK"];
        product.rating = [results stringForColumn:@"RATING"];
        product.ratingCount = [results stringForColumn:@"RATINGS_COUNT"];
        product.imageS = [[ProductImageObject alloc]initImageUrl:[results stringForColumn:@"IMAGES_S"] imageType:ImageS];
        product.imageXS = [[ProductImageObject alloc]initImageUrl:[results stringForColumn:@"IMAGES_XS"] imageType:ImageXS];
        product.imageM = [[ProductImageObject alloc]initImageUrl:[results stringForColumn:@"IMAGES_M"] imageType:ImageM];
        product.imageL = [[ProductImageObject alloc]initImageUrl:[results stringForColumn:@"IMAGES_L"] imageType:ImageL];
        product.imageXL = [[ProductImageObject alloc]initImageUrl:[results stringForColumn:@"IMAGES_XL"] imageType:ImageXL];

        
        product.isFavorites =  YES;
        
        [All addObject:product];
        
    }
    [sharedInstance close];
    return All;
    
    
    
}



-(void)insertOrDeleteProductFromFavorites:(ProductObject *)product{
    
    
    NSString *query  =@"";
    
    if (product.isFavorites){
        
        
        query = [NSString stringWithFormat:@"delete from Product where ID=%@",product.Id];
        
        
    }else{
        
query = [NSString stringWithFormat:@"INSERT INTO Product (ID, PRODUCT_TYPE_ID,PRODUCT_TYPE_LABEL_PLURAL,LABEL,IMAGES_XS,IMAGES_S,IMAGES_M,IMAGES_L,IMAGES_XL,CURRENCY,MSRP,OFFER_ID,OFFER_PRICE,LINK,RATING,RATINGS_COUNT) VALUES (%@, '%@', '%@', '%@', '%@','%@','%@','%@' , '%@', '%@', '%@', '%@','%@','%@','%@','%@');",product.Id,product.productTypeId,product.productTypePluralName,product.name,product.imageXS.imageUrl,product.imageS.imageUrl,product.imageM.imageUrl,product.imageL.imageUrl,product.imageXL.imageUrl,product.currency,product.msrp,product.offerId,product.offerPrice,product.link,product.rating,product.ratingCount];

        
        
        
    }
    
    
    [sharedInstance execQuery:query];
    
    
}

@end
