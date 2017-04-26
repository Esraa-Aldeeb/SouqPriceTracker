//
//  AppConstants.h
//  SouqPriceTracker
//
//  Created by Esraa Mac on 18/4/17.
//  Copyright © 2017 Souq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConstants : NSObject


#pragma web service constants

extern NSString * const URL_UNI_BASE_WEB_SERVICE ;
extern NSString * const APP_SECRET ;
extern NSString * const APP_ID ;

extern NSString * const API_PARAM_PRODUCT_TYPE_ID ;
extern NSString * const API_PARAM_PRODUCT_TYPE_SINGULAR ;
extern NSString * const API_PARAM_PRODUCT_TYPE_PLURAL ;
extern NSString * const API_PARAM_PRODUCT_TYPE_LINK ;
extern NSString * const API_PARAM_PAGE_SIZE ;




extern NSString * const API_PARAM_PRODUCT_ID ;
extern NSString * const API_PARAM_PRODUCT_PRODUCT_TYPE_ID ;
extern NSString * const API_PARAM_PRODUCT_PRODUCT_NAME_PLURAL_ID ;
extern NSString * const API_PARAM_PRODUCT_NAME ;
extern NSString * const API_PARAM_PRODUCT_IMAGES ;
extern NSString * const API_PARAM_PRODUCT_IMAGE_XS ;
extern NSString * const API_PARAM_PRODUCT_IMAGE_S ;
extern NSString * const API_PARAM_PRODUCT_IMAGE_M ;
extern NSString * const API_PARAM_PRODUCT_IMAGE_L ;
extern NSString * const API_PARAM_PRODUCT_IMAGE_XL ;
extern NSString * const API_PARAM_PRODUCT_CURRUNCY;
extern NSString * const API_PARAM_PRODUCT_MSRP ;
extern NSString * const API_PARAM_PRODUCT_OFFER_ID ;
extern NSString * const API_PARAM_PRODUCT_OFFER_PRICE ;
extern NSString * const API_PARAM_PRODUCT_LINK ;
extern NSString * const API_PARAM_PRODUCT_RATING;
extern NSString * const API_PARAM_PRODUCT_RATING_COUNT ;
extern NSString * const API_PARAM_PRODUCT_EAN ;
extern NSString * const API_RESPONSE_PRODUCTS_ARRAY ;





extern NSString * const API_RESPONSE_DATA_ARRAY ;
extern NSString * const API_RESPONSE_DATA_TOTAL ;
extern NSString * const API_RESPONSE_META ;


extern NSString * const API_HEADER_NAME ;
extern NSString * const API_HEADER_VALUE ;

#pragma device token for Push Notification
@property NSString *deviceToken;



enum {
    ImageXS  ,
    ImageS ,
    ImageM ,
    ImageL,
    ImageXL,


    
};
typedef NSUInteger ImageTypes;


#pragma app colors

#define BLUE_COLOR [UIColor colorWithRed:0 green:139.0f/255.0f blue:1 alpha:1.0f]
#define GRAY_COLOR [UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1.0f]

@end
