//
//  ProductImagesObject.h
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductImageObject : NSObject
@property (nonatomic,strong)NSString *imageUrl;
@property (nonatomic,assign)ImageTypes imageType;

-(instancetype)initImageUrl:(NSString *)imageUrl  imageType:(ImageTypes)imageType;

@end
