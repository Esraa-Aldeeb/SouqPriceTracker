//
//  ProductTypesObject.h
//  SouqPriceTracker
//
//  Created by MAC on 4/15/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductTypeObject : NSObject
@property (nonatomic,strong)NSString *Id;
@property (nonatomic,strong)NSString *nameSingluar;
@property (nonatomic,strong)NSString *namePluar;
@property (nonatomic,strong)NSString *link;
@property (nonatomic,assign)BOOL isSelected;



-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
