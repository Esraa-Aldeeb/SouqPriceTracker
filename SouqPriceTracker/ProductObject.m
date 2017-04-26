//
//  ProductsObject.m
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ProductObject.h"

@implementation ProductObject
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    
    if (self){
        
        self.Id                             = dic[API_PARAM_PRODUCT_ID];
        self.productTypeId                  = dic[API_PARAM_PRODUCT_PRODUCT_TYPE_ID];
        self.productTypePluralName          = dic[API_PARAM_PRODUCT_PRODUCT_NAME_PLURAL_ID];
        self.name                           = dic[API_PARAM_PRODUCT_NAME];
        self.currency                       = dic[API_PARAM_PRODUCT_CURRUNCY];
        self.msrp                           = dic[API_PARAM_PRODUCT_MSRP];
        self.offerId                        = dic[API_PARAM_PRODUCT_OFFER_ID];
        self.offerPrice                     = dic[API_PARAM_PRODUCT_OFFER_PRICE];
        self.link                           = dic[API_PARAM_PRODUCT_LINK];
        self.rating                         = dic[API_PARAM_PRODUCT_RATING];
        self.ratingCount                    = dic[API_PARAM_PRODUCT_RATING_COUNT];
        
        
        
        
        self.imageXS = [[ProductImageObject alloc]initImageUrl:dic[API_PARAM_PRODUCT_IMAGES][API_PARAM_PRODUCT_IMAGE_XS][0] imageType:ImageXS];
        
        
        self.imageS = [[ProductImageObject alloc]initImageUrl:dic[API_PARAM_PRODUCT_IMAGES][API_PARAM_PRODUCT_IMAGE_S][0] imageType:ImageS];
        
        self.imageM = [[ProductImageObject alloc]initImageUrl:dic[API_PARAM_PRODUCT_IMAGES][API_PARAM_PRODUCT_IMAGE_M][0] imageType:ImageM];
        
        self.imageL = [[ProductImageObject alloc]initImageUrl:dic[API_PARAM_PRODUCT_IMAGES][API_PARAM_PRODUCT_IMAGE_L][0] imageType:ImageL];
        
        self.imageXL = [[ProductImageObject alloc]initImageUrl:dic[API_PARAM_PRODUCT_IMAGES][API_PARAM_PRODUCT_IMAGE_XL][0] imageType:ImageXL];
        
        
        
        
        self.allEan = [NSMutableArray new];
        for (NSString *string in dic[API_PARAM_PRODUCT_EAN]){
            
            [self.allEan addObject:string];
        }
        
        
        
        self.isFavorites = [[DatabaseHelper sharedInstance]isProductInFavorites:self.Id];
        
    }
    
    
    
    
    return self;
    
}



@end
