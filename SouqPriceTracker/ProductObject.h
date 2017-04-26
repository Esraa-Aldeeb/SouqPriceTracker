//
//  ProductsObject.h
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductImageObject.h"


@interface ProductObject : NSObject
@property (nonatomic,strong)NSString *Id;
@property (nonatomic,strong)NSString *productTypeId;
@property (nonatomic,strong)NSString *productTypePluralName;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *currency;
@property (nonatomic,strong)NSString *msrp;
@property (nonatomic,strong)NSString *offerId;
@property (nonatomic,strong)NSString *offerPrice;
@property (nonatomic,strong)NSString *link;
@property (nonatomic,strong)NSString *rating;
@property (nonatomic,strong)NSString *ratingCount;
@property (nonatomic,assign)BOOL isFavorites;


@property (nonatomic,strong)ProductImageObject *imageXS   ;
@property (nonatomic,strong)ProductImageObject *imageS   ;
@property (nonatomic,strong)ProductImageObject *imageM   ;
@property (nonatomic,strong)ProductImageObject *imageL   ;
@property (nonatomic,strong)ProductImageObject *imageXL   ;

@property (nonatomic,strong)NSMutableArray *allEan;
-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
