//
//  AppConstants.m
//  SouqPriceTracker
//
//  Created by Esraa Mac on 18/4/17.
//  Copyright © 2017 Souq. All rights reserved.//

#import "AppConstants.h"

@implementation AppConstants

#pragma web service constants
NSString * const URL_UNI_BASE_URL =@"https://api.souq.com";
NSString * const URL_UNI_BASE_WEB_SERVICE =@"https://api.souq.com/v1/";
//NSString * const APP_SECRET =@"y69NFEDL5wNwDLoJHBWK";
//NSString * const APP_ID =@"86708297";

NSString * const APP_SECRET =@"jJmLbeZiFvSUy8QLvZC5";
NSString * const APP_ID =@"64881238";



NSString * const API_PARAM_PRODUCT_TYPE_ID =@"id";
NSString * const API_PARAM_PRODUCT_TYPE_SINGULAR =@"label_singular";
NSString * const API_PARAM_PRODUCT_TYPE_PLURAL =@"label_plural";
NSString * const API_PARAM_PRODUCT_TYPE_LINK =@"link";
NSString * const API_PARAM_PAGE_SIZE =@"20";




NSString * const API_PARAM_PRODUCT_ID =@"id";
NSString * const API_PARAM_PRODUCT_PRODUCT_TYPE_ID =@"product_type_id";
NSString * const API_PARAM_PRODUCT_PRODUCT_NAME_PLURAL_ID =@"product_type_label_plural";
NSString * const API_PARAM_PRODUCT_NAME =@"label";
NSString * const API_PARAM_PRODUCT_IMAGES =@"images";
NSString * const API_PARAM_PRODUCT_IMAGE_XS =@"XS";
NSString * const API_PARAM_PRODUCT_IMAGE_S =@"S";
NSString * const API_PARAM_PRODUCT_IMAGE_M =@"M";
NSString * const API_PARAM_PRODUCT_IMAGE_L =@"L";
NSString * const API_PARAM_PRODUCT_IMAGE_XL =@"XL";
NSString * const API_PARAM_PRODUCT_CURRUNCY =@"currency";
NSString * const API_PARAM_PRODUCT_MSRP =@"msrp";
NSString * const API_PARAM_PRODUCT_OFFER_ID =@"offer_id";
NSString * const API_PARAM_PRODUCT_OFFER_PRICE =@"offer_price";
NSString * const API_PARAM_PRODUCT_LINK =@"link";
NSString * const API_PARAM_PRODUCT_RATING =@"rating";
NSString * const API_PARAM_PRODUCT_RATING_COUNT =@"ratings_count";
NSString * const API_PARAM_PRODUCT_EAN =@"ean";




NSString * const API_RESPONSE_PRODUCTS_ARRAY =@"products";

NSString * const API_RESPONSE_DATA_ARRAY =@"data";
NSString * const API_RESPONSE_DATA_TOTAL =@"total";
NSString * const API_RESPONSE_META =@"meta";



NSString * const API_HEADER_NAME =@"User-Agent";
NSString * const API_HEADER_VALUE =@"APISouqConsumer";

@end
